package controller.admin;

import model.AdminModel;
import service.admin.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminProfileForgotPasswordServlet")
public class AdminProfileForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("adminemail").trim();

        AdminModel admin = new AdminServiceImpl().getAdminByEmail(email);

        if (admin != null) {
            response.sendRedirect("AdminProfileResetPassword.jsp?adminemail=" + email);
        } else {
            response.getWriter().println("<script>alert('Email not found'); location='AdminProfileForgotPassword.jsp';</script>");
        }

    }
}
