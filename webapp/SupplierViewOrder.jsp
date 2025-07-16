<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SupplierCompanyOrderModel" %>
<%@ page import="model.SupplierModel" %>
<%
    SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");
    if (supplier == null) {
        response.sendRedirect("SupplierLogin.jsp");
        return;
    }
    String initial = supplier.getSupplierusername() != null && !supplier.getSupplierusername().isEmpty()
                     ? supplier.getSupplierusername().substring(0, 1).toUpperCase()
                     : "S";
%>
<%
    List<SupplierCompanyOrderModel> orders = (List<SupplierCompanyOrderModel>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Orders</title>
    <style>
        body {
         font-family: Arial,sans-serif; 
         background-color:#0c113a; 
         margin: 0;
        }
        h2 {
          text-align: center; 
          margin-bottom:50px;
          color:#f1c40f;
          margin-top:50px; 
        }
        table {
          width:96%;
          border-collapse:collapse; 
          background-color:#1a2550; 
          box-shadow: 0 0 10px rgba(0,0,0,0.1); 
          margin-top:20px;
          margin-bottom:30px;
          margin-left:25px;
          border-radius:12px;
          border-spacing: 0;
          border-radius: 12px;
          overflow: hidden;
          }
        th, td {
          padding: 12px;
          text-align: center;
          color:white; 
        }
        th { 
           background-color:#1e2b57;
           color:#f1c40f;
           
        }
      
        button {
             padding: 6px 12px;
             margin: 2px; 
             border: none; 
             border-radius: 4px; 
             cursor: pointer; 
         }
        button[name="action"][value="accept"] { 
             background-color: #27ae60; 
             color: white; 
         }
        button[name="action"][value="decline"] { 
             background-color: #c0392b; 
             color: white; 
        }
        strong {
             color: #2980b9; 
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
        .btn-success{
            background-color:green;
           
        }
        .btn-danger{
             background-color:light blue;
        }
 
    </style>
</head>
<body>

<!-- Top Bar -->
<div class="top-bar">
    <div>🔐 Supplier Panel</div>
    <div>
        🧑‍💼 Logged in as: <%= supplier.getSupplierusername() %> |
        <a href="SupplierLogoutServlet" style="color: #f1c40f; font-weight: bold;">Logout</a>
    </div>
    <div class="profile-section">
        <a href="SupplierProfile.jsp" style="text-decoration: none; color: inherit;">
            <span>Profile</span>
        </a>
        <div class="profile-icon"><%= initial %></div>
    </div>
</div>

<!-- Navigation Bar -->
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
<h2>Company Orders</h2>

<!-- Orders Table -->
<table>
    <thead>
        <tr>
            <th>Request ID</th>
            <th>Spare ID</th>
            <th>Admin ID</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.request_id}</td>
                <td>${order.spare_id}</td>
                <td>${order.adminid}</td>
                <td>${order.amount}</td>
                <td>${order.status}</td>
                <td>
                    <c:choose>
                        <c:when test="${order.status eq 'order'}">
                            <!-- Accept Form -->
                            <form method="post" action="SupplierOrderActionServlet" style="display:inline;">
                                <input type="hidden" name="requestId" value="${order.request_id}" />
                                <input type="hidden" name="spareId" value="${order.spare_id}" />
                                <input type="hidden" name="amount" value="${order.amount}" />
                                <input type="hidden" name="supplierid" value="<%= supplier.getSupplierid() %>" />
                                <input type="hidden" name="action" value="accept" />
                                <button type="submit" class="btn btn-success">Accept</button>
                            </form>

                            <!-- Decline Form -->
                            <form method="post" action="SupplierOrderActionServlet" style="display:inline;">
                                <input type="hidden" name="requestId" value="${order.request_id}" />
                                <input type="hidden" name="spareId" value="${order.spare_id}" />
                                <input type="hidden" name="amount" value="${order.amount}" />
                                <input type="hidden" name="supplierid" value="<%= supplier.getSupplierid() %>" />
                                <input type="hidden" name="action" value="decline" />
                                <button type="submit" class="btn btn-danger">Decline</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <strong>
                                <c:choose>
                                    <c:when test="${order.status eq 'remove'}">Removed by Admin</c:when>
                                    <c:otherwise>${order.status}</c:otherwise>
                                </c:choose>
                            </strong>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>


</body>
</html>
