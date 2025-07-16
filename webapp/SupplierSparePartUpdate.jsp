<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ page import="model.SupplierModel" %>
<%@ page import="model.SupplierSparePartModel" %>
<%@ page import="service.supplier.SparePartService" %>
<%@ page import="java.util.List" %>
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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Spare Part</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        background-color:#0c113a;
        background-size: cover;
        color: #333;
    }
    
    .container {
        max-width: 500px;
        margin: 0 auto;
        background-color:#1e295e;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        margin-top:20px;
       
    }
    
    h2 {
        color:#f1c40f;
        margin-top: 0;
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
    }
    
    .form-group {
        margin-bottom: 20px;
    }
    
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #2c3e50;
    }
    
    input[type="text"],
    input[type="number"],
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        box-sizing: border-box;
    }
    
    input[type="text"]:focus,
    input[type="number"]:focus,
    textarea:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
    }
    
    .disabled {
        background-color: #f9f9f9;
        color: #777;
        cursor: not-allowed;
    }
    
    .optional-field {
        border-left: 4px solid #2ecc71;
        padding-left: 10px;
        margin-bottom: 25px;
    }
    
    .optional-field label {
        color: #2ecc71;
    }
    
    .optional-field small {
        color: #7f8c8d;
        font-size: 12px;
    }
    
    .required-field {
        border-left: 4px solid #e74c3c;
        padding-left: 10px;
    }
    
    .required-field label {
        color: #e74c3c;
    }
    
    .status-message {
        font-size: 13px;
        padding: 5px;
        border-radius: 3px;
        margin-top: 5px;
    }
    
    .low-stock {
        background-color: #fff3cd;
        color: #856404;
    }
    
    .out-of-stock {
        background-color: #f8d7da;
        color: #721c24;
    }
    
    .in-stock {
        background-color: #d4edda;
        color: #155724;
    }
    
    button[type="submit"] {
        background-color:#2ecc71;
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.3s;
    }
    
    button[type="submit"]:hover {
        background-color:#2E0854;
    }
    /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 20px;
            background-color: white;
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
            width: 40px;
            height: 40px;
            background-color: #3498db;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            margin-left: 15px;
            font-weight: bold;
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
            <div class="profile-icon">S</div>
        </div>
    </div>
    <div class="navbar">
    <div class="logo">Manage Spare Parts</div>
    <nav>
        <a href="SupplierDashboard.jsp">Dashboard</a>
        <a href="SupplierSparepartInsert.jsp">Add Spare Parts</a>
        <a href="SupplierSparePartGetAllServlet">Manage Spare Parts</a>
        <a href="SupplierOrderActionServlet">View Company Orders</a>
        <a href="SupplierNotificationHistoryServlet"">Order History</a>
    </nav>
</div>
 
    <div class="container">
        <h2>Update Spare Part</h2>
        <%
        String spare_id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String quantity = request.getParameter("quantity");
        String description = request.getParameter("description");
        
        List<SupplierSparePartModel> part = SparePartService.getById(spare_id);
        String photoBase64 = null;
        if (part != null && !part.isEmpty()) {
            byte[] spare_photo = part.get(0).getPhoto();
            if (spare_photo != null && spare_photo.length > 0) {
                photoBase64 = Base64.getEncoder().encodeToString(spare_photo);
            }
        }
     
        
        // Determine stock status
        int qty = 0;
        try {
            qty = Integer.parseInt(quantity);
        } catch (NumberFormatException e) {
            qty = 0;
        }
        
        boolean allowQuantityUpdate = qty <= 5;
        String stockStatus = "";
        String statusClass = "";
        
        if (qty == 0) {
            stockStatus = "Out of Stock";
            statusClass = "out-of-stock";
        } else if (qty <= 5) {
            stockStatus = "Low Stock (" + qty + " remaining)";
            statusClass = "low-stock";
        } else {
            stockStatus = "In Stock (" + qty + " available)";
            statusClass = "in-stock";
        }
        %>
        
        <form action="SupplierSparePartUpdateServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="originalQuantity" value="<%=quantity%>">
            
            <div class="form-group required-field">
                <label for="id">Part ID</label>
                <input type="text" id="spare_id" name="spare_id" value="<%=spare_id%>" readonly>
            </div>
            
            <div class="form-group optional-field">
                <label for="name">Part Name</label>
                <input type="text" id="name" name="name" value="<%=name%>">
                
            </div>
            
            <div class="form-group optional-field">
                <label for="price">Price (RS)</label>
                <input type="number" id="price" name="price" value="<%=price%>" min="0" step="0.01">
                
            </div>
            
            <div class="form-group optional-field">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" value="<%=category%>">
               
            </div>
            
            <div class="form-group required-field">
                <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" value="<%=quantity%>" 
                       min="0" <%= allowQuantityUpdate ? "" : "readonly class='disabled'" %> required>
                       
                <div class="status-message <%=statusClass%>"><%=stockStatus%></div>
                
                <% if (!allowQuantityUpdate) { %>
                    <small>Quantity can only be updated when stock is ≤5</small>
                <% } %>
                
            </div>
            
             <div class="form-group optional-field">
                <label for="description">Description</label>
                <textarea id="description" name="description" rows="4"><%=description%></textarea>
            </div>
            
            <div class="form-group optional-field">
                <label for="spare_photo">Upload Photo</label>
                <input type="file" id="spare_photo" name="spare_photo"class="file-input">
                
                <% if (photoBase64 != null) { %>
                    <p>Current Photo: 
                    <img src="data:image/jpeg;base64,<%=photoBase64 %>" width="50" height="50" /></p>
                <% } %>
                
             </div>
          
            <button type="submit">Update Spare Part</button>
           
        </form>
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            const originalQuantity = document.querySelector('input[name="originalQuantity"]').value;
            const currentQuantity = document.querySelector('input[name="quantity"]').value;
            
            // Check if any field has been changed
            const nameChanged = document.querySelector('input[name="name"]').value !== '<%=name%>';
            const priceChanged = document.querySelector('input[name="price"]').value !== '<%=price%>';
            const categoryChanged = document.querySelector('input[name="category"]').value !== '<%=category%>';
            const descChanged = document.querySelector('textarea[name="description"]').value !== '<%=description%>';
            const qtyChanged = originalQuantity !== currentQuantity;
            const photoChanged = document.querySelector('input[name="spare_photo"]').files.length > 0;
            
            if (!nameChanged && !priceChanged && !categoryChanged && !descChanged && !qtyChanged) {
                alert('Please update at least one field before submitting.');
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
