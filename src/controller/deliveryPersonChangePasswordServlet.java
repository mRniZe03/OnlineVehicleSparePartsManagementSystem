package controller.deliverypersonnel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.deliverypersonnel.deliveryPersonServiceImpl;


@WebServlet("/deliveryPersonChangePasswordServlet")
public class deliveryPersonChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		String deliveryPersonemail = request.getParameter("deliverypersonemail").trim();
        String currentPassword = request.getParameter("currentpassword").trim();
        String newPassword = request.getParameter("newpassword").trim();
        String confirmPassword = request.getParameter("confirmpassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("deliveryPersonChangePassword.jsp?error=Passwords do not match");
            return;
        }

        deliveryPersonServiceImpl service = new  deliveryPersonServiceImpl();

        boolean isCurrentValid = service.validateCurrentPassword(deliveryPersonemail, currentPassword);

        if (isCurrentValid) {
            boolean updated = service.updatePassword(deliveryPersonemail, newPassword);
            if (updated) {
                response.sendRedirect("deliveryPerson.jsp?message=Password successfully updated");
            } else {
                response.sendRedirect("deliveryPersonChangePassword.jsp?error=Update failed");
            }
        } else {
            response.sendRedirect("deliveryPersonLogin.jsp?error=Current password incorrect");
        }
	}

}