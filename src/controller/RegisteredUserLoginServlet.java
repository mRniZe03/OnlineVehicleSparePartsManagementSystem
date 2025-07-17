package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import model.RegisteredUserModel;
import service.user.UserService;
import service.user.UserServiceImpl;
import javax.servlet.*;
import javax.servlet.http.*;


@WebServlet("/RegisteredUserLoginServlet")
public class RegisteredUserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserService service = new UserServiceImpl();
	
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<RegisteredUserModel> users = service.login(username, password);
        if (!users.isEmpty()) {
            request.getSession().setAttribute("user", users.get(0));
            response.getWriter().println("<script>alert('Login Successful'); window.location='UserHomeServlet';</script>");
        } else {
            response.getWriter().println("<script>alert('Invalid credentials'); window.location='RegisteredUserLogin.jsp';</script>");
        }
	}

}
