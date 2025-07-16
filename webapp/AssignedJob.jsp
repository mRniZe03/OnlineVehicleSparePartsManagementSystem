<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.AssignedJobModel" %>
<%@ page import="java.util.List" %>
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
<%
    List<AssignedJobModel> jobs = (List<AssignedJobModel>) request.getAttribute("assignedJobs");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assigned Jobs</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #0f1a3a;
        color: #fff;
        margin: 0;
        padding:0;
    }

    h2 {
        text-align: center;
        color: #f9c802;
        margin-bottom: 30px;
        font-size: 28px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #111742;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        border-radius: 8px;
        overflow: hidden;
    }

    th {
        background-color: #1c1f57;
        color: #f9c802;
        padding: 14px;
        font-size: 14px;
        text-transform: uppercase;
    }

    td {
        padding: 12px;
        text-align: center;
        font-size: 14px;
        border-bottom: 1px solid #2c3e50;
    }

    tr:nth-child(even) {
        background-color: #0f1a3a;
    }

    tr:hover {
        background-color: #1b254d;
    }

    td[colspan="11"] {
        color: #bbb;
        font-style: italic;
    }
    .top-bar {
           background-color: #06092c;
            color: white;
            padding: 10px 40px;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            box-sizing: border-box;
            
        }

        .navbar {
            background-color: #1c1f57;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 40px;
            width: 100%; 
            box-sizing: border-box;
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
    <h2>Assigned Jobs</h2>
    <table>
        <tr>
            <th>Job ID</th>
            <th>Order ID</th>
            <th>User ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Delivery ID</th>
            <th>Delivery Name</th>
            <th>Order Date</th>
            <th>Payment Method</th>
        </tr>
        <% if (jobs != null && !jobs.isEmpty()) {
            for (AssignedJobModel job : jobs) {
        %>
        <tr>
            <td><%= job.getJobAssignedId() %></td>
            <td><%= job.getOrderId() %></td>
            <td><%= job.getUserId() %></td>
            <td><%= job.getFirstName() %></td>
            <td><%= job.getLastName() %></td>
            <td><%= job.getEmail() %></td>
            <td><%= job.getPhone() %></td>
            <td><%= job.getDeliveryId() %></td>
            <td><%= job.getDeliveryName() %></td>
            <td><%= job.getOrderDate() %></td>
            <td><%= job.getPaymentMethod() %></td>
        </tr>
        <% 
            }
        } else { %>
        <tr>
            <td colspan="11">No assigned jobs available.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>