<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.SupplierModel" %>
<%
    SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");
    if (supplier == null) {
        response.sendRedirect("SupplierLogin.jsp");
        return;
    }
    String initial = (supplier.getSupplierusername() != null && !supplier.getSupplierusername().isEmpty())
                     ? supplier.getSupplierusername().substring(0, 1).toUpperCase()
                     : "S";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
       
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        body {
            background-color:#0c113a;
            color: white;
            background-repeat: no-repeat;
            background-attachment: fixed;
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
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .dashboard-title h1 {
            color: #2c3e50;
            font-size: 24px;
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
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin: 30px 20px 20px 20px;
        }
        .dashboard-cards h2{
            color:white;
            
        }
        .card {
            background-color:#1e295e;
            border-radius: 8px;
            padding: 40px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            color:#f1c40f;
            font-weight:bold;
            font-size:18px;
        }
        .card:hover {
             transform: scale(1.05);
             box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
             background-color: #263875;
             color: #f8d44d;
         }
        
        .low-stock { background-color: #C172E9; }
        .spare-parts { background-color: #D483AC; }
        .Revenue { background-color: #96f2d7; }
        .New-Orders { background-color: #ffc9c9; }

        .notification-card h3 {
            color: black;
            margin-bottom: 10px;
            font-size: 14px;
            text-transform: uppercase;
        }

        .notification-card p {
            font-size: 24px;
            font-weight: bold;
            color: black;
        }

        .analytics-section {
            display: flex;
            justify-content: space-around;
            align-items: flex-start;
            gap: 30px;
            margin: 40px 20px;
            flex-wrap: wrap;
        }

        .chart-card {
            background-color:#1a2550;
            padding: 20px;
            border-radius: 8px;
            flex: 1 1 50%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
         .chart-card:hover {
             transform: scale(1.05);
             box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
             background-color: #263875;
             color: #f8d44d;
         }

        .chart-card h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .chart-card canvas {
            width: 100% !important;
            height: 300px !important;
        }

        .table-card {
            background-color:#1e295e;
            color:black;
            border-radius: 8px;
            padding: 20px;
            flex: 1 1 45%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
         .table-card:hover {
             transform: scale(1.05);
             box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
             background-color: #263875;
             color: #f8d44d;
         }

        .table-card h2, .table-card h3 {
            color: #f9c802;
            margin-bottom: 15px;
            font-size: 18px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #1a1a3a;
            color:#96f2f2;
            font-weight: 600;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color:#63e6be ;
            color: #7f8c8d;
            font-weight: normal;
        }
        tr:hover {
    background-color: #26264f;
        }
           footer {
            background-color: #12174f;
            color: white;
            padding: 10px 20px;
            text-align: center;
            font-size: 12px;
            margin-top: auto;
        }

        footer a {
            color: #f1c40f;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
            }
       
    </style>
</head>
<body>
<div class="top-bar">
    <div>🔐 Supplier Panel</div>
    <div>
        🧑‍💼 Logged in as: <%= supplier.getSupplierusername() %> | 
        <a href="SupplierLogoutServlet" style="color: #f1c40f; font-weight: bold;">Logout</a>
    </div>
    <div class="profile-section">
        <a href="SupplierProfile.jsp" style="text-decoration: none; color: inherit;">
            <span>profile</span>
        </a>
        <div class="profile-icon"><%= initial %></div>
    </div>
</div>

<div class="navbar">
    <div class="logo">Auto Vivo</div>
    <nav>
        <a href="SupplierDashboardServlet">Dashboard</a>
        <a href="SupplierSparepartInsert.jsp">Add Spare Parts</a>
        <a href="SupplierSparePartGetAllServlet">Manage Spare Parts</a>
        <a href="SupplierOrderActionServlet">View Company Orders</a>
        <a href="SupplierNotificationHistoryServlet">Order History</a>
    </nav>
</div>

<div class="dashboard-cards">
    <div class="card">Low Stock Alerts <h2>${lowStock}</h2></div>
    <div class="card">Spare Parts <h2>${sparePartsCount}</h2></div>
    <div class="card">Additional Income <h2>Rs. ${additionalIncome}</h2></div>
    <div class="card">New Orders <h2>${newOrders}</h2></div>
</div>

<div class="analytics-section">
    <div class="chart-card">
        <h3 style="text-align: center; color: #f1c40f; margin-top: 40px;">Spare Parts by Category</h3>
        <canvas id="categoryChart"></canvas>
    </div>

    <div class="table-card">
        <h3>Recent Orders</h3>
        <table>
            <tr><th>Order ID</th><th>Part Name</th><th>Quantity</th></tr>
            <c:forEach items="${recentOrders}" var="order">
                <tr>
                    <td>${order.request_id}</td>
                    <td>${order.part_name}</td>
                    <td>${order.amount}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<footer>
    Supplier Portal v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved. |
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>

<!-- Updated Chart.js with thinner bars -->
<script>
    fetch('SupplierChartDataServlet')
        .then(res => res.json())
        .then(data => {
            new Chart(document.getElementById("categoryChart"), {
                type: 'bar',
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: 'Items per Category',
                        data: data.data,
                        backgroundColor: '#f1c40f',
                        borderRadius: 0,
                        barThickness: 30
                    }]
                },
                options: {
                    plugins: {
                        legend: { display: false },
                        title: {
                            display: true,
                            text: 'Spare Parts by Category',
                            color: '#f9c802',
                            font: {
                                size: 17,
                                weight: 'bold'
                            }
                        }
                    },
                    scales: {
                        x: {
                            ticks: { color: 'white' },
                            grid: { color: '#333' }
                        },
                        y: {
                            beginAtZero: true,
                            ticks: {
                                color: 'white',
                                stepSize: 1
                            },
                            grid: { color: '#333' }
                        }
                    }
                }
            });
        });
</script>

</body>
</html>
