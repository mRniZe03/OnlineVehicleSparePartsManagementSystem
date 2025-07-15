package dao.supplier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.SupplierModel;
import util.DBconnection;

public class SupplierDAO {
	
	public SupplierModel validateLogin(String supplierusername, String supplierpassword) {
        SupplierModel supplier = null;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM supplier WHERE supplierusername = ? AND supplierpassword = ?")) {

            ps.setString(1, supplierusername);
            ps.setString(2, supplierpassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                supplier = new SupplierModel(
                        rs.getInt("supplierid"),
                        rs.getString("suppliername"),
                        rs.getString("supplieremail"),
                        rs.getString("supplierusername"),
                        rs.getString("supplierphone"),
                        rs.getString("supplierpassword")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return supplier;
    }

    public SupplierModel getSupplierByEmail(String supplieremail) {
        SupplierModel supplier = null;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM supplier WHERE supplieremail = ?")) {

            ps.setString(1, supplieremail);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                supplier = new SupplierModel(
                		  rs.getInt("supplierid"),
                          rs.getString("suppliername"),
                          rs.getString("supplieremail"),
                          rs.getString("supplierusername"),
                          rs.getString("supplierphone"),
                          rs.getString("supplierpassword")
            ); 
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return supplier;
    }

    public boolean updateSupplierPassword(String supplieremail, String newPassword) {
        boolean isUpdated = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE supplier SET supplierpassword = ? WHERE supplieremail = ?")) {

            ps.setString(1, newPassword);
            ps.setString(2, supplieremail);

            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    public boolean checkSupplierPassword(String supplieremail, String supplierpassword) {
        boolean isValid = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM supplier WHERE supplieremail = ? AND supplierpassword = ?")) {

            ps.setString(1, supplieremail);
            ps.setString(2, supplierpassword);
            ResultSet rs = ps.executeQuery();

            isValid = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
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
