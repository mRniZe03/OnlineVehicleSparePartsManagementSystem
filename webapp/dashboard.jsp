<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.DeliveryPersonModel" %>
<%
DeliveryPersonModel delivery = (DeliveryPersonModel) session.getAttribute("delivery");
    if (delivery == null) {
        response.sendRedirect("deliveryPersonLogin.jsp");
        return;
    }
    String initial = delivery.getDeliverypersonusername() != null && !delivery.getDeliverypersonusername().isEmpty()
                     ? delivery.getDeliverypersonusername().substring(0, 1).toUpperCase()
                     : "D";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivery Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #050e2d;
            color: #fff;
        }

        .navbar {
            background-color: #060f2f;
            display: flex;
            align-items: center;
            padding: 15px 30px;
            justify-content: space-between;
        }

        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
            color: #f9c802;
            display: flex;
            align-items: center;
        }

        .navbar .logo span {
            margin-left: 8px;
        }

        .navbar nav a {
            color: white;
            text-decoration: none;
            margin-left: 30px;
            font-size: 16px;
        }

        .navbar nav a:hover {
            color: #f9c802;
        }

        .dashboard-title {
            text-align: center;
            font-size: 32px;
            color: #f9c802;
            margin: 40px 0 20px;
        }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 40px;
            padding: 0 40px;
            flex-wrap: wrap;
        }

        .card {
            border-radius: 14px;
            width: 250px;
            height: 200px;
            padding: 30px 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            text-align: center;
        }

        .card h3 {
            font-size: 30px;
            margin: 10px 0;
            color: #f9c802;
        }

        .card .value {
            font-size: 40px;
            font-weight: bold;
            color: white;
            margin-top: 10px;
        }

        .top-performer {
            background-color: #000000;
        }

        .blue-card {
            background-color: #103580;
        }

        .card .icon {
            font-size: 40px;
        }

        .top-performer .icon {
            font-size: 40px;
            color: #f9c802;
        }

        .blue-card .icon {
            color: white;
        }

        .value-small {
            font-size: 20px;
            color: #fff;
            margin-top: 8px;
        }
        .top-bar {
           background-color: #06092c;
            color: white;
            padding: 10px 40px;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            
        }

        .navbar {
            background-color: #1c1f57;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 40px;
        }

        .logo {
            color: #f1c40f;
            font-size: 24px;
            font-weight: 600;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 18px;
            font-weight: 500;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #f1c40f;
        }
           .profile-section {
            display: flex;
            align-items: center;
        }
        .profile-icon {
            width: 35px;
            height: 35px;
            background-color: #3498db;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            margin-left: 10px;
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="top-bar">
    <div>🔐 Delivery Personal Panel</div>
    <div>
        🧑‍💼 
       
            Logged in as: <%= delivery.getDeliverypersonusername() %>
       
        | 
        <a href="DeliverylogoutServlet" style="color: #f1c40f; font-weight: bold;">Logout</a>
    </div>
    <div class="profile-section">
        <a href="DeliveryProfile.jsp" style="text-decoration: none; color: inherit;">
            <span>profile</span>
        </a>
        <div class="profile-icon"><%= initial %></div>
    </div>
</div>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">AutoVio Delivery Personal</div>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="deliveryallServlet">Delivery staff</a>
        <a href="AssignedJobServlet">Assigned job</a>
       
    </nav>
</div>


<!-- Dashboard Heading -->
<div class="dashboard-title">Delivery Dashboard</div>

<!-- Cards -->
<div class="card-container">

    <!-- Total Delivery Staff -->
    <div class="card blue-card">
        <div class="icon">🧑‍✈</div>
        <h3>Total Delivery Staff</h3>
        <p>36</p>
    </div>

    <!-- Top Performer -->
    <div class="card top-performer">
        <div class="icon">🏅</div>
        <h3>Top Performer</h3>
        <p>Name:Asha</p>
        <p>ID:002</p>
    </div>

    <!-- Monthly Deliveries -->
    <div class="card blue-card">
        <div class="icon">📈</div>
        <h3>Monthly Deliveries</h3>
        <p>50</p>
    </div>

</div>

</body>
</html>
