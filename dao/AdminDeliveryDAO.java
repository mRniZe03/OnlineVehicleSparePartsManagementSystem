package dao.admin;

import model.DeliveryPersonModel;
import util.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDeliveryDAO {

    public boolean addDeliveryPerson(DeliveryPersonModel deliveryPerson) {
        boolean isInserted = false;

        try (
            Connection con = DBconnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO vehiclespareparts.delivery (deliverypersonname, deliverypersonemail, deliverypersonusername, deliverypersonphone, deliverypersonpassword) " +
                "VALUES (?, ?, ?, ?, ?)")
        ) {
            ps.setString(1, deliveryPerson.getDeliverypersonname());
            ps.setString(2, deliveryPerson.getDeliverypersonemail());
            ps.setString(3, deliveryPerson.getDeliverypersonusername());
            ps.setString(4, deliveryPerson.getDeliverypersonphone());
            ps.setString(5, deliveryPerson.getDeliverypersonpassword());

            int result = ps.executeUpdate();
            isInserted = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isInserted;
    }

    public List<DeliveryPersonModel> getAllDeliveryPersons() {
        List<DeliveryPersonModel> list = new ArrayList<>();
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM delivery");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
            	DeliveryPersonModel d = new DeliveryPersonModel(
                    rs.getInt("deliverypersonid"),
                    rs.getString("deliverypersonname"),
                    rs.getString("deliverypersonemail"),
                    rs.getString("deliverypersonusername"),
                    rs.getString("deliverypersonphone"),
                    rs.getString("deliverypersonpassword")
                );
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateDeliveryPerson(DeliveryPersonModel deliveryPerson) {
        boolean isUpdated = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE delivery SET deliverypersonname = ?, deliverypersonemail = ?, deliverypersonphone = ? WHERE deliverypersonid = ?")) {

            ps.setString(1, deliveryPerson.getDeliverypersonname());
            ps.setString(2, deliveryPerson.getDeliverypersonemail());
            ps.setString(3, deliveryPerson.getDeliverypersonphone());
            ps.setInt(4, deliveryPerson.getDeliverypersonid());

            int rows = ps.executeUpdate();
            isUpdated = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    public boolean deleteDeliveryPerson(int deliverypersonid) {
        boolean isDeleted = false;

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM delivery WHERE deliverypersonid = ?")) {

            ps.setInt(1, deliverypersonid);
            int rows = ps.executeUpdate();
            isDeleted = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isDeleted;
    }
}

