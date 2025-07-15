package dao.supplier;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.DBconnection;

public class SparePartReportDAO {
	
	 public int getLowStockCount(int supplierid) {
	        int count = 0; 
	      
	        try (Connection con = DBconnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(
	        	 "SELECT COUNT(*) FROM spare_parts " +
                  "WHERE quantity <=5 " +
	        	  "AND supplierid = ? " +
                  "AND status ='active'")){
	              
	         stmt.setInt(1, supplierid);
	         ResultSet rs = stmt.executeQuery();
	        		
	        		
	            if (rs.next()) {
	                count = rs.getInt(1);  
	            }
	            
	        } catch (SQLException e) {
	           
	            e.printStackTrace();
	        }
	        
	        return count;  // Return the count of low stock items
	    }
	    public int getSparepartCount(int supplierid) {
	        int count = 0; 
	      
	        try(Connection con = DBconnection.getConnection();
	                PreparedStatement stmt = con.prepareStatement(
	                        "SELECT COUNT(*) FROM spare_parts WHERE supplierid = ? AND status='active'")) {

	               stmt.setInt(1, supplierid);
	               ResultSet rs = stmt.executeQuery();
	               if (rs.next()) {
	                   count = rs.getInt(1);
	               }
	            
	        } catch (SQLException e) {
	           
	            e.printStackTrace();
	        }
	        
	        return count;  // Return the count of low stock items
	    }
	 
	    public BigDecimal getAdditionalIncome(int supplierId) {
	    	
	        BigDecimal income = BigDecimal.ZERO;
	        
	        String sql = "SELECT SUM(co.amount * sp.price) AS income FROM companyorders co " +
                    "JOIN notifications n ON co.request_id = n.request_id " +
                    "JOIN spare_parts sp ON co.spare_id = sp.spare_id " +
                    "WHERE co.supplierid = ? AND n.action_status = 'accepted'"+
                    "AND co.orderdate = CURRENT_DATE";

	        try (Connection con = DBconnection.getConnection();
	             PreparedStatement stmt = con.prepareStatement(sql)) {
	            stmt.setInt(1, supplierId);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                income = rs.getBigDecimal("income");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return income != null ? income : BigDecimal.ZERO;
	    }
	    public List<Map<String, String>>  getRecentOrders(int supplierid) {
	        List<Map<String, String>> orders = new ArrayList<>();

	        String sql =  "SELECT co.request_id, sp.name AS part_name, co.amount " +
                    "FROM companyorders co JOIN spare_parts sp ON co.spare_id = sp.spare_id " +
                    "WHERE co.supplierid = ? ORDER BY co.orderdate DESC LIMIT 5";

	   
	        try (Connection con = DBconnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setInt(1, supplierid);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                Map<String, String> order = new HashMap<>();
	                order.put("request_id", rs.getString("request_id"));
	                order.put("part_name", rs.getString("part_name"));
	                order.put("amount", String.valueOf(rs.getInt("amount")));
	                orders.add(order);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return orders;
	    }
	    public int getNewOrdersCount(int supplierid) {
	        int count = 0;
	        try (Connection con = DBconnection.getConnection();
	             PreparedStatement stmt = con.prepareStatement(
	                 "SELECT COUNT(*) FROM companyorders " +
	                 "WHERE supplierid = ? " +
	                 "AND status = 'order'")) {
	                 
	            stmt.setInt(1, supplierid);
	            ResultSet rs = stmt.executeQuery();
	            
	            if (rs.next()) {
	                count = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return count;
	    }
	    public Map<String, Integer> getSparePartCountByCategory(int supplierId) {
	        Map<String, Integer> categoryCounts = new HashMap<>();
	        String sql = "SELECT category, COUNT(*) AS count FROM spare_parts WHERE supplierid = ? GROUP BY category";

	        try (Connection con = DBconnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setInt(1, supplierId);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                categoryCounts.put(rs.getString("category"), rs.getInt("count"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return categoryCounts;
	    }


	    
	    
	 


}
