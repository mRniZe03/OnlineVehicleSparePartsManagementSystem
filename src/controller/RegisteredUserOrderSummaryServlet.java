package controller.user;

import model.UserProductModel;
import service.user.UserOrderService;
import service.user.UserOrderServiceImpl;

import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;

@WebServlet("/RegisteredUserOrderSummaryServlet")
public class RegisteredUserOrderSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("RegisteredUserLogin.jsp");
            return;
        }

        String orderId = request.getParameter("orderId");
        if (orderId == null || orderId.isEmpty()) {
            response.sendRedirect("RegisteredUserOrders.jsp");
            return;
        }

        UserOrderService service = new UserOrderServiceImpl();
        List<UserProductModel> orderItems = service.getOrderDetailsByOrderId(orderId);

        request.setAttribute("orderItems", orderItems);
        request.setAttribute("orderId", orderId);
        request.getRequestDispatcher("RegisteredUserOrderSummary.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
