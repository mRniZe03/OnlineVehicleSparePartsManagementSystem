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
<title>Registered User Profile</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
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

    .container {
        max-width: 600px;
        margin: 60px auto;
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

    p {
        font-size: 16px;
        margin: 12px 0;
        color: #ccc;
    }

    p strong {
        color: #ffffff;
    }

    .btn-group {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        margin-top: 30px;
    }

    .btn-group form {
        margin: 5px;
    }

    input[type="submit"], a.button {
        background-color: #ffcc00;
        color: #0f1a3a;
        border: none;
        padding: 10px 16px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
        transition: background-color 0.3s;
        text-decoration: none;
        display: inline-block;
    }

    input[type="submit"]:hover, a.button:hover {
        background-color: #e6b800;
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
        
        <h4>👤<%= user.getName() %></h4> |
        <a href="RegisteredUserLogoutServlet">Logout</a>
        
    </div>
</div>

 <div class="container">
    <h2>My Profile</h2>
    <p><strong>Name:</strong> <%= user.getName() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Username:</strong> <%= user.getUsername() %></p>
    <p><strong>Address:</strong> <%= user.getAddress() %></p>
    <p><strong>Contact No:</strong> <%= user.getContactNo() %></p>

    <div class="btn-group">
        <form action="RegisteredUserProfileUpdate.jsp" method="get">
            <input type="submit" value="Edit Profile">
        </form>

        <form action="RegisteredUserChangePassword.jsp" method="get">
            <input type="submit" value="Change Password">
        </form>

        <form action="RegisteredUserAccountDeleteServlet" method="post">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <input type="submit" value="Delete Account">
        </form>

        <form action="UserHome.jsp" method="post">
            <input type="submit" value="Back to Home">
        </form>
    </div>
</div>
 
 <div class="footer">
    v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
</div>
  
</body>
</html>