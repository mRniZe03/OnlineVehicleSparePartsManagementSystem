package dao.supplier;

import java.sql.*;
import java.util.*;
import model.SupplierCompanyOrderModel;
import model.SupplierSparePartModel;
import util.DBconnection;
import java.util.Base64;

public class SupplierOrderDAO {

    public List<SupplierCompanyOrderModel> getOrdersBySupplierId(int supplierId) {
        List<SupplierCompanyOrderModel> orders = new ArrayList<>();
        try (Connection con = DBconnection.getConnection()) {
            String sql = "SELECT * FROM companyorders WHERE supplierid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, supplierId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SupplierCompanyOrderModel order = new SupplierCompanyOrderModel();
                order.setRequest_id(rs.getString("request_id"));
                order.setSpare_id(rs.getString("spare_id"));
                order.setAdminid(rs.getInt("adminid"));
                order.setSupplierid(rs.getInt("supplierid"));
                order.setAmount(rs.getInt("amount"));
                order.setStatus(rs.getString("status"));
                order.setReason(rs.getString("reason"));
                order.setOrderdate(rs.getDate("orderdate"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public SupplierCompanyOrderModel getOrderById(String requestId, String spareId, int supplierId) {
        try (Connection con = DBconnection.getConnection()) {
            String sql = "SELECT * FROM companyorders WHERE request_id = ? AND spare_id = ? AND supplierid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, requestId);
            ps.setString(2, spareId);
            ps.setInt(3, supplierId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new SupplierCompanyOrderModel(
                        rs.getString("request_id"),
                        rs.getString("spare_id"),
                        rs.getInt("adminid"),
                        rs.getInt("supplierid"),
                        rs.getInt("amount"),
                        rs.getString("status"),
                        rs.getString("reason")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public SupplierSparePartModel getSparePartById(String spareId) {
        SupplierSparePartModel sparePart = null;
        String sql = "SELECT * FROM spare_parts WHERE spare_id = ? AND status = 'order'";
        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, spareId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sparePart = new SupplierSparePartModel(
                        rs.getString("spare_id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getString("category"),
                        rs.getInt("quantity"),
                        rs.getString("description"),
                        rs.getBytes("spare_photo")
                );
                sparePart.setSupplierid(rs.getInt("supplierid"));
                byte[] photoBytes = rs.getBytes("spare_photo");
                if (photoBytes != null && photoBytes.length > 0) {
                    String photoBase64 = Base64.getEncoder().encodeToString(photoBytes);
                    sparePart.setPhotoBase64(photoBase64);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sparePart;
    }

    public SupplierCompanyOrderModel getOrderDetails(int supplierid) {
        String sql = "SELECT * FROM companyorders WHERE supplierid = ?";
        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, supplierid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new SupplierCompanyOrderModel(
                        rs.getString("request_id"),
                        rs.getString("spare_id"),
                        rs.getInt("adminid"),
                        rs.getInt("supplierid"),
                        rs.getInt("amount"),
                        rs.getString("status"),
                        rs.getString("reason")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateOrderStatus(String request_id, String newStatus) {
        String sql = "UPDATE companyorders SET status = ? WHERE request_id = ?";
        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setString(2, request_id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateSparePartsQuantity(String request_id, int supplierid) {
        String getDetailsSql = "SELECT spare_id, amount FROM companyorders WHERE request_id = ? AND supplierid = ?";
        String updateSql = "UPDATE spare_parts SET quantity = quantity + ? WHERE spare_id = ?";
        try (Connection con = DBconnection.getConnection(); PreparedStatement ps1 = con.prepareStatement(getDetailsSql)) {
            ps1.setString(1, request_id);
            ps1.setInt(2, supplierid);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                String spareId = rs.getString("spare_id");
                int amount = rs.getInt("amount");
                try (PreparedStatement ps2 = con.prepareStatement(updateSql)) {
                    ps2.setInt(1, amount);
                    ps2.setString(2, spareId);
                    return ps2.executeUpdate() > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean acceptOrderAndNotify(String requestId, String spareId, int supplierId, int amount) {
        try (Connection con = DBconnection.getConnection()) {
            con.setAutoCommit(false);

            PreparedStatement updateOrder = con.prepareStatement(
                "UPDATE companyorders SET status = 'accepted' WHERE request_id = ?");
            updateOrder.setString(1, requestId);
            updateOrder.executeUpdate();

            PreparedStatement updateStock = con.prepareStatement(
                "UPDATE spare_parts SET quantity = quantity + ? WHERE spare_id = ?");
            updateStock.setInt(1, amount);
            updateStock.setString(2, spareId);
            updateStock.executeUpdate();

            PreparedStatement insertNotif = con.prepareStatement(
                "INSERT INTO notifications (request_id, supplierid, action_status) VALUES (?, ?, 'accepted')");
            insertNotif.setString(1, requestId);
            insertNotif.setInt(2, supplierId);
            insertNotif.executeUpdate();

            con.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean declineOrderAndNotify(String requestId, int supplierId) {
        try (Connection con = DBconnection.getConnection()) {
            con.setAutoCommit(false);

            PreparedStatement updateOrder = con.prepareStatement(
                "UPDATE companyorders SET status = 'declined' WHERE request_id = ?");
            updateOrder.setString(1, requestId);
            updateOrder.executeUpdate();

            PreparedStatement insertNotif = con.prepareStatement(
                "INSERT INTO notifications (request_id, supplierid, action_status) VALUES (?, ?, 'declined')");
            insertNotif.setString(1, requestId);
            insertNotif.setInt(2, supplierId);
            insertNotif.executeUpdate();

            con.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Additional methods for report generation

    public String getSpareIdByRequestId(String requestId) {
        String spareId = null;
        String sql = "SELECT spare_id FROM companyorders WHERE request_id = ?";
        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, requestId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                spareId = rs.getString("spare_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return spareId;
    }

    public int getAmountByRequestId(String requestId) {
        int amount = 0;
        String sql = "SELECT amount FROM companyorders WHERE request_id = ?";
        try (Connection con = DBconnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, requestId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                amount = rs.getInt("amount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return amount;
    }
}
