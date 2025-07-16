package dao.user;

import java.sql.*;

import model.RegisteredUserModel;
import util.DBconnection;

public class UserDAO {

	// Login validation
    public RegisteredUserModel validateLogin(String username, String password) {
        RegisteredUserModel user = null;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM user WHERE username = ? AND password = ?")) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new RegisteredUserModel(
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("address"),
                    rs.getString("contactNo")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // Email check
    public boolean emailExists(String email) {
        boolean exists = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT 1 FROM user WHERE email = ?")) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }

    // Register user
    public boolean registerUser(RegisteredUserModel user) {
        boolean success = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "INSERT INTO user (name, email, username, password, address, contactNo) VALUES (?, ?, ?, ?, ?, ?)")) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getContactNo());

            success = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    // Reset password
    public boolean resetPassword(String email, String newPassword) {
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE user SET password = ? WHERE email = ?")) {

            ps.setString(1, newPassword);
            ps.setString(2, email);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update user profile
    public boolean updateProfile(RegisteredUserModel user) {
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE user SET name = ?, email = ?, username = ?, password = ?, address = ?, contactNo = ? WHERE id = ?")) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getContactNo());
            ps.setInt(7, user.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete user
    public boolean deleteUser(int id) {
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "DELETE FROM user WHERE id = ?")) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
