package controller.deliverypersonnel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.deliveryModel;

import java.util.List;

import javax.servlet.RequestDispatcher;


@WebServlet("/deliveryallServlet")
public class deliveryallServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		List<deliveryModel> alldelivery = deliveryController.getAllstaff();
		
		request.setAttribute("alldelivery", alldelivery);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("display.jsp");
	    
		dispatcher.forward(request, response);

		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			doGet(request,response);
		}
	}