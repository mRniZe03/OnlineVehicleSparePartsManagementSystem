package controller.admin;

import service.admin.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminProfileResetPasswordServlet")
public class AdminProfileResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("adminemail").trim();
        String newPassword = request.getParameter("newpassword").trim();
        String confirmPassword = request.getParameter("confirmpassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("AdminProfileResetPassword.jsp?adminemail=" + email + "&error=Passwords do not match");
            return;
        }

        boolean success = new AdminServiceImpl().updatePasswordByEmail(email, newPassword);

        if (success) {
            response.sendRedirect("AdminLogin.jsp?message=Password successfully updated. Please login.");
        } else {
            response.sendRedirect("AdminProfileResetPassword.jsp?adminemail=" + email + "&error=Failed to update password");
        }
    }
}
