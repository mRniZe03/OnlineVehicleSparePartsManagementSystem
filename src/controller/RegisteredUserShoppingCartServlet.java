package controller.user;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import model.AddCartModel;
import model.RegisteredUserModel;
import service.user.AddCartService;

@WebServlet("/RegisteredUserShoppingCartServlet")
public class RegisteredUserShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		RegisteredUserModel user = (session != null) ? (RegisteredUserModel) session.getAttribute("user") : null;

		if (user == null) {
			response.sendRedirect("RegisteredUserLogin.jsp");
			return;
		}

		// ✅ Optional: Set shipping method if provided (before forward)
		String shipping = request.getParameter("shipping");
		if (shipping != null && !shipping.isEmpty()) {
			session.setAttribute("selectedShipping", shipping);
		}

		// ✅ Load cart details
		List<AddCartModel> cartItems = AddCartService.getUserCartItems(user.getId());
		BigDecimal subtotal = AddCartService.calculateSubtotal(user.getId());

		request.setAttribute("cartItems", cartItems);
		request.setAttribute("subtotal", subtotal);
		request.setAttribute("user", user);

		// ✅ Forward to Shopping Cart page (not redirect)
		RequestDispatcher dispatcher = request.getRequestDispatcher("RegisteredUserShoppingCart.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Optional: Handle POST logic if needed
		response.sendRedirect("SupplierSparePartGetAllServlet");
	}
}
