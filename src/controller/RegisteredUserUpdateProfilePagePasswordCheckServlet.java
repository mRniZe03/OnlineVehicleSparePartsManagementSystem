package controller.user;

import model.RegisteredUserModel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisteredUserUpdateProfilePagePasswordCheckServlet")
public class RegisteredUserUpdateProfilePagePasswordCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisteredUserModel user = (RegisteredUserModel) request.getSession().getAttribute("user");
        String enteredPassword = request.getParameter("password");

        if (user != null && user.getPassword().equals(enteredPassword)) {
            response.getWriter().write("valid");
        } else {
            response.getWriter().write("invalid");
        }
	}

}
