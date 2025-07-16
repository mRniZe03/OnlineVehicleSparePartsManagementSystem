package dao.admin;

import util.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminDashboardDAOImpl implements AdminDashboardDAO {

    private final Connection con;

    public AdminDashboardDAOImpl() {
        this.con = DBconnection.getConnection();
    }

    @Override
    public int fetchTotalSpareParts() {
        return getCount("SELECT COUNT(*) FROM spare_parts where status='active'");
    }

    @Override
    public int fetchNewOrdersCount() {
        return getCount("SELECT COUNT(*) FROM user_order WHERE status = 'pending'");
    }

    @Override
    public int fetchPendingDeliveriesCount() {
        return getCount("SELECT COUNT(*) FROM user_order WHERE status = 'shipping'");
    }

    @Override
    public int fetchRegisteredUsersCount() {
        return getCount("SELECT COUNT(*) FROM user");
    }

    @Override
    public int fetchTotalSuppliersCount() {
        return getCount("SELECT COUNT(*) FROM supplier");
    }

    private int getCount(String query) {
        try (PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    @Override
    public Map<String, Integer> getRecentMonthlyOrderCounts() {
        Map<String, Integer> orderStats = new LinkedHashMap<>();

        String sql = "SELECT DATE_FORMAT(order_date, '%M') AS month_name, COUNT(*) AS order_count, " +
                     "MONTH(order_date) AS month_number " +
                     "FROM user_order " +
                     "GROUP BY month_number, month_name " +
                     "ORDER BY month_number";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String month = rs.getString("month_name");
                int count = rs.getInt("order_count");
                orderStats.put(month, count);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderStats;
    }

    public Map<String, Double> fetchMonthlyRevenue() {
        Map<String, Double> revenueMap = new LinkedHashMap<>();
        try (Connection conn = DBconnection.getConnection()) {
            String sql = "SELECT DATE_FORMAT(order_date, '%b') AS month, SUM(linetotal) AS total " +
                         "FROM user_product " +
                         "WHERE order_date >= CURDATE() - INTERVAL 4 MONTH " +
                         "GROUP BY month " +
                         "ORDER BY MIN(order_date)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                revenueMap.put(rs.getString("month"), rs.getDouble("total"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenueMap;
    }

    public Map<String, Integer> fetchTop3SellingParts() {
        Map<String, Integer> topParts = new LinkedHashMap<>();
        try (Connection conn = DBconnection.getConnection()) {
            String sql = "SELECT part_name, SUM(quantity) AS total_sold " +
                         "FROM user_product " +
                         "WHERE order_date >= CURDATE() - INTERVAL 4 MONTH " +
                         "GROUP BY part_name " +
                         "ORDER BY total_sold DESC LIMIT 3";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                topParts.put(rs.getString("part_name"), rs.getInt("total_sold"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return topParts;
    }


}
