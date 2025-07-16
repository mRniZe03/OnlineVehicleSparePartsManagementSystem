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
    <title>Delivery Staff Table</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #0f1a3a;
            padding:0;
            margin:0;
        }

        h2 {
            text-align: center;
            color: #f9c802;
            margin-bottom: 20px;
        }

        .action-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .add-btn {
            background-color: #27ae60;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover {
            background-color: #1e8449;
        }

        #searchInput {
            display: block;
            margin: 0 auto 25px;
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

       table {
    width: 90%;
    margin: auto;
    border-collapse: collapse;
    background-color: #111742; 
    color: #ffffff; 
    font-family: 'Segoe UI', Tahoma, sans-serif;
    box-shadow: 0 0 10px rgba(0,0,0,0.3);
}

th, td {
    padding: 12px 15px;
    border: 1px solid #2c3e50;
    text-align: center;
}

th {
    background-color: #0f1a3a;
    color: #f9c802;
    text-transform: uppercase;
}

tr:nth-child(even) {
    background-color: #0f1a3a;
}

tr:hover {
    background-color: #1a2340;
    transition: 0.2s ease-in-out;
}

button {
    padding: 6px 12px;
    margin: 2px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 13px;
}

.update-btn {
    background-color: #3498db;
    color: white;
}

.delete-btn {
    background-color: #e74c3c;
    color: white;
}

        button {
            padding: 6px 12px;
            margin: 2px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
        }

        .update-btn {
            background-color: #3498db;
            color: white;
        }

        .delete-btn {
            background-color: #e74c3c;
            color: white;
        }

        form {
            display: inline;
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

<h2>Delivery Staff Table</h2>

<div class="action-header">
    <form action="insert.jsp" method="get">
        <button type="submit" class="add-btn">+ Add New Member</button>
    </form>
</div>

<input type="text" id="searchInput" placeholder="Search...">

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Joining Date</th>
        <th>Action</th>
    </tr>

    <c:forEach var="deliverystaff" items="${alldelivery}">
        <tr>
            <td>${deliverystaff.id}</td>
            <td>${deliverystaff.name}</td>
            <td>${deliverystaff.email}</td>
            <td>${deliverystaff.phone}</td>
            <td>${deliverystaff.address}</td>
            <td>${deliverystaff.joining_date}</td>
            <td>
                <a href="Updatedelivery.jsp?id=${deliverystaff.id}&name=${deliverystaff.name}&email=${deliverystaff.email}&phone=${deliverystaff.phone}&address=${deliverystaff.address}&joining_date=${deliverystaff.joining_date}">
                    <button type="button" class="update-btn">Update</button>
                </a>
                <form action="deletedeliveryServlet" method="post">
                    <input type="hidden" name="id" value="${deliverystaff.id}" />
                    <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this record?')">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
    function filterTable() {
        const input = document.getElementById("searchInput");
        const filter = input.value.toUpperCase();
        const table = document.querySelector("table");
        const tr = table.getElementsByTagName("tr");

        for (let i = 1; i < tr.length; i++) {
            const tds = tr[i].getElementsByTagName("td");
            let match = false;

            for (let j = 0; j < tds.length; j++) {
                if (tds[j]) {
                    const textValue = tds[j].textContent || tds[j].innerText;
                    if (textValue.toUpperCase().indexOf(filter) > -1) {
                        match = true;
                        break;
                    }
                }
            }

            tr[i].style.display = match ? "" : "none";
        }
    }

    document.getElementById("searchInput").addEventListener("input", filterTable);
</script>

</body>
</html>