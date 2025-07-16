package controller.admin;

import model.AdminModel;
import service.admin.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String adminusername = request.getParameter("adminusername").trim();
        String adminpassword = request.getParameter("adminpassword").trim();

        AdminModel admin = new AdminServiceImpl().login(adminusername, adminpassword);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            session.setMaxInactiveInterval(30 * 60); // optional timeout
            response.sendRedirect("AdminHomePage.jsp");

        } else {
            response.getWriter().println("<script>alert('Invalid Username or Password.');window.location.href='AdminLogin.jsp';</script>");
        }
    }
}

