package controller.user;

import model.RegisteredUserModel;
import javax.servlet.http.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CheckUserCurrentPasswordServlet")
public class CheckUserCurrentPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        RegisteredUserModel user = (session != null) ? (RegisteredUserModel) session.getAttribute("user") : null;

        if (user == null) {
            response.getWriter().write("invalid");
            return;
        }

        String enteredPassword = request.getParameter("password");

        if (enteredPassword != null && enteredPassword.equals(user.getPassword())) {
            response.getWriter().write("valid");
        } else {
            response.getWriter().write("invalid");
        }
	}


}
 