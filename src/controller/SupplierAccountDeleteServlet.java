package controller.supplier;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.supplier.SupplierServiceImpl;

@WebServlet("/SupplierAccountDeleteServlet")
public class SupplierAccountDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SupplierServiceImpl supplierService = new SupplierServiceImpl();
	       
	    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}

		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int id = Integer.parseInt(request.getParameter("supplierid"));
	        if (supplierService.deleteAccount(id)) {
	            response.getWriter().println("<script>alert('Account deleted'); window.location='SupplierLogin.jsp';</script>");
	        } else {
	            response.getWriter().println("<script>alert('Delete failed'); window.location='SupplierProfile.jsp';</script>");
	        }
		}

}

 


