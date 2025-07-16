<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Admin Home | AutoVio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0; padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html, body {
            height: 100%;
            overflow: hidden;
        }

        body {
            background-color: #111742;
            color: white;
            display: flex;
            flex-direction: column;
            animation: fadeInBody 1.2s ease-in-out;
        }

        @keyframes fadeInBody {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
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

        .hero {
            flex: 1;
            background: linear-gradient(to right, rgba(11, 15, 61, 0.9), rgba(11, 15, 61, 0.7)),
                        url('https://cdn.pixabay.com/photo/2017/03/27/14/56/audi-2179220_1280.jpg') center center / cover no-repeat;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 60px;
        }

        .hero h2, .hero h1, .hero p, .go-btn {
            opacity: 0;
            transform: translateY(30px);
            animation: slideFade 1s ease forwards;
        }

        .hero h2 { animation-delay: 0.2s; color: #f1c40f; font-size: 20px; margin-bottom: 10px; }
        .hero h1 { animation-delay: 0.4s; font-size: 42px; font-weight: bold; margin-bottom: 10px; }
        .hero p  { animation-delay: 0.6s; font-size: 18px; color: #ddd; margin-bottom: 25px; }
        .go-btn  { animation-delay: 0.8s; }

        @keyframes slideFade {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

	    .go-btn {
		    background-color: #f1c40f;
		    color: #000;
		    padding: 10px 22px;
		    border: none;
		    border-radius: 8px;
		    font-weight: 600;
		    font-size: 16px;
		    cursor: pointer;
		    text-decoration: none;
		    box-shadow: 0 0 0 transparent;
		    transition: all 0.3s ease-in-out;
		    display: inline-block;
		    max-width: 240px;
		    text-align: center;
		}
		.go-btn:hover {
		    background-color: #e0b600;
		    box-shadow: 0 0 10px rgba(241, 196, 15, 0.6);
		    transform: translateY(-2px);
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

<!-- Hero Section -->
<section class="hero">
    <h2>System Overview</h2>
    <h1>Welcome to the Auto Parts Admin Portal</h1>
    <p>This is your central hub to manage and monitor the entire AutoVio system efficiently.</p>
    
    <a href="AdminDashboard.jsp" class="go-btn">Go to Dashboard</a>


</section>

<!-- Footer -->
<footer>
    Admin Portal v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
    <br>
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>

</body>
</html>
