<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Spare Part Form</title>
<style>
       * {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
    box-sizing: border-box;
}

body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    background-color: #0c113a;
    background-size: cover;
}

.dashboard-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 1px solid #eee;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

.dashboard-title h1 {
    color: #f1c40f;
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

.form-container-wrapper {
    display: flex;
    justify-content: center;
    align-content: center;
    padding: 20px;
    width: 100%;
}

.form-container {
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    width: 90%;
    max-width: 600px;
    background-color: #1e295e;
    color: white;
}

.form-container h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #f1c40f;
    font-size: 22px;
    font-weight: bold;
}

.form-group {
    margin-bottom: 15px;
    width: 100%;
}

label {
    display: block;
    margin-bottom: 6px;
    font-weight: bold;
    color:white;
    margin-top:3px;
}

input[type="text"],
input[type="number"],
input[type="email"],
input[type="password"],
select,
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 14px;
    background-color: #fff;
    color: #000;
}

textarea {
    resize: vertical;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
input[type="number"] {
    -moz-appearance: textfield;
}

button {
    width: 100%;
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

button:hover {
    background-color: #27ae60;
}

@media (max-width: 768px) {
    .form-container {
        padding: 30px;
        width: 100%;
    }

    button {
        font-size: 15px;
    }
}

.custom-file-upload {
    display: inline-block;
    padding: 10px 20px;
    background-color: #2ecc71;
    color: white;
    font-size: 14px;
    border-radius: 12px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center;
    width: fit-content;
    font-weight: bold;
}

.custom-file-upload:hover {
    background-color: #27ae60;
}

.custom-file-upload input[type="file"] {
    display: none;
}

.top-bar {
    background-color: #0c113a;
    color: white;
    padding: 10px 40px;
    font-size: 14px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar {
    background-color: #1e295e;
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
    transition: color 0.3s ease;
}

nav a:hover {
    color: #f1c40f;
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


<!-- Navbar -->
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

<!-- Main Content Area -->


<div class="form-container-wrapper">
<!-- Form Area (outside main-content) -->
<div class="form-container">
    <form action="SupplierSparePartInsertServlet" method="post" enctype="multipart/form-data">
        <h2>Add Spare Parts</h2>
    
        <div class="form-group">
            <label for="name">Spare Part Name</label>
            <input type="text" id="name" name="name" required autocomplete="off">
        </div>
        
        <div class="form-group">
            <label for="price">Price</label>
            <input type="number" id="price" name="price" step="0.01" required autocomplete="off">
        </div>
        
        <div class="category-group">
            <label for="category">Select Category:</label>
            <select name="category" id="category" required>
                <option value="">-- Select Category --</option>
                <option value="Engine Components">Engine Components</option>
                <option value="Braking System">Braking System</option>
                <option value="Suspension & Steering">Suspension & Steering</option>
                <option value="Electrical & Electronics">Electrical & Electronics</option>
                <option value="Body Parts">Body Parts</option>
                <option value="Tyres & Wheels">Tyres & Wheels</option>
            </select>
        </div>
        
        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" required autocomplete="off">
        </div>
        
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" placeholder="Provide a brief description of the spare part" required></textarea>
        </div>

       <div class="form-group">
            <label for="photo">Upload Photo</label>
            <label class="custom-file-upload">
        <input type="file" id="spare_photo" name="spare_photo" accept="image/*" required>
        Choose File
        </label>
       </div>
       
        
        <div class="form-group">
            <label for="supplierid">Supplier ID</label>
             <input type="hidden" id="supplierid" name="supplierid" value="<%= supplier.getSupplierid() %>">
        </div>
        
        <button type="submit">Submit</button>
    </form>
</div>
</div>
</div>

</body>
</html>



