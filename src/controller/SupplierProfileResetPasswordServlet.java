package controller.supplier;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.supplier.SupplierServiceImpl;

@WebServlet("/SupplierProfileResetPasswordServlet")
public class SupplierProfileResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String supplieremail = request.getParameter("supplieremail").trim();
	        String newPassword = request.getParameter("newpassword").trim();
	        String confirmPassword = request.getParameter("confirmpassword").trim();

	        if (!newPassword.equals(confirmPassword)) {
	            response.sendRedirect("SupplierProfileResetPassword.jsp?adminemail=" + supplieremail + "&error=Passwords do not match");
	            return;
	        }

	        boolean success = new SupplierServiceImpl().updatePasswordByEmail(supplieremail, newPassword);

	        if (success) {
	            response.sendRedirect("SupplierLogin.jsp?message=Password successfully updated. Please login.");
	        } else {
	            response.sendRedirect("SupplierProfileResetPassword.jsp?adminemail=" + supplieremail + "&error=Failed to update password");
	        }
	}

}
