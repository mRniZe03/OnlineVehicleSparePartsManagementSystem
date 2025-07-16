package dao.admin;

import util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.CompanyOrderModel;
import model.CompanyOrderReportModel;

public class AdminOrderDAOImpl implements AdminOrderDAO {

    @Override
    public boolean insertCompanyOrder(String requestId, String spareId, int adminId, int supplierId, int amount, String status, String reason, String orderdate) throws SQLException {
        String insertSQL = "INSERT INTO companyorders (request_id, spare_id, adminid, supplierid, amount, status, reason, orderdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String checkStockSQL = "SELECT quantity FROM spare_parts WHERE spare_id = ?";
        String updateStockSQL = "UPDATE spare_parts SET quantity = quantity - ? WHERE spare_id = ?";

        try (Connection con = DBconnection.getConnection()) {
            con.setAutoCommit(false); // Start transaction

            if ("remove".equalsIgnoreCase(status)) {
                try (PreparedStatement checkPs = con.prepareStatement(checkStockSQL)) {
                    checkPs.setString(1, spareId);
                    ResultSet rs = checkPs.executeQuery();

                    if (rs.next()) {
                        int currentQty = rs.getInt("quantity");
                        if (currentQty < amount) {
                            throw new SQLException("Not enough stock to remove.");
                        }
                    } else {
                        throw new SQLException("Spare part not found.");
                    }
                }
            }

            try (PreparedStatement ps = con.prepareStatement(insertSQL)) {
                ps.setString(1, requestId);
                ps.setString(2, spareId);
                ps.setInt(3, adminId);
                ps.setInt(4, supplierId);
                ps.setInt(5, amount);
                ps.setString(6, status);
                ps.setString(7, reason);
                ps.setString(8, orderdate);
                ps.executeUpdate();
            }

            if ("remove".equalsIgnoreCase(status)) {
                try (PreparedStatement updatePs = con.prepareStatement(updateStockSQL)) {
                    updatePs.setInt(1, amount);
                    updatePs.setString(2, spareId);
                    updatePs.executeUpdate();
                }
            }

            con.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    @Override
    public CompanyOrderModel getCompanyOrderById(String requestId) {
        CompanyOrderModel order = null;
        String sql = "SELECT * FROM companyorders WHERE request_id = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, requestId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order = new CompanyOrderModel(
                    rs.getString("request_id"),
                    rs.getString("spare_id"),
                    rs.getInt("adminid"),
                    rs.getInt("supplierid"),
                    rs.getInt("amount"),
                    rs.getString("status"),
                    rs.getString("reason"),
                    rs.getString("orderdate")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }
    
    @Override
    public List<CompanyOrderModel> getAllCompanyOrders() {
        List<CompanyOrderModel> orders = new ArrayList<>();
        String sql = "SELECT * FROM companyorders";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CompanyOrderModel order = new CompanyOrderModel(
                    rs.getString("request_id"),
                    rs.getString("spare_id"),
                    rs.getInt("adminid"),
                    rs.getInt("supplierid"),
                    rs.getInt("amount"),
                    rs.getString("status"),
                    rs.getString("reason"),
                    rs.getString("orderdate")
                );
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public CompanyOrderReportModel getFullCompanyOrderReport(String requestId) throws SQLException {
        String sql = "SELECT co.request_id, co.spare_id, co.adminid, co.supplierid, co.amount, co.orderdate, " +
                     "co.status AS order_status, co.reason, " +
                     "sp.name AS spare_name, sp.category, " +
                     "sup.suppliername, sup.supplieremail, " +
                     "n.action_status " +
                     "FROM companyorders co " +
                     "JOIN spare_parts sp ON co.spare_id = sp.spare_id " +
                     "JOIN supplier sup ON co.supplierid = sup.supplierid " +
                     "LEFT JOIN notifications n ON co.request_id = n.request_id " +
                     "WHERE co.request_id = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, requestId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new CompanyOrderReportModel(
                    rs.getString("request_id"),
                    rs.getString("spare_id"),
                    rs.getInt("adminid"),
                    rs.getInt("supplierid"),
                    rs.getInt("amount"),
                    rs.getString("orderdate"),
                    rs.getString("order_status"),
                    rs.getString("reason"),
                    rs.getString("spare_name"),
                    rs.getString("category"),
                    rs.getString("suppliername"),
                    rs.getString("supplieremail"),
                    rs.getString("action_status")
                );
            }
        }

        return null;
    }
}


