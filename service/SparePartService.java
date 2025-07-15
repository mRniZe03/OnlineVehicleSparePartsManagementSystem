package service.supplier;

import model.SupplierSparePartModel;
import model.UserSparePartModel;
import util.DBconnection;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


public class SparePartService {

	//Insert data function
	public static boolean insertdata(String spare_id, String name, BigDecimal price, String category, int quantity,
            String description, byte[] spare_photo, int supplierid, String status) {

         boolean isSuccess = false;

         try (Connection con = DBconnection.getConnection()) {
              String sql = "INSERT INTO spare_parts (spare_id, name, price, category, quantity, description, spare_photo, supplierid, status) " +
              "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

             PreparedStatement stmt = con.prepareStatement(sql);
             stmt.setString(1, spare_id);
             stmt.setString(2, name);
             stmt.setBigDecimal(3, price);
             stmt.setString(4, category);
             stmt.setInt(5, quantity);
             stmt.setString(6, description);
             stmt.setBytes(7, spare_photo);
             stmt.setInt(8, supplierid);
             stmt.setString(9, status);

             int rows = stmt.executeUpdate();
             isSuccess = rows > 0;

            } catch (Exception e) {
                e.printStackTrace();
            }

             return isSuccess;
}
  

	//GetById	
    public static List<SupplierSparePartModel> getById(String Id){
   	 
   	 
   	 
   	 ArrayList<SupplierSparePartModel> sparepart = new ArrayList<>();
   	 
   	 try {
   		 //DBConnection
   		 Connection con=DBconnection.getConnection();
   		 Statement stmt = con.createStatement();
		    
		    //Query
		    String sql = "select * from spare_parts where spare_id = '" + Id + "'";
		    
		    ResultSet rs= stmt.executeQuery(sql);
		    while(rs.next()) {
		    	String spare_id = rs.getString(1);
		    	String name= rs.getString(2);
		    	BigDecimal price= rs.getBigDecimal(3);
		    	String category= rs.getString(4);
		    	int quantity= rs.getInt(5);
		    	String description = rs.getString(6);
	            byte[] spare_photo = rs.getBytes(7);
		    	
		    	SupplierSparePartModel sup = new SupplierSparePartModel(spare_id,name,price,category,quantity, description, spare_photo);
		    	sparepart.add(sup);
		    }
   	 }
   	 catch(Exception e) {
   		 e.printStackTrace();
   	 }
   	 return sparepart;
    }
    //update data
    public static boolean updatedata(String spare_id, String name, BigDecimal price, String category, int quantity, String description, byte[] spare_photo) {
        boolean isSuccess = false;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Connection con = DBconnection.getConnection();
            int currentQuantity = 0;
            String checkQuantitySQL = "SELECT quantity FROM spare_parts WHERE spare_id = ?";
            pstmt = con.prepareStatement(checkQuantitySQL);
            pstmt.setString(1, spare_id);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                currentQuantity = rs.getInt("quantity");
            } else {
                throw new SQLException("Spare part not found with ID: " + spare_id);
            }

            String sql;
           

            if (spare_photo != null && spare_photo.length > 0) {
                sql = "UPDATE spare_parts SET name = ?, price = ?, category = ?, quantity = ?, description = ?, spare_photo = ? WHERE spare_id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setBigDecimal(2, price);
                pstmt.setString(3, category);
                pstmt.setInt(4, quantity);
                pstmt.setString(5, description);
                pstmt.setBytes(6, spare_photo);
                pstmt.setString(7, spare_id);
            } else {
                sql = "UPDATE spare_parts SET name = ?, price = ?, category = ?, quantity = ?, description = ? WHERE spare_id = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setBigDecimal(2, price);
                pstmt.setString(3, category);
                pstmt.setInt(4, quantity);
                pstmt.setString(5, description);
                pstmt.setString(6, spare_id);
            }

