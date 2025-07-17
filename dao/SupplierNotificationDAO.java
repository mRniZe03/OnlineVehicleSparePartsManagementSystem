package dao.supplier;

import model.SupplierNotificationModel;
import util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierNotificationDAO {

    public boolean insertNotification(String requestId, int supplierId, String actionStatus) {
        String sql = "INSERT INTO notifications (request_id, supplierid, action_status) VALUES (?, ?, ?)";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, requestId);
            ps.setInt(2, supplierId);
            ps.setString(3, actionStatus);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<SupplierNotificationModel> getNotificationsBySupplierId(int supplierId) {
        List<SupplierNotificationModel> list = new ArrayList<>();

        String sql = "SELECT * FROM notifications WHERE supplierid = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, supplierId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SupplierNotificationModel model = new SupplierNotificationModel();
                model.setNotification_id(rs.getString("notification_id"));
                model.setRequest_id(rs.getString("request_id"));
                model.setSupplierid(rs.getInt("supplierid"));
                model.setAction_status(rs.getString("action_status"));  // fixed column name

                list.add(model);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
