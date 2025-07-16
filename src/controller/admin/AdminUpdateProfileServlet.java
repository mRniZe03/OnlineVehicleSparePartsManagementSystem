package controller.admin;

import model.AdminModel;
import service.admin.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminUpdateProfileServlet")
public class AdminUpdateProfileServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("adminid"));
        String name = request.getParameter("adminname").trim();
        String email = request.getParameter("adminemail").trim();
        String username = request.getParameter("adminusername").trim();
        String password = request.getParameter("adminpassword").trim();

        AdminModel updatedAdmin = new AdminModel(id, name, email, username, password);
        AdminServiceImpl service = new AdminServiceImpl();

        HttpSession session = request.getSession();

        boolean isValid = service.validateCurrentPasswordById(id, password);
        if (isValid) {
            boolean success = service.updateProfile(updatedAdmin);
            if (success) {
                session.setAttribute("admin", updatedAdmin);
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('Profile updated successfully'); window.location.href='AdminProfile.jsp';</script>");
            } else {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println("<script>alert('Update failed. Try again'); window.location.href='AdminProfileUpdate.jsp';</script>");
            }
        } else {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Incorrect current password'); window.location.href='AdminProfileUpdate.jsp';</script>");
        }

}
}