            int result = pstmt.executeUpdate();
            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
 // Soft Delete Data
    public static boolean deletedata(String spare_id) {
        boolean isSuccess = false;
        PreparedStatement pstmt = null;

        try {
            Connection con = DBconnection.getConnection();
            String sql = "UPDATE spare_parts SET status = 'inactive' WHERE spare_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, spare_id);
            int rowsAffected = pstmt.executeUpdate();
            isSuccess = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

	 //get photo from database
	 public String getBase64EncodedImage(String spare_id) {
		    String base64Image = null;
		    try {
		    	Connection con = DBconnection.getConnection();
		        String query = "SELECT spare_photo FROM spare_parts WHERE spare_id = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, spare_id);
		        
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            // Get the BLOB (binary data)
		            InputStream blobInputStream = rs.getBinaryStream("spare_photo");
		            byte[] bytes = blobInputStream.readAllBytes();
		            base64Image = Base64.getEncoder().encodeToString(bytes);
		        }
		        con.close();
		    } catch (SQLException | IOException e) {
		        e.printStackTrace();
		    }
		    return base64Image;
		}
	 public static List<SupplierSparePartModel> getPartsBySupplierId(int supplierid) {
	        List<SupplierSparePartModel> list = new ArrayList<>();
	        try (Connection con = DBconnection.getConnection();
	             PreparedStatement stmt = con.prepareStatement("SELECT * FROM spare_parts WHERE supplierid = ? AND status = 'active'")) {
	            stmt.setInt(1, supplierid);
	            
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                SupplierSparePartModel sp = new SupplierSparePartModel(
	                        rs.getString("spare_id"),
	                        rs.getString("name"),
	                        rs.getBigDecimal("price"),
	                        rs.getString("category"),
	                        rs.getInt("quantity"),
	                        rs.getString("description"),
	                        rs.getBytes("spare_photo")
	                );
	                list.add(sp);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	 
	 
	 public static UserSparePartModel getSparePartById(String spare_id) {
	        UserSparePartModel part = null;

	        try (Connection con = DBconnection.getConnection()) {
	            String sql = "SELECT * FROM spare_parts WHERE spare_id = ?";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, spare_id);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                String name = rs.getString("name");
	                BigDecimal price = rs.getBigDecimal("price");
	                String category = rs.getString("category");
	                int quantity = rs.getInt("quantity");
	                String description = rs.getString("description");
	                byte[] spare_photo = rs.getBytes("spare_photo");
	                String photoBase64 = (spare_photo != null) ? Base64.getEncoder().encodeToString(spare_photo) : "";
	                int supplierid = rs.getInt("supplierid");
	                String status = rs.getString("status");

	                part = new UserSparePartModel(
	                        spare_id, name, price, category, quantity, description, spare_photo, photoBase64, supplierid,status
	                );
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return part;
	    }
	 
	//method to filter parts by category(search bar)
	    public static List<UserSparePartModel> getSparePartsByCategory(String category) {
	        List<UserSparePartModel> list = new ArrayList<>();
	        try (Connection con = DBconnection.getConnection()) {
	            String sql = "SELECT * FROM spare_parts WHERE status = 'active' AND LOWER(category) = LOWER(?)";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, category);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                String spare_id = rs.getString("spare_id");
	                String name = rs.getString("name");
	                BigDecimal price = rs.getBigDecimal("price");
	                int quantity = rs.getInt("quantity");
	                String description = rs.getString("description");
	                byte[] spare_photo = rs.getBytes("spare_photo");
	                String photoBase64 = (spare_photo != null) ? Base64.getEncoder().encodeToString(spare_photo) : "";
	                int supplierid = rs.getInt("supplierid");
	                String status = rs.getString("status");

	                list.add(new UserSparePartModel(spare_id, name, price, category, quantity,
	                        description, spare_photo, photoBase64, supplierid, status));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }
	    
	    public static List<UserSparePartModel> getAllSpareParts() {
	        List<UserSparePartModel> list = new ArrayList<>();

	        try (Connection con = DBconnection.getConnection()) {
	            String sql = "SELECT * FROM spare_parts WHERE status='active' ";
	            PreparedStatement ps = con.prepareStatement(sql);
	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                String spare_id = rs.getString("spare_id");
	                String name = rs.getString("name");
	                BigDecimal price = rs.getBigDecimal("price");
	                String category = rs.getString("category");
	                int quantity = rs.getInt("quantity");
	                String description = rs.getString("description");
	                byte[] spare_photo = rs.getBytes("spare_photo");
	                String photoBase64 = (spare_photo != null) ? Base64.getEncoder().encodeToString(spare_photo) : "";
	                int supplierid = rs.getInt("supplierid");
	                String status = rs.getString("status");

	                UserSparePartModel part = new UserSparePartModel(
	                        spare_id, name, price, category, quantity, description, spare_photo, photoBase64, supplierid,status
	                );
	                list.add(part);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }

}

