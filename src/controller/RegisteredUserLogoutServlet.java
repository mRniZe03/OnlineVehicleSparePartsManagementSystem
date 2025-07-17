package controller.user;

import java.io.IOException;

import model.RegisteredUserModel;
import service.user.AddCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


@WebServlet("/RegisteredUserLogoutServlet")
public class RegisteredUserLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);

	        if (session != null && session.getAttribute("user") != null) {
	            RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");

	            // Clear cart items from `add_cart` table
	            AddCartService.clearCart(user.getId());

	            // Invalidate session
	            session.invalidate();
	        }

	        // Redirect to login page
	        response.sendRedirect("UserHome.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
