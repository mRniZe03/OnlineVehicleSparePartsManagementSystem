<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <meta charset="UTF-8" />
    <title>Spare Parts Inventory | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', Arial, sans-serif;
            background: #0f1a3a;
            color: #f0f0f0;
        }
        .top-bar {
            background: #06092c;
            color: #fff;
            padding: 12px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .top-bar a {
            color: #f9c802;
            font-weight: 600;
            text-decoration: none;
            margin-left: 12px;
        }
        .navbar {
            background: #1c1f57;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 40px;
        }
        .logo {
            color: #f9c802;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 1.2px;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 20px;
            font-weight: 500;
            font-size: 1rem;
            transition: color 0.3s;
        }
        nav a:hover {
            color: #f9c802;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto 0;
            padding: 30px 20px 60px;
            background: rgba(30,41,94,0.95);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
        }
        h2 {
            color: #f9c802;
            margin-bottom: 30px;
            font-size: 2.2rem;
            font-weight: 700;
            text-align: center;
            letter-spacing: 1.1px;
        }
        #searchInput {
            width: 100%;
            max-width: 400px;
            padding: 12px 16px;
            margin: 0 auto 30px;
            display: block;
            border-radius: 12px;
            border: none;
            font-size: 1rem;
            background-color: #18204a;
            color: #f0f0f0;
            box-shadow: 0 0 12px rgba(249, 200, 2, 0.5);
        }
        #searchInput:focus {
            outline: none;
            box-shadow: 0 0 20px #f9c802;
            background-color: #1e295e;
        }
        .table-wrapper {
            overflow-x: auto;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            background-color: #111742;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            min-width: 900px;
            font-size: 0.98rem;
        }
        thead tr {
            background-color: #1e2b57;
        }
        th, td {
            padding: 14px 18px;
            text-align: center;
            vertical-align: middle;
        }
        th {
            color: #f9c802;
            font-weight: 600;
            letter-spacing: 0.05em;
            background-color: #1e2b57;
        }
        tbody tr {
            background-color: #1a2550;
            transition: background-color 0.3s;
        }
        tbody tr:hover {
            background-color: #222c5f;
        }
        img.part-image {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 8px;
            border: 1.5px solid #444;
            box-shadow: 0 0 6px rgba(249, 200, 2, 0.7);
        }
        form {
            display: inline-block;
            margin: 0 4px;
        }
        button.btn {
            padding: 8px 14px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            transition: transform 0.2s, background-color 0.3s;
        }
        button.btn-primary {
            background-color: #3498db;
            color: white;
        }
        button.btn-primary:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }
        button.btn-danger {
            background-color: #e74c3c;
            color: white;
        }
        button.btn-danger:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }
        @media (max-width: 1024px) {
            .container { padding: 20px 5px 40px; }
            table { min-width: 700px; }
        }
        @media (max-width: 700px) {
            nav a { margin: 0 10px; font-size: 0.95rem; }
            .container { padding: 10px 2vw 20px; }
            table { min-width: 500px; font-size: 0.92rem; }
        }
        @media (max-width: 480px) {
            .logo { font-size: 20px; }
            h2 { font-size: 1.2rem; }
            button.btn { padding: 6px 10px; font-size: 0.85rem; }
        }
    </style>
</head>
<body>

<!-- Top Bar -->
<div class="top-bar">
    <div>🔐 Admin Panel</div>
    <div>
        🧑‍💼 
        <a href="AdminProfile.jsp">
            Logged in as: <%= username %>
        </a>
        | 
        <a href="AdminLogoutServlet">Logout</a>
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
<div class="container">
    <h2>Spare Parts Inventory</h2>

    <input type="text" id="searchInput" placeholder="Search spare parts...">

    <div class="table-wrapper">
        <table id="partsTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Qty</th>
                    <th>Description</th>
                    <th>Supplier ID</th>
                    <th>Photo</th>
                    <th>Actions</th>
                    <th>Report</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="part" items="${allspareparts}">
                    <tr>
                        <td><c:out value="${part.spare_id}" /></td>
                        <td><c:out value="${part.name}" /></td>
                        <td><c:out value="${part.price}" /></td>
                        <td><c:out value="${part.category}" /></td>
                        <td><c:out value="${part.quantity}" /></td>
                        <td><c:out value="${part.description}" /></td>
                        <td><c:out value="${part.supplierid}" /></td>
                        <td>
                            <c:choose>
                    <c:when test="${not empty part.photoBase64}">
                        <img src="data:image/jpeg;base64,${part.photoBase64}" 
                          width="60" height="60" alt="Spare part image"/>
                    </c:when>
                 <c:otherwise>
                     No Image
                 </c:otherwise>
               </c:choose>
                        </td>
                        <td>
                            <form action="AdminEditSparePartServlet" method="get" style="display:inline;">
                                <input type="hidden" name="spare_id" value="${part.spare_id}">
                                <button class="btn btn-primary">Update</button>
                            </form>
                            <form action="AdminDeleteSparePartServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure?');">
                                <input type="hidden" name="spare_id" value="${part.spare_id}">
                                <button class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                        <td>
                            <form action="AdminSpareStockReportServlet" method="get" style="display:inline;">
                                <input type="hidden" name="spare_id" value="${part.spare_id}">
                                <button class="btn btn-primary">Create Report</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    // Live search filter for table
    document.getElementById("searchInput").addEventListener("input", function () {
        const filter = this.value.toUpperCase();
        const rows = document.querySelectorAll("#partsTable tbody tr");
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
