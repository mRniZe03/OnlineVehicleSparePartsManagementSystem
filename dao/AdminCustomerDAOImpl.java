package dao.admin;

import model.AdminCustomerModel;
import util.DBconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminCustomerDAOImpl implements AdminCustomerDAO {

    @Override
    public List<AdminCustomerModel> getAllCustomers() {
        List<AdminCustomerModel> customers = new ArrayList<>();

        try (Connection con = DBconnection.getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT * FROM user");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
            	AdminCustomerModel customer = new AdminCustomerModel(
            		    rs.getInt("id"),
            		    rs.getString("email"),
            		    rs.getString("name"),
            		    rs.getString("username"),
            		    rs.getString("password"),
            		    rs.getString("address"),
            		    rs.getString("contactNo")
            		);

                customers.add(customer);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;
    }
}
