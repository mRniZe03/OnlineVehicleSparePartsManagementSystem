<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SupplierNotificationModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
    List<SupplierNotificationModel> notifications = (List<SupplierNotificationModel>) request.getAttribute("notifications");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier Notification History</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color:#0c113a;
            margin: 0;
            
           
        }
        h2 {
            color:#f1c40f;
            text-align: center;
            margin-top:60px;
            margin-bottom:30px;
        }
        table {
            width: 96%;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            color:white;
            margin-left:25px;
            border-radius:12px;
            margin-bottom:30px;
            border-collapse:collapse;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
            
        }
        th {
            background-color:#1e2b57;
            color:#f1c40f;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        tr{
            background-color:#1a2550;
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
        button{
            background-color:#2471a3;
            width: 70%;
            padding: 12px;
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
            
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
    <h2>Supplier Notification History</h2>

    <c:if test="${empty notifications}">
        <p style="text-align: center; color: red;">No notifications available.</p>
    </c:if>

    <table>
    <thead>
        <tr>
            <th>Notification ID</th>
            <th>Request ID</th>
            <th>Supplier ID</th>
            <th>Action Status</th>
            <th>Report</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="note" items="${notifications}">
            <tr>
                <td>${note.notification_id}</td>
                <td>${note.request_id}</td>
                <td>${note.supplierid}</td>
                <td>${note.action_status}</td>
                <td>
                    <c:if test="${note.action_status == 'accepted'}">
                        <form action="SupplierSparePartReportServlet" method="post">
                            <input type="hidden" name="request_id" value="${note.request_id}" />
                            <button type="submit">Create Report</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


</body>
</html>
