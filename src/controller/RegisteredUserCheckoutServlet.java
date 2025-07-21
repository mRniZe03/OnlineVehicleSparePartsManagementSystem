package controller.user;

import model.AddCartModel;

import model.RegisteredUserModel;
import model.UserOrderModel;
import model.UserProductModel;
import service.user.AddCartService;
import service.user.UserOrderService;
import service.user.UserOrderServiceImpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Date;
import javax.servlet.http.*;


import model.*;
import service.user.*;
import java.util.*;


@WebServlet("/RegisteredUserCheckoutServlet")
public class RegisteredUserCheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        RegisteredUserModel user = (session != null) ? (RegisteredUserModel) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect("RegisteredUserLogin.jsp");
            return;
        }

        // Get shipping method
        String shippingMethod = request.getParameter("shippingMethod");
        session.setAttribute("shippingMethod", shippingMethod);

        // Get payment method
        String payment = request.getParameter("paymentMethod");

        // Get billing details
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");
        String country = request.getParameter("country");
        String province = request.getParameter("province");

        // Calculate total
        List<AddCartModel> cartItems = AddCartService.getUserCartItems(user.getId());
        BigDecimal subtotal = AddCartService.calculateSubtotal(user.getId());
        BigDecimal shippingCost = "Flat Rate".equals(shippingMethod) ? new BigDecimal("300.00") : BigDecimal.ZERO;
        BigDecimal total = subtotal.add(shippingCost);
        Date today = new Date();

        // Validate payment inputs
        if ("Card Payment".equalsIgnoreCase(payment)) {
            String cardName = request.getParameter("cardName");
            String cardNumber = request.getParameter("cardNumber");
            String expiry = request.getParameter("expDate");
            String cvv = request.getParameter("cvv");

            // Basic field presence validation
            if (cardName == null || cardNumber == null || expiry == null || cvv == null ||
                cardName.isEmpty() || cardNumber.isEmpty() || expiry.isEmpty() || cvv.isEmpty()) {
                response.getWriter().println("<script>alert('Please enter all card details'); history.back();</script>");
                return;
            }

            // Card number must be 16 digits
            if (!cardNumber.matches("\\d{16}")) {
                response.getWriter().println("<script>alert('Card number must be exactly 16 digits'); history.back();</script>");
                return;
            }

            // CVV must be 3 digits
            if (!cvv.matches("\\d{3}")) {
                response.getWriter().println("<script>alert('CVV must be exactly 3 digits'); history.back();</script>");
                return;
            }
        
        } else if ("Bank Payment".equalsIgnoreCase(payment)) {
            String depositBank = request.getParameter("depositBank");
            String depositSlip = request.getParameter("depositSlip");
            if (depositBank == null || depositSlip == null || depositBank.isEmpty() || depositSlip.isEmpty()) {
                response.getWriter().println("<script>alert('Please enter bank details'); history.back();</script>");
                return;
            }
        }

        // Insert order
        UserOrderService orderService = new UserOrderServiceImpl();
        String orderId = orderService.generateOrderId();
        UserOrderModel order = new UserOrderModel(orderId, user.getId(), user.getName(), today, total, "pending");
        boolean orderInserted = orderService.insertOrder(order);

        // Insert products
        boolean allInserted = true;
        for (AddCartModel item : cartItems) {
            UserProductModel product = new UserProductModel(
                    orderId,
                    user.getId(),
                    item.getPart_id(),
                    item.getPart_name(),
                    item.getUnitprice(),
                    item.getQuantity(),
                    item.getLinetotal(),
                    email, phone, firstName, lastName,
                    street, city, postcode, country, province,
                    payment, today
            );
            boolean success = orderService.insertProduct(product);
            if (!success) {
                allInserted = false;
                break;
            }
        }

        // Final steps
        if (orderInserted && allInserted) {
            for (AddCartModel item : cartItems) {
                AddCartService.reduceStock(item.getPart_id(), item.getQuantity());
            }
            AddCartService.clearCart(user.getId());
            response.getWriter().println("<script>alert('Order completed successfully'); window.location.href='UserHome.jsp';</script>");
        } else {
            response.getWriter().println("<script>alert('Order failed. Try again.'); history.back();</script>");
        }
	}

}
