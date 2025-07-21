package service.user;

import model.UserOrderModel;
import model.UserProductModel;
import util.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class UserOrderServiceImpl implements UserOrderService {

    @Override
    public boolean insertOrder(UserOrderModel order) {
        String sql = "INSERT INTO user_order (order_id, userID, user_name, order_date, total, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, order.getOrderId());
            ps.setInt(2, order.getUserId());
            ps.setString(3, order.getUserName());
            ps.setDate(4, new java.sql.Date(order.getOrderDate().getTime()));
            ps.setBigDecimal(5, order.getTotal());
            ps.setString(6, order.getStatus());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean insertProduct(UserProductModel product) {
        String sql = "INSERT INTO user_product (order_id, `User-ID`, partID, part_name, unitprice, quantity, linetotal, email, phone, first_name, last_name, street_address, city, postcode, country, province, payment_method, order_date) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, product.getOrderId());
            ps.setInt(2, product.getUserId());
            ps.setString(3, product.getPartId());
            ps.setString(4, product.getPartName());
            ps.setBigDecimal(5, product.getUnitPrice());
            ps.setInt(6, product.getQuantity());
            ps.setBigDecimal(7, product.getLineTotal());
            ps.setString(8, product.getEmail());
            ps.setString(9, product.getPhone());
            ps.setString(10, product.getFirstName());
            ps.setString(11, product.getLastName());
            ps.setString(12, product.getStreetAddress());
            ps.setString(13, product.getCity());
            ps.setString(14, product.getPostcode());
            ps.setString(15, product.getCountry());
            ps.setString(16, product.getProvince());
            ps.setString(17, product.getPaymentMethod());
            ps.setDate(18, new java.sql.Date(product.getOrderDate().getTime()));

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String generateOrderId() {
        String prefix = "OR-";
        String sql = "SELECT order_id FROM user_order ORDER BY order_id DESC LIMIT 1";
        String lastId = "OR-0000";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                String fetchedId = rs.getString("order_id");
                if (fetchedId != null && fetchedId.startsWith(prefix)) {
                    lastId = fetchedId;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            int idNum = Integer.parseInt(lastId.substring(prefix.length()));
            return prefix + String.format("%04d", idNum + 1);
        } catch (NumberFormatException e) {
            return prefix + "0001";
        }
    }

    @Override
    public List<UserOrderModel> getOrdersByUser(int userId) {
        List<UserOrderModel> list = new ArrayList<>();
        String sql = "SELECT * FROM user_order WHERE userID = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserOrderModel o = new UserOrderModel(
                    rs.getString("order_id"),
                    rs.getInt("userID"),
                    rs.getString("user_name"),
                    rs.getDate("order_date"),
                    rs.getBigDecimal("total"),
                    rs.getString("status")
                );
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean cancelOrder(String orderId) {
        try (Connection con = DBconnection.getConnection()) {
            // Restore stock
            String restoreSql = "UPDATE spare_parts sp JOIN user_product up ON sp.spare_id = up.partID SET sp.quantity = sp.quantity + up.quantity WHERE up.order_id = ?";
            PreparedStatement psRestore = con.prepareStatement(restoreSql);
            psRestore.setString(1, orderId);
            psRestore.executeUpdate();

            // Delete from user_product
            String deleteProducts = "DELETE FROM user_product WHERE order_id = ?";
            PreparedStatement ps1 = con.prepareStatement(deleteProducts);
            ps1.setString(1, orderId);
            ps1.executeUpdate();

            // Delete from user_order
            String deleteOrder = "DELETE FROM user_order WHERE order_id = ?";
            PreparedStatement ps2 = con.prepareStatement(deleteOrder);
            ps2.setString(1, orderId);
            return ps2.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<UserProductModel> getOrderDetailsByOrderId(String orderId) {
        List<UserProductModel> items = new ArrayList<>();
        String sql = "SELECT * FROM user_product WHERE order_id = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UserProductModel product = new UserProductModel(
                    rs.getString("order_id"),
                    rs.getInt("User-ID"),
                    rs.getString("partID"),
                    rs.getString("part_name"),
                    rs.getBigDecimal("unitprice"),
                    rs.getInt("quantity"),
                    rs.getBigDecimal("linetotal"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("street_address"),
                    rs.getString("city"),
                    rs.getString("postcode"),
                    rs.getString("country"),
                    rs.getString("province"),
                    rs.getString("payment_method"),
                    rs.getDate("order_date")
                );
                items.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}
