package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * This utility class updates the status in the user_order table:
 * - If order_date is today: status = 'pending'
 * - If order_date is yesterday: status = 'shipped'
 * - If order_date is the day before yesterday: status = 'delivered'
 */

public class OrderStatusUpdater {

	 public static void updateOrderStatuses() {
		 try (Connection con = DBconnection.getConnection()) {

	            // Day before yesterday => Delivered
	            String deliveredSql = "UPDATE user_order SET status = 'delivered' WHERE DATE(order_date) = CURDATE() - INTERVAL 2 DAY";
	            PreparedStatement ps1 = con.prepareStatement(deliveredSql);
	            ps1.executeUpdate();

	            // Yesterday => Shipped
	            String shippedSql = "UPDATE user_order SET status = 'shipped' WHERE DATE(order_date) = CURDATE() - INTERVAL 1 DAY";
	            PreparedStatement ps2 = con.prepareStatement(shippedSql);
	            ps2.executeUpdate();

	            // Today => Pending
	            String pendingSql = "UPDATE user_order SET status = 'pending' WHERE DATE(order_date) = CURDATE()";
	            PreparedStatement ps3 = con.prepareStatement(pendingSql);
	            ps3.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}
