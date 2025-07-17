package controller.user;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SupplierSparePartModel;
import model.UserSparePartModel;
import service.supplier.SparePartService;
import service.user.AddCartService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.math.BigDecimal;

@WebServlet("/UpdateCartQuantityServlet")
public class UpdateCartQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        int userId = ((model.RegisteredUserModel) session.getAttribute("user")).getId();
        String partId = request.getParameter("part_id");
        int newQty = Integer.parseInt(request.getParameter("quantity"));

        UserSparePartModel part = SparePartService.getSparePartById(partId);
        BigDecimal unitPrice = part.getPrice();
        BigDecimal lineTotal = unitPrice.multiply(BigDecimal.valueOf(newQty));

        AddCartService.updateQuantity(userId, partId, newQty, lineTotal);

        response.sendRedirect("RegisteredUserShoppingCartServlet");
	}

}
