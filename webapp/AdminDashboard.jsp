<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.AdminModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    AdminModel admin = (AdminModel) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
    String username = admin.getUsername();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | AutoVio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #0c113a;
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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


        .main-content {
            padding: 30px 40px;
            text-align: center;
        }

        .dashboard-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 30px;
        }

        .card {
            background-color: #1c1f57;
            padding: 16px;
            border-radius: 10px;
            width: 140px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.4);
        }

        .card-icon {
            font-size: 20px;
            margin-bottom: 8px;
        }

        .card h3 {
            color: #f1c40f;
            font-size: 13px;
            margin-bottom: 4px;
        }

        .card p {
            font-size: 18px;
            font-weight: bold;
        }

        .charts-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            margin-top: 30px;
            padding: 0 40px;
        }

        .chart-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #1c1f57;
            border-radius: 12px;
            padding: 14px;
            height: 320px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }

        .chart-box h4 {
            color: #f1c40f;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .chart-box canvas {
            width: 100% !important;
            height: 230px !important;
            max-width: 100%;
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
<!-- Main Content -->
<div class="main-content">

    <!-- Info Cards -->
    <div class="dashboard-cards">
        <div class="card">
            <div class="card-icon">📦</div>
            <h3>Spare Parts</h3>
            <p><c:import url="AdminSparePartCountServlet"/></p>
        </div>
        <div class="card">
            <div class="card-icon">🛒</div>
            <h3>New Orders</h3>
            <p><c:import url="AdminNewOrdersCountServlet"/></p>
        </div>
        <div class="card">
            <div class="card-icon">🚚</div>
            <h3>Deliveries</h3>
            <p><c:import url="AdminDeliveryCountServlet"/></p>
        </div>
        <div class="card">
            <div class="card-icon">👥</div>
            <h3>Users</h3>
            <p><c:import url="AdminUserCountServlet"/></p>
        </div>
        <div class="card">
            <div class="card-icon">🏭</div>
            <h3>Suppliers</h3>
            <p><c:import url="AdminSupplierCountServlet"/></p>
        </div>
    </div>

    <!-- Charts Section -->
    <div class="charts-grid">
        <div class="chart-box">
            <h4>Top Sales</h4>
            <canvas id="pieChart" style="max-width: 240px; height: 220px;"></canvas>
        </div>
        <div class="chart-box">
            <h4>Order History</h4>
            <canvas id="barChart"></canvas>
        </div>
        <div class="chart-box">
            <h4>Revenue Growth</h4>
            <canvas id="lineChart"></canvas>
        </div>
    </div>

</div>

<!-- Footer -->
<footer>
    Admin Portal v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved. |
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>

<!-- Chart JS Script -->
<script>
fetch("AdminTopSalesServlet")
.then(response => response.json())
.then(data => {
    const labels = Object.keys(data);
    const values = Object.values(data);

    new Chart(document.getElementById("pieChart"), {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: values,
                backgroundColor: ['#3498db', '#e74c3c', '#9b59b6']
            }]
        },
        options: {
            cutout: '60%',
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: { font: { size: 12 }, color: 'white' }
                }
            }
        }
    });
});


fetch("AdminOrderStatsServlet")
.then(response => response.json())
.then(data => {
    console.log("BAR CHART DATA:", data); // ✅ Will show in F12 Console

    const labels = Object.keys(data);
    const values = Object.values(data);

    new Chart(document.getElementById("barChart"), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Orders (Last 4 Months)',
                data: values,
                backgroundColor: '#f1c40f',
                barThickness: 40
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { color: 'white' }
                },
                x: {
                    ticks: { color: 'white' }
                }
            }
        }
    });
})
.catch(error => {
    console.error("BAR CHART ERROR:", error);
});
fetch("AdminRevenueServlet")
.then(response => response.json())
.then(data => {
    const labels = Object.keys(data);
    const values = Object.values(data);

    new Chart(document.getElementById("lineChart"), {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Revenue (Rs)',
                borderColor: '#2ecc71',
                fill: false,
                tension: 0.4,
                data: values
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    labels: {
                        color: 'white'
                    }
                }
            },
            scales: {
                x: {
                    ticks: { color: 'white' }
                },
                y: {
                    ticks: { color: 'white' }
                }
            }
        }
    });
})
.catch(error => {
    console.error("LINE CHART ERROR:", error);
});

</script>

</body>
</html>
