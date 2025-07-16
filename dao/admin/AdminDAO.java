package dao.admin;

import model.AdminModel;
import util.DBconnection;

import java.sql.*;

public class AdminDAO {

    public AdminModel validateLogin(String username, String password) {
        AdminModel admin = null;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE adminusername = ? AND adminpassword = ?")) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                admin = new AdminModel(
                        rs.getInt("adminid"),
                        rs.getString("adminname"),
                        rs.getString("adminemail"),
                        rs.getString("adminusername"),
                        rs.getString("adminpassword")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }

    public AdminModel getAdminByEmail(String email) {
        AdminModel admin = null;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE adminemail = ?")) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                admin = new AdminModel(
                        rs.getInt("adminid"),
                        rs.getString("adminname"),
                        rs.getString("adminemail"),
                        rs.getString("adminusername"),
                        rs.getString("adminpassword")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }

    public boolean updateAdminPassword(String email, String newPassword) {
        boolean isUpdated = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE admin SET adminpassword = ? WHERE adminemail = ?")) {

            ps.setString(1, newPassword);
            ps.setString(2, email);

            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    public boolean checkAdminPassword(String email, String password) {
        boolean isValid = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE adminemail = ? AND adminpassword = ?")) {

            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            isValid = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public boolean checkAdminPasswordById(int id, String password) {
        boolean isValid = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE adminid = ? AND adminpassword = ?")) {

            ps.setInt(1, id);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            isValid = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public boolean updateAdminProfile(AdminModel admin) {
        boolean isUpdated = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE admin SET adminname = ?, adminemail = ?, adminusername = ?, adminpassword = ? WHERE adminid = ?")) {

            ps.setString(1, admin.getName());
            ps.setString(2, admin.getEmail());
            ps.setString(3, admin.getUsername());
            ps.setString(4, admin.getPassword());
            ps.setInt(5, admin.getId());

            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    
}


