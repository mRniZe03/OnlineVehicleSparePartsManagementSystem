package controller.deliverypersonnel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DeliveryPersonModel;
import service.deliverypersonnel.deliveryPersonServiceImpl;




@WebServlet("/deliveryPersonForgotPasswordServlet")
public class deliveryPersonForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String deliveryPersonemail = request.getParameter("deliveryPersonemail").trim();

	        DeliveryPersonModel admin = new  deliveryPersonServiceImpl ().getDeliverPersonemail(deliveryPersonemail);

	        if (admin != null) {
	            response.sendRedirect("deliveryPersonResetPassword.jsp?adminemail=" + deliveryPersonemail);
	        } else {
	            response.sendRedirect("deliveryPersonForgotPassword.jsp?error=Email not found");
	        }
	}

}