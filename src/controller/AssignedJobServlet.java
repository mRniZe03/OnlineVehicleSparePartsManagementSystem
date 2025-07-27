package controller.deliverypersonnel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AssignedJobModel;
import util.DBconnection;



@WebServlet("/AssignedJobServlet")
public class AssignedJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        List<AssignedJobModel> jobs = new ArrayList<>();

	        try (Connection con = DBconnection.getConnection()) {

	        	PreparedStatement orderStmt = con.prepareStatement(
	        		    "SELECT up.order_id, up.`User-ID`, up.first_name, up.last_name, up.email, up.phone, up.order_date, up.payment_method " +
	        		    "FROM user_product up " +
	        		    "LEFT JOIN assigned_jobs aj ON up.order_id = aj.order_id " +
	        		    "WHERE aj.order_id IS NULL"
	        		);

	            ResultSet orderRs = orderStmt.executeQuery();

	            // Step 2: Fetch all delivery staff
	            Statement deliveryStmt = con.createStatement();
	            ResultSet deliveryRs = deliveryStmt.executeQuery("SELECT id, name FROM deliverystaff");
	            List<Integer> deliveryIds = new ArrayList<>();
	            List<String> deliveryNames = new ArrayList<>();
	            while (deliveryRs.next()) {
	                deliveryIds.add(deliveryRs.getInt("id"));
	                deliveryNames.add(deliveryRs.getString("name"));
	            }

	            // Step 3: Assign a random delivery person to each unassigned order
	            PreparedStatement insertStmt = con.prepareStatement(
	                "INSERT INTO assigned_jobs (job_assigned_id, order_id, user_id, first_name, last_name, email, phone, delivery_id, delivery_name, order_date, payment_method) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
	            );

	            // Get current max job_assigned_id
	            Statement maxStmt = con.createStatement();
	            ResultSet maxRs = maxStmt.executeQuery("SELECT MAX(CAST(job_assigned_id AS UNSIGNED)) FROM assigned_jobs");
	            int jobCounter = 1;
	            if (maxRs.next()) {
	                jobCounter = maxRs.getInt(1) + 1;
	            }

	            Random rand = new Random();

	            while (orderRs.next()) {
	                String jobId = String.format("%03d", jobCounter++);
	                int randIndex = rand.nextInt(deliveryIds.size());

	                insertStmt.setString(1, jobId);
	                insertStmt.setString(2, orderRs.getString("order_id"));
	                insertStmt.setInt(3, orderRs.getInt("User-ID"));
	                insertStmt.setString(4, orderRs.getString("first_name"));
	                insertStmt.setString(5, orderRs.getString("last_name"));
	                insertStmt.setString(6, orderRs.getString("email"));
	                insertStmt.setString(7, orderRs.getString("phone"));
	                insertStmt.setInt(8, deliveryIds.get(randIndex));
	                insertStmt.setString(9, deliveryNames.get(randIndex));
	                insertStmt.setDate(10, orderRs.getDate("order_date"));
	                insertStmt.setString(11, orderRs.getString("payment_method"));

	                insertStmt.executeUpdate();
	            }

	            // Step 4: Fetch all assigned jobs to display
	            PreparedStatement ps = con.prepareStatement("SELECT * FROM assigned_jobs ORDER BY job_assigned_id");
	            ResultSet result = ps.executeQuery();

	            while (result.next()) {
	                AssignedJobModel job = new AssignedJobModel();
	                job.setJobAssignedId(result.getString("job_assigned_id"));
	                job.setOrderId(result.getString("order_id"));
	                job.setUserId(result.getInt("user_id"));
	                job.setFirstName(result.getString("first_name"));
	                job.setLastName(result.getString("last_name"));
	                job.setEmail(result.getString("email"));
	                job.setPhone(result.getString("phone"));
	                job.setDeliveryId(result.getInt("delivery_id"));
	                job.setDeliveryName(result.getString("delivery_name"));
	                job.setOrderDate(result.getString("order_date"));
	                job.setPaymentMethod(result.getString("payment_method"));
	                jobs.add(job);
	            }

	            request.setAttribute("assignedJobs", jobs);
	            request.getRequestDispatcher("AssignedJob.jsp").forward(request, response);

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	    }
	}