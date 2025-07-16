<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel, model.UserProductModel, service.user.UserOrderServiceImpl, service.user.UserOrderService, java.util.List , java.math.BigDecimal" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RegisteredUserLogin.jsp");
        return;
    }

    String orderId = request.getParameter("orderId");
    UserOrderService orderService = new UserOrderServiceImpl();
    List<UserProductModel> orderItems = orderService.getOrderDetailsByOrderId(orderId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Summary</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
    }

    .menu a {
        color: white;
        margin-right: 20px;
        text-decoration: none;
        font-weight: 500;
    }

    .menu a:hover {
        color: #ffcc00;
    }

    .container {
        margin: 60px auto;
        max-width: 1100px;
        padding: 30px;
        background: #1e295e;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    }

    h2 {
        margin-bottom: 15px;
        color: #ffcc00;
    }

    .breadcrumb {
        font-size: 14px;
        color: #ccc;
        margin-bottom: 25px;
    }

    .breadcrumb a {
        color: #ffcc00;
        text-decoration: none;
    }

    .breadcrumb a:hover {
        text-decoration: underline;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #0c1333;
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 14px;
        border-bottom: 1px solid #333;
        text-align: center;
    }

    th {
        background-color: #222c5e;
        color: #ffcc00;
        font-weight: bold;
    }

    td {
        color: #ddd;
    }

    .total {
        text-align: right;
        font-weight: bold;
        font-size: 16px;
        margin-top: 30px;
        color: #fff;
    }

    .details {
        margin-top: 40px;
        background-color: #0c1333;
        padding: 20px;
        border-radius: 8px;
        box-shadow: inset 0 0 10px rgba(0,0,0,0.2);
    }

    .details h3 {
        margin-bottom: 15px;
        color: #ffcc00;
    }

    .details p {
        margin: 6px 0;
        color: #ccc;
        font-size: 15px;
    }
</style>
    
</head>
<body>

<!-- Content -->
<div class="container">
    <div class="breadcrumb">
        <a href="RegisteredUserOrders.jsp">My Orders</a> > View Order
    </div>

    <h2>Order Summary - <%= orderId %></h2>

    <table>
        <tr>
            <th>Part ID</th>
            <th>Part Name</th>
            <th>Unit Price</th>
            <th>Quantity</th>
            <th>Line Total</th>
            <th>Payment</th>
        </tr>
        <% 
            BigDecimal grandTotal = BigDecimal.ZERO;
            for (UserProductModel item : orderItems) {
                grandTotal = grandTotal.add(item.getLineTotal());
        %>
        <tr>
            <td><%= item.getPartId() %></td>
            <td><%= item.getPartName() %></td>
            <td>LKR <%= item.getUnitPrice() %></td>
            <td><%= item.getQuantity() %></td>
            <td>LKR <%= item.getLineTotal() %></td>
            <td><%= item.getPaymentMethod() %></td>
        </tr>
        <% } %>
    </table>

   <% 
        BigDecimal shippingCost = BigDecimal.ZERO;
        String shippingText = "Local Pickup";
        String sessionShipping = (String) session.getAttribute("shippingMethod");
        if ("Flat Rate".equals(sessionShipping)) {
            shippingCost = new BigDecimal("300.00");
            shippingText = "Flat Rate";
        }
        BigDecimal finalTotal = grandTotal.add(shippingCost);
    %>

    <div class="total">
        Shipping Method (<%= shippingText %>): LKR <%= shippingCost %><br>
        <strong>Total: LKR <%= finalTotal %></strong>
    </div>

    <div class="details">
        <h3>Shipping Info</h3>
        <% if (!orderItems.isEmpty()) {
            UserProductModel info = orderItems.get(0); %>
            <p><strong>Name:</strong> <%= info.getFirstName() %> <%= info.getLastName() %></p>
            <p><strong>Phone:</strong> <%= info.getPhone() %></p>
            <p><strong>Email:</strong> <%= info.getEmail() %></p>
            <p><strong>Address:</strong> <%= info.getStreetAddress() %>, <%= info.getCity() %>, <%= info.getProvince() %>, <%= info.getPostcode() %>, <%= info.getCountry() %></p>
        <% } %>
    </div>
</div>

</body>
</html>