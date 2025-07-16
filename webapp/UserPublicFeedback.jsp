<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserFeedbackModel, service.user.UserFeedbackService, service.user.UserFeedbackServiceImpl, java.util.List" %>
<%
    UserFeedbackService service = new UserFeedbackServiceImpl();
    List<UserFeedbackModel> feedbackList = service.getAllFeedback();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Feedback</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

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

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
        padding: 40px 0;
    }

    .container {
        max-width: 800px;
        margin: auto;
        background-color: #1e295e;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    h2 {
        text-align: center;
        color: #ffcc00;
        margin-bottom: 30px;
    }

    .feedback-box {
        border-bottom: 1px solid #333;
        padding: 20px 0;
    }

    .username {
        font-weight: bold;
        font-size: 16px;
        color: #ffcc00;
    }

    .timestamp {
        font-size: 13px;
        color: #ccc;
        margin-top: 4px;
    }

    .message {
        margin: 12px 0;
        font-size: 15px;
        color: #ddd;
    }

    .stars {
        color: #f1c40f;
        font-size: 16px;
    }

    p {
        text-align: center;
        color: #ccc;
    }
    
    .footer {
    background-color: #111742;
    color: #cccccc;
    text-align: center;
    padding: 15px;
    font-size: 14px;
    border-top: 1px solid #222;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
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
        
        
        <a href="RegisteredUserLogoutServlet">Logout</a>
        
    </div>
</div>
<div class="container">
        <h2>User Feedback</h2>

        <% if (feedbackList != null && !feedbackList.isEmpty()) {
            for (UserFeedbackModel fb : feedbackList) {
        %>
            <div class="feedback-box">
                <div class="username">🧑 <%= fb.getUsername() %></div>
                <div class="timestamp">🕒 <%= fb.getSubmittedAt() %></div>
                <div class="stars">
                    <% for (int i = 1; i <= 5; i++) { %>
                        <%= i <= fb.getRating() ? "★" : "☆" %>
                    <% } %>
                </div>
                <div class="message">💬 <%= fb.getMessage() %></div>
            </div>
        <% }} else { %>
            <p>No feedback available yet.</p>
        <% } %>
    </div>
 
 <div class="footer">
    v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
</div>
   
</body>
</html>