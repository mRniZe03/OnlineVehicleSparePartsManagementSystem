<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RegisteredUserLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Feedback</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
        margin: 0;
        padding: 0;
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

    .container {
        max-width: 600px;
        margin: 60px auto;
        background-color: #1e295e;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    }

    h2 {
        margin-bottom: 20px;
        color: #ffcc00;
        text-align: center;
    }

    label {
        font-weight: 600;
        margin-top: 15px;
        display: block;
        color: #ffffff;
    }

    textarea, select {
        width: 100%;
        padding: 12px;
        margin-top: 6px;
        border: 1px solid #444;
        border-radius: 6px;
        background-color: #0c1333;
        color: #f0f0f0;
        font-size: 14px;
    }

    textarea:focus,
    select:focus {
        outline: none;
        border-color: #ffcc00;
    }

    button {
        margin-top: 25px;
        background-color: #ffcc00;
        color: #0f1a3a;
        border: none;
        padding: 12px 18px;
        border-radius: 6px;
        font-weight: bold;
        font-size: 15px;
        width: 100%;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #e6b800;
    }
    
    .history-link {
        text-align: center;
        margin-top: 25px;
    }

    .history-link a {
        color: #ffcc00;
        text-decoration: none;
        font-weight: 500;
    }

    .history-link a:hover {
        text-decoration: underline;
    }
    

    footer {
        background-color: #1c1f57;
        color: white;
        text-align: center;
        padding: 15px;
        font-size: 13px;
        margin-top: 60px;
        border-top: 1px solid #222;
    }

    footer a {
        color: #ffcc00;
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

<div class="container">
    <h2>Hello, <%= user.getName() %> – Leave Your Feedback</h2>

    <form action="UserFeedbackSubmitServlet" method="post">
        <label for="message">Your Message:</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <label for="rating">Rate Us (1 to 5):</label>
        <select id="rating" name="rating" required>
            <option value="">-- Select Rating --</option>
            <option value="1">1 - Very Dissatisfied</option>
            <option value="2">2 - Dissatisfied</option>
            <option value="3">3 - Neutral</option>
            <option value="4">4 - Satisfied</option>
            <option value="5">5 - Very Satisfied</option>
        </select>

        <button type="submit">Submit Feedback</button>
    </form>
    
    <!-- View Feedback History Link -->
    <div class="history-link">
        <a href="UserPublicFeedback.jsp">🔍 View Feedback History</a>
    </div>
</div>

<!-- Footer -->
<footer>
     v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
    <br>
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>


</body>
</html>