package controller.admin;

import service.admin.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminProfileChangePasswordServlet")
public class AdminProfileChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("adminemail").trim();
        String currentPassword = request.getParameter("currentpassword").trim();
        String newPassword = request.getParameter("newpassword").trim();
        String confirmPassword = request.getParameter("confirmpassword").trim();

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("AdminProfileChangePassword.jsp?error=Passwords do not match");
            return;
        }

        AdminServiceImpl service = new AdminServiceImpl();

        boolean isCurrentValid = service.validateCurrentPassword(email, currentPassword);

        if (isCurrentValid) {
            boolean updated = service.updatePassword(email, newPassword);
            if (updated) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('Password successfully updated'); window.location='AdminProfile.jsp';</script>");
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('Update failed'); window.location='AdminProfileChangePassword.jsp';</script>");
            }
        } else {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Current password incorrect'); window.location='AdminProfileChangePassword.jsp';</script>");
        }

    }
}
