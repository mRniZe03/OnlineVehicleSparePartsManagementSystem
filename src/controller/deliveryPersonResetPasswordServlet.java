package controller.deliverypersonnel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.deliverypersonnel.deliveryPersonServiceImpl;





@WebServlet("/deliveryPersonResetPasswordServlet")
public class deliveryPersonResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String deliveryPersonemail = request.getParameter("deliverypersonemail").trim();
        String newPassword = request.getParameter("newpassword").trim();
        String confirmPassword = request.getParameter("confirmpassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("deliveryPersonResetPassword.jsp?adminemail=" + deliveryPersonemail + "&error=Passwords do not match");
            return;
        }

        boolean success = new deliveryPersonServiceImpl().updatePasswordByEmail(deliveryPersonemail, newPassword);

        if (success) {
            response.sendRedirect("deliveryPersonLogin.jsp?message=Password successfully updated. Please login.");
        } else {
            response.sendRedirect("deliveryPersonResetPassword.jsp?adminemail=" + deliveryPersonemail + "&error=Failed to update password");
        }
}

}