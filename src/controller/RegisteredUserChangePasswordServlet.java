package controller.user;

import model.RegisteredUserModel;
import service.user.UserService;
import service.user.UserServiceImpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


@WebServlet("/RegisteredUserChangePasswordServlet")
public class RegisteredUserChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private final UserService userService = new UserServiceImpl();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
	        RegisteredUserModel user = (session != null) ? (RegisteredUserModel) session.getAttribute("user") : null;

	        if (user == null) {
	            response.sendRedirect("RegisteredUserLogin.jsp");
	            return;
	        }

	        String newPassword = request.getParameter("newPassword");
	        String confirmPassword = request.getParameter("confirmPassword");

	        if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
	            response.getWriter().println("<script>alert('Passwords not match'); history.back();</script>");
	            return;
	        }

	        user.setPassword(newPassword);
	        boolean updated = userService.updateProfile(user);

	        if (updated) {
	            response.getWriter().println("<script>alert('Password updated successfully!'); window.location='RegisteredUserProfile.jsp';</script>");
	        } else {
	            response.getWriter().println("<script>alert('Password update failed.'); history.back();</script>");
	        }
	}

}
    