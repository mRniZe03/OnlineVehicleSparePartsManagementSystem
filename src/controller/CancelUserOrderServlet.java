package controller.user;

import service.user.UserOrderService;
import service.user.UserOrderServiceImpl;

import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CancelUserOrderServlet")
public class CancelUserOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderId = request.getParameter("orderId");
        UserOrderService service = new UserOrderServiceImpl();
        boolean cancelled = service.cancelOrder(orderId);

        if (cancelled) {
            response.getWriter().println("<script>alert('Order canceled'); window.location.href='RegisteredUserOrders.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Failed to cancel order'); history.back();</script>");
        }
	}

}
