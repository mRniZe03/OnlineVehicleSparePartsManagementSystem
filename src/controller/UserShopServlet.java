package controller.user;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RegisteredUserModel;
import model.SupplierSparePartModel;
import model.UserSparePartModel;
import service.supplier.SparePartService;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;


@WebServlet("/UserShopServlet")
public class UserShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		List<UserSparePartModel> parts;

		if (category != null && !"all".equalsIgnoreCase(category)) {
			// Filter by selected category
			parts = SparePartService.getSparePartsByCategory(category);
		} else {
			// Default: all active parts
			parts = SparePartService.getAllSpareParts();
		}

		request.setAttribute("spareParts", parts);
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserShop.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
