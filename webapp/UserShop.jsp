<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel, model.UserSparePartModel" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    List<UserSparePartModel> parts = (List<UserSparePartModel>) request.getAttribute("spareParts");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Shop</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
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
        }
        .navbar {
            background-color: #0d112d;
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.4);
            border-bottom: 1px solid #22264c;
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .logo {
           font-size: 22px;
           color: #ffcc00;
           font-weight: 600;
        }
        .navbar a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .navbar a:hover {
            color: #f9c802;
            text-shadow: 0 0 5px rgba(255, 204, 0, 0.5);
        }
        .logout-btn {
            background-color: #f9c802;
            color: #0f1a3a;
            padding: 6px 14px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #e6b800;
            color: #000;
        }
        .main {
            padding: 30px;
        }
        /* NEW: Product container for flex layout */
        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px 3%; /* vertical and horizontal gap */
            width: 90%;
            margin: 0 auto;
        }
        /* UPDATED: Card for side-by-side layout */
        .card {
            background: #1e295e;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.5);
            display: flex;
            flex-direction: row;
            padding: 20px;
            align-items: center;
            transition: transform 0.3s, box-shadow 0.3s;
            flex: 0 0 47%; /* 2 cards per row with gap */
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 20px rgba(249, 200, 2, 0.6);
        }
        .card img {
            width: 130px;
            height: 130px;
            border-radius: 12px;
            margin-right: 25px;
            object-fit: cover;
            background-color: #fff;
            border: 2px solid #fff;
        }
        .card-details {
            flex: 1;
        }
        .card-details h3 {
            color: #f9c802;
            font-size: 20px;
            margin: 0 0 10px;
        }
        .card-details p {
            margin: 5px 0;
            color: #e6e6e6;
        }
        .star-rating {
            color: #ffd700;
            font-size: 14px;
            margin-top: 6px;
        }
        .action-btns {
            margin-top: 10px;
        }
        .add-cart-btn {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .add-cart-btn:hover {
            background-color: #cc0000;
        }
        .search-bar {
            padding: 20px;
            background: #1e295e;
            margin-bottom: 30px;
            border-radius: 12px;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        }
        .search-bar form {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .search-bar select,
        .search-bar button {
            padding: 10px 14px;
            border-radius: 6px;
            border: none;
            font-size: 14px;
        }
        .search-bar select {
            background-color: #0c1333;
            color: #f0f0f0;
        }
        .search-bar button {
            background-color: #f9c802;
            color: #0f1a3a;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .search-bar button:hover {
            background-color: #e6b800;
        }
        .no-items {
            text-align: center;
            color: #ccc;
            font-size: 18px;
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
        @media (max-width: 900px) {
            .card {
                flex: 0 0 100%;
            }
            .product-container {
                gap: 20px 0;
            }
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

<!-- NAVIGATION -->
<div class="navbar">
    <div class="logo">eSpareMart</div>
    <div>
        <a href="UserHome.jsp">Home</a>
        <a href="ContactUs.jsp">Contact Us</a>
        <a href="AboutUs.jsp">About Us</a>
    </div>
    <div>
        <% if (user != null) { %>
            <span>👤<%= user.getName() %></span> |
            <a href="RegisteredUserLogoutServlet" class="logout-btn">Logout</a>
        <% } else { %>
            <a href="RegisteredUserLogin.jsp">Login</a>
        <% } %>
    </div>
</div>

<!-- SEARCH -->
<div class="main">
    <div class="search-bar">
        <form method="get" action="UserShopServlet">
            <select name="category" id="category">
                <option value="all">All</option>
                <option value="Body Parts">Body Parts</option>
                <option value="Braking System">Braking System</option>
                <option value="Engine Components">Engine Components</option>
                <option value="Suspension & Steering">Suspension & Steering</option>
                <option value="Tyres & Wheels">Tyres & Wheels</option>
            </select>
            <button type="submit">Search</button>
        </form>
    </div>

    <!-- PRODUCT DISPLAY -->
    <div class="product-container">
    <%
        if (parts != null && !parts.isEmpty()) {
            for (UserSparePartModel part : parts) {
    %>
        <div class="card">
            <img src="data:image/jpeg;base64,<%= part.getPhotoBase64() %>" alt="Part Image" />
            <div class="card-details">
                <h3><%= part.getName() %></h3>
                <p>Category: <%= part.getCategory() %></p>
                <p>Price: Rs. <%= part.getPrice() %></p>
                <p>Status: <%= (part.getQuantity() > 0) ? "Stock Available" : "Out of Stock" %></p>
                <p class="star-rating">★★★★☆</p>
                <div class="action-btns">
                    <form action="UserSparePartsView.jsp" method="get" style="display: inline;">
                        <input type="hidden" name="id" value="<%= part.getSpare_id() %>">
                        <button type="submit" class="add-cart-btn">View</button>
                    </form>
                </div>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <p class="no-items">No spare parts available.</p>
    <%
        }
    %>
    </div>
</div>

<!-- Footer -->
<footer>
     v1.0 - © 2025 <strong>AutoVio</strong>. All rights reserved.
    <br>
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>

</body>
</html>
