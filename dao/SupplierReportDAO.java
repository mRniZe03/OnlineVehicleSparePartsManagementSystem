package dao.supplier;

import model.SupplierSparePartReportModel;
import util.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SupplierReportDAO {

	    public static SupplierSparePartReportModel getReportDetailsByRequestId(String request_id) {
	        SupplierSparePartReportModel report = null;
	        try (Connection con = DBconnection.getConnection()) {
	            String sql = "SELECT n.notification_id, c.request_id, c.spare_id, c.adminid, c.amount, c.orderdate, " +
	                         "s.category, s.name, (s.quantity - c.amount) AS previousQuantity " +
	                         "FROM notifications n " +
	                         "JOIN companyorders c ON n.request_id = c.request_id " +
	                         "JOIN spare_parts s ON c.spare_id = s.spare_id " +
	                         "WHERE n.request_id = ?";

	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setString(1, request_id);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                report = new SupplierSparePartReportModel();
	                report.setNotification_id(rs.getString("notification_id"));
	                report.setRequest_id(rs.getString("request_id"));
	                report.setSpare_id(rs.getString("spare_id"));
	                report.setAdminid(rs.getInt("adminid"));
	                report.setAmount(rs.getInt("amount"));
	                report.setOrderdate(rs.getDate("orderdate"));
	                report.setCategory(rs.getString("category"));
	                report.setName(rs.getString("name"));
	                report.setPreviousQuantity(rs.getInt("previousQuantity"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return report;
	    }
	}



