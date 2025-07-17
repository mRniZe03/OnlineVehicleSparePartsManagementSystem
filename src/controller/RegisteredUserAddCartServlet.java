package controller.user;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

import model.RegisteredUserModel;
import model.SupplierSparePartModel;
import model.UserSparePartModel;
import model.AddCartModel;
import service.supplier.SparePartService;
import service.user.AddCartService;

@WebServlet("/RegisteredUserAddCartServlet")
public class RegisteredUserAddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("RegisteredUserHome.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RegisteredUserModel user = (RegisteredUserModel) request.getSession().getAttribute("user");
	    if (user == null) {
	        response.sendRedirect("RegisteredUserLogin.jsp");
	        return;
	    }

	    String spare_id = request.getParameter("spare_id");
	    String qtyParam = request.getParameter("quantity");

	    if (qtyParam == null || qtyParam.trim().isEmpty() || !qtyParam.matches("\\d+")) {
	        response.getWriter().println("<script>alert('Invalid or empty quantity.'); window.location.href='SupplierSparePartGetAllServlet';</script>");
	        return;
	    }

	    int requestedQty = Integer.parseInt(qtyParam);

	    UserSparePartModel part = SparePartService.getSparePartById(spare_id);

	    if (part == null) {
	        response.getWriter().println("<script>alert('Spare part not found'); window.location.href='SupplierSparePartGetAllServlet';</script>");
	        return;
	    }

	    if (requestedQty > part.getQuantity()) {
	        response.getWriter().println("<script>alert('Not enough stock available'); window.location.href='SupplierSparePartGetAllServlet';</script>");
	        return;
	    }

	    BigDecimal unitPrice = part.getPrice();
	    BigDecimal total = unitPrice.multiply(BigDecimal.valueOf(requestedQty));

	    AddCartModel cart = new AddCartModel(
	        part.getSpare_id(),
	        user.getId(),
	        user.getName(),
	        part.getName(),
	        part.getCategory(),
	        requestedQty,
	        unitPrice,
	        total
	    );

	    boolean inserted = AddCartService.insertToCart(cart);

	    if (inserted) {
	        response.getWriter().println("<script>alert('Successfully entered details.'); window.location.href='UserSparePartGetAllServlet';</script>");
	    } else {
	        response.getWriter().println("<script>alert('Enter failed.'); window.location.href='SupplierSparePartGetAllServlet';</script>");
	    }
	}

}
