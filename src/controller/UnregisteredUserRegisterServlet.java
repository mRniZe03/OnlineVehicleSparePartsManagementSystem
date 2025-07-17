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

@WebServlet("/UnregisteredUserRegisterServlet")
public class UnregisteredUserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private final UserService service = new UserServiceImpl();

       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisteredUserModel user = new RegisteredUserModel(
	            request.getParameter("name"),
	            request.getParameter("email"),
	            0,
	            request.getParameter("username"),
	            request.getParameter("password"),
	            request.getParameter("address"),
	            request.getParameter("contactNo")
	        );

	        if (service.register(user)) {
	            response.getWriter().println("<script>alert('Registered successfully'); window.location='RegisteredUserLogin.jsp';</script>");
	        } else {
	            response.getWriter().println("<script>alert('Registration failed'); window.location='UnregisteredUserRegister.jsp';</script>");
	        }
	}

}
