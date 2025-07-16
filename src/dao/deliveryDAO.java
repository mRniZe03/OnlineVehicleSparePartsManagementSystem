package dao.deliverypersonnel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.DeliveryPersonModel;
import util.DBconnection;

public class deliveryDAO {
	
	public DeliveryPersonModel validateLogin(String deliverypersonusername, String deliverypersonpassword) {
		DeliveryPersonModel delivery = null;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM delivery WHERE deliverypersonusername = ? AND deliverypersonpassword = ?")) {

           
			ps.setString(1, deliverypersonusername);
            ps.setString(2, deliverypersonpassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                delivery = new DeliveryPersonModel(
                        rs.getInt("deliverypersonid"),
                        rs.getString("deliverypersonname"),
                        rs.getString("deliverypersonemail"),
                        rs.getString("deliverypersonusername"),
                        rs.getString("deliverypersonphone"),
                        rs.getString("deliverypersonpassword")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return delivery;
    }

    public DeliveryPersonModel getDeliverypersonemail(String deliverypersonemail) {
    	DeliveryPersonModel deliveryPerson = null;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM delivery WHERE deliverypersonemail =?")){

            ps.setString(1,deliverypersonemail);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
             deliveryPerson = new DeliveryPersonModel(
                		  rs.getInt("deliverypersonid"),
                          rs.getString("deliverypersonname"),
                          rs.getString("deliverypersonemail"),
                          rs.getString("deliverypersonusername"),
                          rs.getString("deliverypersonphone"),
                          rs.getString("deliverypersonpassword")
            ); 
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deliveryPerson;
    }

    public boolean updatedeliveryPersonPassword(String deliverypersonemail, String newPassword) {
        boolean isUpdated = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE delivery SET deliverypersonpassword = ? WHERE deliverypersonemail = ?")) {

            ps.setString(1, newPassword);
            ps.setString(2, deliverypersonemail);

            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    public boolean checkdeliveryPersonPassword(String deliverypersonemail, String deliverypersonpassword) {
        boolean isValid = false;
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM delivery WHERE deliverypersonEmail = ? AND deliverypersonPassword = ?")) {

            ps.setString(1, deliverypersonemail);
            ps.setString(2, deliverypersonpassword);
            ResultSet rs = ps.executeQuery();

            isValid = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
	
	

}