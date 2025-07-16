package controller.admin;

import model.AdminModel;
import service.admin.AdminOrderService;
import service.admin.AdminOrderServiceImpl;
import util.DBconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/AdminUpdateSparePartActionServlet")
public class AdminUpdateSparePartActionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        AdminModel admin = (AdminModel) session.getAttribute("admin");

        if (admin == null) {
            response.sendRedirect("AdminLogin.jsp");
            return;
        }

        String spare_id = request.getParameter("spare_id");
        String supplierIdParam = request.getParameter("supplierid");
        
        String amountParam = request.getParameter("amount");
        String status = request.getParameter("status");
        String reason = request.getParameter("reason");
        String orderdate = request.getParameter("orderdate");

        if (spare_id == null || supplierIdParam == null || status == null || amountParam == null || reason == null || orderdate == null ||
                spare_id.isEmpty() || supplierIdParam.isEmpty() || status.isEmpty() || amountParam.isEmpty() || reason.isEmpty() || orderdate.isEmpty()) {
            response.getWriter().println("<script>alert('Missing required fields'); window.history.back();</script>");
            return;
        }

        try {
            // Generate request_id like REQ-0001
        	String requestId = "";
        	try (Connection con = DBconnection.getConnection();
        	     Statement stmt = con.createStatement();
        	     ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM companyorders")) {
        	    if (rs.next()) {
        	        requestId = String.format("REQ-%04d", rs.getInt(1) + 1);
        	        System.out.println("Generated request_id: " + requestId);
        	    }
        	} catch (Exception e) {
        	    e.printStackTrace();
        	}


            int supplierid = Integer.parseInt(supplierIdParam);
            int amount = Integer.parseInt(amountParam);
            int adminid = admin.getId();

            AdminOrderService service = new AdminOrderServiceImpl();
            boolean inserted = service.addCompanyOrder(requestId, spare_id, adminid, supplierid, amount, status,reason,  orderdate);

            if (inserted) {
                response.getWriter().println("<script>alert('Request added successfully'); window.location.href='AdminManageSparePartsServlet';</script>");
            } else {
                response.getWriter().println("<script>alert('Insert failed'); window.history.back();</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}