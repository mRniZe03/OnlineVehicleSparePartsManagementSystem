package controller.user;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegisteredUserModel;
import service.user.UserService;
import service.user.UserServiceImpl;
import javax.servlet.*;
import javax.servlet.http.*;


@WebServlet("/RegisteredUserProfileUpdateServlet")
public class RegisteredUserProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private final UserService service = new UserServiceImpl();
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		RegisteredUserModel existingUser = (RegisteredUserModel) session.getAttribute("user");

		if (existingUser == null) {
			response.sendRedirect("RegisteredUserLogin.jsp");
			return;
		}

		// Get updated values from form
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String contactNo = request.getParameter("contactNo");

		// Keep original password
		String password = request.getParameter("password");

		RegisteredUserModel updatedUser = new RegisteredUserModel(
				name,
				email,
				existingUser.getId(),
				username,
				password, // preserve original password
				address,
				contactNo
		);

		boolean success = service.updateProfile(updatedUser);

		if (success) {
			session.setAttribute("user", updatedUser); // update session also
			response.getWriter().println("<script>alert('Profile updated successfully'); window.location='RegisteredUserProfile.jsp';</script>");
		} else {
			response.getWriter().println("<script>alert('Update failed'); window.location='RegisteredUserProfileUpdate.jsp';</script>");
		}
	}

}
