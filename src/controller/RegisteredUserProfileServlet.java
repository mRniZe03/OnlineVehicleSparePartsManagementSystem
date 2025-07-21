package controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegisteredUserModel;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/RegisteredUserProfileServlet")
public class RegisteredUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegisteredUserModel user = (RegisteredUserModel) request.getSession().getAttribute("user");
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("RegisteredUserProfile.jsp").forward(request, response);
        } else {
            response.sendRedirect("RegisteredUserLogin.jsp");
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("SupplierSparePartGetAllServlet");
	}

}
