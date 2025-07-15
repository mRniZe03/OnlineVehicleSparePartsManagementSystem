package controller.supplier;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SupplierModel;
import service.supplier.SupplierServiceImpl;

@WebServlet("/SupplierProfileForgotPasswordServlet")
public class SupplierProfileForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String supplieremail = request.getParameter("supplieremail").trim();

	        SupplierModel admin = new SupplierServiceImpl().getSupplierByEmail(supplieremail);

	        if (admin != null) {
	            response.sendRedirect("SupplierProfileResetPassword.jsp?adminemail=" + supplieremail);
	        } else {
	            response.sendRedirect("SupplierProfileForgotPassword.jsp?error=Email not found");
	        }
	}

}
