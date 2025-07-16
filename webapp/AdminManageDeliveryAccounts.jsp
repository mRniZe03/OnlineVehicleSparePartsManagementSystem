<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
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
    <title>Manage Delivery Persons | AutoVio Admin</title>
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

        .add-btn {
            background-color: #2ecc71;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            margin-bottom: 20px;
        }
        
         #searchInput {
            width: 300px;
            padding: 10px 14px;
            border: none;
            border-radius: 8px;
            margin-bottom: 25px;
            font-family: 'Poppins', sans-serif;
            box-shadow: 0 0 5px rgba(255, 255, 255, 0.1);
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

        tr:hover {
            background-color: #222c5f;
            transition: 0.3s;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-family: 'Poppins', sans-serif;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .btn-primary {
            background-color: #3498db;
            color: white;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }

        .btn-danger:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        .back-btn {
            margin-top: 20px;
            background-color: #f9c802;
            color: black;
            font-weight: bold;
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
    <h2>Manage Delivery Personnels</h2>
    <button class="add-btn" onclick="location.href='AdminAddDeliverPerson.jsp'">+ Add Delivery Personnel</button>
    <input type="text" id="searchInput" placeholder="Search suppliers...">

    <table id="deliversTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Phone</th>
                <th>Password</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="d" items="${deliveryList}">
            <tr>
                <td>${d.deliverypersonid}</td>
                <td>${d.deliverypersonname}</td>
                <td>${d.deliverypersonemail}</td>
                <td>${d.deliverypersonusername}</td>
                <td>${d.deliverypersonphone}</td>
                <td>${d.deliverypersonpassword}</td>

                <td>
                    <form action="AdminEditDeliver.jsp" method="get">
                        <input type="hidden" name="deliverypersonid" value="${d.deliverypersonid}" />
                        <input type="hidden" name="deliverypersonname" value="${d.deliverypersonname}" />
                        <input type="hidden" name="deliverypersonemail" value="${d.deliverypersonemail}" />
                        <input type="hidden" name="deliverypersonusername" value="${d.deliverypersonusername}" />
                        <input type="hidden" name="deliverypersonphone" value="${d.deliverypersonphone}" />
                        <input type="hidden" name="deliverypersonpassword" value="${d.deliverypersonpassword}" />
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </td>

                <td>
                    <form action="AdminDeleteDeliverServlet" method="post" onsubmit="return confirm('Delete this delivery person?')">
                        <input type="hidden" name="deliverypersonid" value="${d.deliverypersonid}" />
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    
</div>

<script>
    document.getElementById("searchInput").addEventListener("input", function () {
        const filter = this.value.toUpperCase();
        const rows = document.querySelectorAll("#deliversTable tbody tr");

        rows.forEach(row => {
            const match = Array.from(row.getElementsByTagName("td")).some(td =>
                td.textContent.toUpperCase().includes(filter)
            );
            row.style.display = match ? "" : "none";
        });
    });
</script>

</body>
</html>
