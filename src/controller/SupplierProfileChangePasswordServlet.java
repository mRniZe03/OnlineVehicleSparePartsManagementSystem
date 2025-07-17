package controller.supplier;

import service.supplier.SupplierServiceImpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SupplierProfileChangePasswordServlet")
public class SupplierProfileChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	           
		String supplieremail = request.getParameter("supplieremail").trim();
        String currentPassword = request.getParameter("currentpassword").trim();
        String newPassword = request.getParameter("newpassword").trim();
        String confirmPassword = request.getParameter("confirmpassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("SupplierProfileChangePassword.jsp?error=Passwords do not match");
            return;
        }

        SupplierServiceImpl service = new SupplierServiceImpl();

        boolean isCurrentValid = service.validateCurrentPassword(supplieremail, currentPassword);

        if (isCurrentValid) {
            boolean updated = service.updatePassword(supplieremail, newPassword);
            if (updated) {
                response.sendRedirect("SupplierProfile.jsp?message=Password successfully updated");
            } else {
                response.sendRedirect("SupplierProfileChangePassword.jsp?error=Update failed");
            }
        } else {
            response.sendRedirect("SupplierProfileChangePassword.jsp?error=Current password incorrect");
        }
	}

}
