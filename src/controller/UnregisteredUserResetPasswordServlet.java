package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.user.UserService;
import service.user.UserServiceImpl;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/UnregisteredUserResetPasswordServlet")
public class UnregisteredUserResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private final UserService service = new UserServiceImpl();

       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String) request.getSession().getAttribute("resetEmail");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        //check if password match
        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("<script>alert('Passwords do not match'); window.location='UnregisteredUserResetPassword.jsp';</script>");
            return;
        }

        //update password
        if (service.resetPassword(email, newPassword)) {
            response.getWriter().println("<script>alert('Password updated successfully'); window.location='RegisteredUserLogin.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Update failed'); window.location='UnregisteredUserResetPassword.jsp';</script>");
        }
	}

}
