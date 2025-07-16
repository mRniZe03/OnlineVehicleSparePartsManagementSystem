<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.SupplierSparePartModel" %>
<%@ page import="model.SupplierModel" %>
<%@ page import="java.util.List" %>
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
    List<SupplierSparePartModel> spareParts = (List<SupplierSparePartModel>) request.getAttribute("allspareparts");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Spare Parts</title>
<style>
* {
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        box-sizing: border-box;
}
body {
    background-color: #0c113a;
    background-size: cover;
}
.dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 1px solid #eee;
 }
.dashboard-title h1 {
        color: #2c3e50;
        font-size: 20px;
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
.top-controls {
        margin-bottom: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        
}
h2{
         margin-top:50px;
         text-align:center;
         color:#f1c40f;
         font-weight:bold;
         
}



/* Table Styles */
table {
    width:96%;
    border-collapse: collapse;
    margin-bottom: 70px;
    font-size: 14px;
    background-color: #1a2550;
    color: white;
    border-radius: 10px;
    overflow: hidden;
    margin-left:25px;
    
    
}

th {
    background-color:#1e2b57;
    color: #f1c40f;
    text-align: left;
    padding: 20px;
    font-weight: bold;
 
    
}

td {
    padding: 10px;
    border-bottom: 1px solid #2e3b60;
}

/* Search input styling */
#searchInput {
    padding: 10px 15px;
    border-radius: 8px;
    border: none;
    width: 300px;
    margin: 25px;
    font-size: 14px;
}

/* Action Buttons */
.btn {
    padding: 6px 12px;
    font-size: 13px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.3s ease;
    color: white;
}

/* Update Button - Blue */
.btn-primary {
    background-color: #2471a3;
}
.btn-primary:hover {
    background-color: #1a5b87;
}

/* Delete Button - Red */
.btn-danger {
    background-color: #c0392b;
}
.btn-danger:hover {
    background-color: #962d22;
}

/* Image cell */
.part-image {
    width: 60px;
    height: 60px;
    border-radius: 6px;
    object-fit: cover;
}

/* Low stock row */
.low-stock {
    background-color:#ffa3a3 !important;
}

/* No results */
.no-results {
    text-align: center;
    padding: 20px;
    font-size: 14px;
    color: #ccc;
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
        <a href="SupplierNotificationHistoryServlet"">Order History</a>
    </nav>
</div>
<h2>Spare Part Stock</h2>

<input type="text" id="searchInput" placeholder="Search spare parts...">
    <div class="table-container">
    
    <table id="partsTable">    
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Photo</th>
                <th>Action</th>
                
            </tr>

<c:if test="${empty allspareparts}">
        <tr><td colspan="8" class="no-results">No spare parts found.</td></tr>
</c:if>
        
            <c:forEach var="part" items="${allspareparts}">
           
               <tr class="${(part.quantity <= 5) ? 'low-stock' : ''}">
                    <td>${part.spare_id}</td>
                    <td>${part.name}</td>
                    <td>${part.price}</td>
                    <td>${part.category}</td>
                    <td>${part.quantity}</td>
                    <td>${part.description}</td>
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
                    <form action="SupplierSparePartUpdate.jsp" method="get" style="display: inline;">
                          <input type="hidden" name="id" value="${part.spare_id}">
                          <input type="hidden" name="name" value="${part.name}">
                          <input type="hidden" name="price" value="${part.price}">
                          <input type="hidden" name="category" value="${part.category}">
                          <input type="hidden" name="quantity" value="${part.quantity}">
                          <input type="hidden" name="description" value="${part.description}">
                          <button type="submit" class="btn btn-primary btn-sm">
                              <i class="fas fa-edit"></i> Update
                          </button>
                    </form>
                       
                        <form action="SupplierSparePartDeleteServlet" method="post" style="display:inline;">
                            <input type="hidden" name="spare_id" value="${part.spare_id}" />
                            <button type="submit"class="btn btn-danger btn-sm">Delete</button>
                         </form>
                     </td>
                    
                   </tr>     
        </c:forEach>
    </table>
   </div> 

<script>
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
  <footer>
    Supplier Portal v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved. |
    <a href="#">Privacy</a> | <a href="#">Terms</a>
</footer>
</body>
</html>


