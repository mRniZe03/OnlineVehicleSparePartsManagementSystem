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

@WebServlet("/UnregisteredUserForgotPasswordServlet")
public class UnregisteredUserForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService service = new UserServiceImpl();

       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		
        if (service.emailExists(email)) {
            request.getSession().setAttribute("resetEmail", email);
            response.sendRedirect("UnregisteredUserResetPassword.jsp");
        } else {
            response.getWriter().println("<script>alert('Email not found'); window.location='UnregisteredUserForgotPassword.jsp';</script>");
        }
	}

}
