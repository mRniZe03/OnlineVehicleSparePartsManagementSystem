<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.AdminModel" %>
<%
    AdminModel admin = (AdminModel) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
    String username = (admin.getUsername() != null && !admin.getUsername().isEmpty()) ? admin.getUsername() : "Admin";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registered Users | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0f1a3a;
            color: #f0f0f0;
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
            color: #f9c802;
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
            color: #f9c802;
        }

        .container {
            padding: 40px;
        }

        h2 {
            color: #f9c802;
            margin-bottom: 30px;
            text-align: center;
            font-size: 26px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #111742;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 0 12px rgba(0,0,0,0.3);
        }

        th, td {
            padding: 14px 16px;
            text-align: center;
        }

        th {
            background-color: #1e2b57;
            color: #f9c802;
        }

        td {
            background-color: #1a2550;
            color: #ffffff;
        }

        tbody tr:hover {
            background-color: #222c5f;
            transition: 0.3s;
        }
    </style>
</head>
<body>

<!-- Top Bar -->
<div class="top-bar">
    <div>🔐 Admin Panel</div>
    <div>
        🧑‍💼 
        <a href="AdminProfile.jsp" style="color: #f1c40f; font-weight: bold; text-decoration: none;">
            Logged in as: <%= username %>
        </a>
        | 
        <a href="AdminLogoutServlet" style="color: #f1c40f; font-weight: bold;">Logout</a>
    </div>
</div>

<!-- Navbar -->
<div class="navbar">
    <div class="logo">AutoVio Admin</div>
    <nav>
        <a href="AdminDashboard.jsp">Dashboard</a>
        <a href="AdminDisplayCustomerServlet">Users</a>
        <a href="AdminDisplaySupplierServlet">Suppliers</a>
        <a href="AdminDisplayDeliverServlet">Delivery Personnels</a>
        <a href="AdminSparePartGetAllServlet">Inventory</a>
        <a href="AdminCompanyOrdersServlet">Reports</a>
    </nav>
</div>

<div class="container">
    <h2>Registered Users</h2>

    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Address</th>
                <th>Contact Number</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cust" items="${allcustomers}">
                <tr>
                    <td>${cust.id}</td>
                    <td>${cust.name}</td>
                    <td>${cust.email}</td>
                    <td>${cust.username}</td>
                    <td>${cust.address}</td>
                    <td>${cust.contactNo}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>