package controller.deliverypersonnel;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.deliveryModel;
import util.DBconnection;


public class deliveryController {
	
	//connect DB
			private static boolean isSuccess;
			private static Connection con= null;
			private static Statement stmt= null;
			private static ResultSet rs = null;
			
			//Insert data function
			public static boolean insertdata(String name, String email, String phone, String address, String joining_date, String password) {
				
				boolean isSuccess= false;
				try {
					//DbConnection Call
					con=DBconnection.getConnection();
				    stmt = con.createStatement();
				    
				    //SQl query
				    String sql = "INSERT INTO deliverystaff VALUES (0, '" + name + "', '" + email + "', '" + phone + "', '" + address + "', '" + joining_date + "','" + password + "')";

				    int rs = stmt.executeUpdate(sql);
				    if (rs>0) {
				    	isSuccess= true;
				    	
				    }
				    else {
				    	isSuccess = false;
				    }
				}catch(Exception e) {
					e.printStackTrace();
					
				}
				return isSuccess;
			}
			//GetById	
		     public static List<deliveryModel> getById(String Id){
		    	 
		    	 int convertID = Integer.parseInt(Id);
		    	 
		    	 ArrayList<deliveryModel>deliverystaff = new ArrayList<>();
		    	

		    	 try {
		    		 //DBConnection
		    		 con=DBconnection.getConnection();
		 		    stmt = con.createStatement();
		 		    
		 		    //Query
		 		    String sql = "select * from deliverystaff where id '"+convertID+"'";
		 		    
		 		    rs= stmt.executeQuery(sql);
		 		    while(rs.next()) {
		 		    	int id = rs.getInt(1);
		 		    	String name= rs.getString(2);
		 		    	String email= rs.getString(3);
		 		    	String phone= rs.getString(4);
		 		    	String address= rs.getString(5);
		 		    	String joining_date= rs.getString(6);
		 		    	String password = rs.getString(7);
		 			    
		 			    
		 		    	deliveryModel dp = new deliveryModel(id,name,email,phone,address,joining_date,password);
		 		    	deliverystaff.add(dp);
		 		    }
		    	 }
		    	 catch(Exception e) {
		    		 e.printStackTrace();
		    	 }
		    	 return deliverystaff;
		     }
		   //GEtAll Data
		     public static List<deliveryModel>getAllstaff(){
		    	 
		    	 ArrayList<deliveryModel>deliverystaffAll = new ArrayList<>();
		    	 
		    	 try {
		    		 //DBConnection
		    		 con=DBconnection.getConnection();
		 		    stmt = con.createStatement();
		 		    
		 		    //Query
		 		    String sql = "select * from deliverystaff";
		 		    
		 		    rs= stmt.executeQuery(sql);
		 		    while(rs.next()) {
		 		    	int id = rs.getInt(1);
		 		    	String name= rs.getString(2);
		 		    	String email= rs.getString(3);
		 		    	String phone= rs.getString(4);
		 		    	String address= rs.getString(5);
		 		    	String joining_date= rs.getString(6);
		 		    	String password = rs.getString(7);
		 			    
		 		    	
		 		    	deliveryModel dp = new deliveryModel(id,name,email,phone,address,joining_date,password);
		 		    	deliverystaffAll.add(dp);
		 		    }
		    	 }
		    	 catch(Exception e) {
		    		 e.printStackTrace();
		    	 }
		    	 return deliverystaffAll;
		     }
		   //update Date
	    	 public static boolean updatedata(String id,String name,String email,String phone,String address,String joining_date ) {
	    		 try {
	        		 //DBConnection
	        		 con=DBconnection.getConnection();
	     		    stmt = con.createStatement();
	     		    
	     		    //SQlQuery
	     		    String sql ="update deliverystaff set name='"+name+"',email='"+email+"',phone='"+phone+"',address='"+address+"',joining_date ='"+joining_date+"'"+"where id='"+id+"'";
	     		    
	     		    int rs=stmt.executeUpdate(sql);  
	     		   if (rs>0) {
	   		    	isSuccess= true;
	   		    	
	   		    }
	   		    else {
	   		    	isSuccess = false;
	   		    }
	     		    
	     		    
	    		 }catch(Exception e) {
	     	    		 e.printStackTrace();
	     	    	 }
	    		 return isSuccess;
	    		 
	     }
	    	 //Delete Data
	    	 public static boolean deletedata(String id) {
	    		 
	    		 int convID =Integer.parseInt(id);
	    		 
	    		 try {
	    			 //DB Connection
	    			 con=DBconnection.getConnection();
	      		    stmt = con.createStatement();
	      		    
	      		    String sql="delete from deliverystaff where id ='"+convID+"'";
	      		    
	      		    int rs= stmt.executeUpdate(sql);
	      		   if (rs>0) {
	      		    	isSuccess= true;
	      		    	
	      		    }
	      		    else {
	      		    	isSuccess = false;
	      		    }
	    			 
	    		 }catch(Exception e) {
	 	    		 e.printStackTrace();
	 	    	 }
			 return isSuccess;
	    	 }
	    	 
	    	// Get single delivery staff by ID (for profile view)
	    	 public static deliveryModel getDeliveryById(int id) {
	    	     deliveryModel delivery = null;

	    	     try {
	    	         con = DBconnection.getConnection();
	    	         stmt = con.createStatement();

	    	         String sql = "SELECT * FROM deliverystaff WHERE id = '" + id + "'";
	    	         rs = stmt.executeQuery(sql);

	    	         if (rs.next()) {
	    	             int dId = rs.getInt(1);
	    	             String name = rs.getString(2);
	    	             String email = rs.getString(3);
	    	             String phone = rs.getString(4);
	    	             String address = rs.getString(5);
	    	             String joining_date = rs.getString(6);
	    	             String password = rs.getString(7);
	    	            

	    	             delivery = new deliveryModel(dId, name, email, phone, address, joining_date, password);
	    	         }
	    	     } catch (Exception e) {
	    	         e.printStackTrace();
	    	     }

	    	     return delivery;
	    	 }

	}