package service.user;

import model.AddCartModel;
import util.DBconnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

public class AddCartService {

	public static boolean insertToCart(AddCartModel cart) {
        boolean isSuccess = false;

        String sql = "INSERT INTO add_cart (part_id, user_id, user_name, part_name, category, quantity, unitprice, linetotal) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, cart.getPart_id());
            ps.setInt(2, cart.getUser_id());
            ps.setString(3, cart.getUser_name());
            ps.setString(4, cart.getPart_name());
            ps.setString(5, cart.getCategory());
            ps.setInt(6, cart.getQuantity());
            ps.setBigDecimal(7, cart.getUnitprice());
            ps.setBigDecimal(8, cart.getLinetotal());

            isSuccess = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
	
	public static List<AddCartModel> getUserCartItems(int userId) {
	    List<AddCartModel> list = new ArrayList<>();

	    try (Connection con = DBconnection.getConnection()) {
	        String sql = "SELECT * FROM add_cart WHERE user_id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            AddCartModel cart = new AddCartModel(
	                rs.getString("part_id"),
	                rs.getInt("user_id"),
	                rs.getString("user_name"),
	                rs.getString("part_name"),
	                rs.getString("category"),
	                rs.getInt("quantity"),
	                rs.getBigDecimal("unitprice"),
	                rs.getBigDecimal("linetotal")
	            );
	            list.add(cart);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	public static BigDecimal calculateSubtotal(int userId) {
	    BigDecimal total = BigDecimal.ZERO;

	    try (Connection con = DBconnection.getConnection()) {
	        String sql = "SELECT SUM(linetotal) FROM add_cart WHERE user_id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            total = rs.getBigDecimal(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return total != null ? total : BigDecimal.ZERO;
	}
	
	public static void updateQuantity(int userId, String partId, int qty, BigDecimal lineTotal) {
	    try (Connection con = DBconnection.getConnection()) {
	        String sql = "UPDATE add_cart SET quantity = ?, linetotal = ? WHERE user_id = ? AND part_id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, qty);
	        ps.setBigDecimal(2, lineTotal);
	        ps.setInt(3, userId);
	        ps.setString(4, partId);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public static void removeCartItem(int userId, String partId) {
	    try (Connection con = DBconnection.getConnection()) {
	        String sql = "DELETE FROM add_cart WHERE user_id = ? AND part_id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ps.setString(2, partId);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	//checkout form 
	 // Reduce stock quantity for a specific part
    public static void reduceStock(String partId, int quantity) {
        String sql = "UPDATE spare_parts SET quantity = quantity - ? WHERE spare_id = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quantity);
            ps.setString(2, partId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Clear all cart items for a specific user
    public static void clearUserCart(int userId) {
        String sql = "DELETE FROM add_cart WHERE user_id = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
      // CLEAR cart
    public static void clearCart(int userId) {
        try (Connection con = DBconnection.getConnection()) {
            String sql = "DELETE FROM add_cart WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

}
