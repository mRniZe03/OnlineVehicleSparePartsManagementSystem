<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.UserOrderModel, model.RegisteredUserModel, service.user.UserOrderServiceImpl, service.user.UserOrderService" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RegisteredUserLogin.jsp");
        return;
    }

    UserOrderService orderService = new UserOrderServiceImpl();
    List<UserOrderModel> orders = orderService.getOrdersByUser(user.getId());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    html, body {
        height: 100%;
        display: flex;
        flex-direction: column;
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
    }

    .top-bar {
        background-color: #0b0f3d;
        color: white;
        padding: 10px 40px;
        font-size: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: 'Poppins', sans-serif;
     }

      .top-bar i {
        margin-right: 8px;
     }

      .right-icons {
         display: flex;
         align-items: center;
         gap: 10px;
         font-size: 15px;
    }

      .navbar {
         background-color: #0d112d;
         display: flex;
         justify-content: space-between;
         align-items: center;
         padding: 18px 40px;
         box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
         font-family: 'Poppins', sans-serif;
    }

      .logo {
         font-size: 22px;
         color: #ffcc00;
         font-weight: 600;
     }

      .navbar > div:nth-child(2) {
         display: flex;
         gap: 30px;
         justify-content: center;
         flex: 1;
     }

      .navbar a {
         color: white;
         text-decoration: none;
         font-weight: 500;
         font-size: 15px;
         transition: color 0.3s ease;
     }

      .navbar a:hover {
         color: #f9c802;
     }

      .menu {
          display: flex;
          align-items: center;
          gap: 14px;
      }

       .menu a {
         background-color: #f9c802;
         color: #0f1a3a;
         padding: 6px 14px;
         border-radius: 6px;
         font-weight: bold;
         text-decoration: none;
         transition: background-color 0.3s ease;
     }

      .menu a:hover {
          background-color: #e6b800;
          color: #000;
    }


    .menu {
         display: flex;
         align-items: center;
         gap: 10px;
    }

    .content {
        margin: 40px auto;
        padding: 20px;
        max-width: 1100px;
        background-color: #1e295e;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        flex: 1;
    }

    h2 {
        color: #ffcc00;
        margin-bottom: 20px;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #0c1333;
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #333;
    }

    th {
        background-color: #0b0f3d;
        color: #ffcc00;
        font-weight: 600;
    }

    td {
        color: #ddd;
    }

    .btn {
        padding: 8px 14px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        font-size: 14px;
    }

    .btn-view {
        background-color: #3498db;
        color: white;
    }

    .btn-view:hover {
        background-color: #2980b9;
    }

    .btn-cancel {
        background-color: #ff4d4d;
        color: white;
    }

    .btn-cancel:hover {
        background-color: #c82333;
    }

    .status-badge {
        padding: 6px 14px;
        border-radius: 20px;
        font-size: 14px;
        display: inline-block;
        color: #fff;
        font-weight: bold;
    }

    .status-badge.pending {
        background-color: #17a2b8;
    }

    .status-badge.shipped {
        background-color: #ffc107;
        color: #000;
    }

    .status-badge.delivered {
        background-color: #28a745;
    }

    .status-badge.cancelled {
        background-color: #dc3545;
    }

    .status-info {
        color: #bbb;
        font-style: italic;
        font-size: 13px;
    }
    
    footer {
        background-color: #1c1f57;
        color: white;
        padding: 12px 30px;
        text-align: center;
        font-size: 13px;
    }

     footer a {
         color: #f1c40f;
         text-decoration: none;
         margin: 0 5px;
    }

     footer a:hover {
         text-decoration: underline;
    }

</style>
    
</head>
<body>

<!-- Top Bar -->
    <div class="top-bar">
        <div>🚚</div>
        <div class="right-icons">
            <i>❤</i>
            <i>🛒</i>
            <span>£0.00</span>
        </div>
    </div>
    
<!-- Navbar -->
<div class="navbar">
<div class="logo">eSpareMart</div>

         <div>
            <a href="UserHome.jsp">Home</a>
            <a href="UserShopServlet">Shop</a>
            <a href="ContactUs.jsp">Contact Us</a>
            <a href="AboutUs.jsp">About Us</a>
            <a href="RegisteredUserProfileServlet">My Profile</a>
            <a href="RegisteredUserShoppingCartServlet">My Cart</a>
            <a href="RegisteredUserOrders.jsp">My Orders</a>
            <a href="UserFeedbackForm.jsp">Submit Feedback</a>
            <a href="UserPublicFeedback.jsp">View All Feedback</a>
               
         </div> 
    <div class="menu">
        
        <h4>👤<%= user.getName() %></h4> |
        <a href="RegisteredUserLogoutServlet">Logout</a>
        
    </div>
</div>



<!-- Main Content -->
<div class="content">
    <h2>My Orders</h2>
    <table>
        <tr>
            <th>ORDER ID</th>
            <th>DATE</th>
            <th>STATUS</th>
            <th>TOTAL</th>
            <th>ACTION</th>
            <th>ORDER CANCEL</th>
        </tr>
        <% for (UserOrderModel order : orders) { %>
        <tr>
            <td><%= order.getOrderId() %></td>
            <td><%= order.getOrderDate() %></td>
            <td>
              <span class="status-badge <%= order.getStatus().toLowerCase() %>">
              <%= order.getStatus().substring(0, 1).toUpperCase() + order.getStatus().substring(1).toLowerCase() %>
              </span>
            </td>
            <td>LKR <%= order.getTotal() %></td>
            <td>
                <a href="RegisteredUserOrderSummary.jsp?orderId=<%= order.getOrderId() %>" class="btn btn-view">👁 View</a>
            </td>
            <td>
               <% if (order.getStatus().equalsIgnoreCase("pending") || order.getStatus().equalsIgnoreCase("shipped")) { %>
                   <form action="CancelUserOrderServlet" method="post" onsubmit="return confirm('Are you sure you want to cancel this order?');">
                        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                        <button type="submit" class="btn btn-cancel">Cancel</button>
                   </form>
               <% } else { %>
                   <span class="status-info">Order already delivered</span>
               <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<!-- Footer -->
<footer>
     v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
    <br>
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>
    
</body>
</html>