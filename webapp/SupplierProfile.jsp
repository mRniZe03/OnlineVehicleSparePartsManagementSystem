<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.SupplierModel" %>
<%
    SupplierModel supplier = (SupplierModel) session.getAttribute("supplier");
    if (supplier == null) {
        response.sendRedirect("SupplierLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Supplier Profile</title>
    <style>
       body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f1a3a 0%, #1e295e 100%);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f0f0f0;
        }
        .profile-card {
            background: rgba(30,41,94,0.98);
            padding: 40px 20px 20px;
            border-radius: 14px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            width: 100%;
            max-width: 360px;
            position: relative;
        }
        .avatar {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            background: linear-gradient(135deg, #f9c802 60%, #3498db 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            color: #1e295e;
            font-weight: 700;
            position: absolute;
            top: -32px;
            left: 50%;
            transform: translateX(-50%);
            border: 3px solid #fff3;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            color: #f9c802;
            margin-top: 20px;
            margin-bottom:60px;
            font-size: 1.5rem;
        }
        .profile-info {
            margin: 16px 0;
        }
        .profile-info label {
            font-weight: 600;
            color: #f9c802;
            font-size: 0.95rem;
        }
        .profile-info span {
            display: block;
            margin-top: 4px;
            color: #ffffff;
            font-size: 1.05rem;
        }
        .button-group {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 20px;
        }
        .button-group a {
            background: linear-gradient(90deg, #3498db 60%, #f9c802 100%);
            color: #1e295e;
            text-decoration: none;
            padding: 8px 14px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: background 0.3s, color 0.3s, transform 0.2s;
        }
        .button-group a:hover {
            background: linear-gradient(90deg, #f9c802 60%, #3498db 100%);
            color: #0f1a3a;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <h2>Supplier Profile</h2>

        <div class="profile-info">
            <label>Supplier ID:</label>
            <span><%= supplier.getSupplierid() %></span>
        </div>

        <div class="profile-info">
            <label>Name:</label>
            <span><%= supplier.getSuppliername() %></span>
        </div>

        <div class="profile-info">
            <label>Email:</label>
            <span><%= supplier.getSupplieremail() %></span>
        </div>

        <div class="profile-info">
            <label>Username:</label>
            <span><%= supplier.getSupplierusername() %></span>
        </div>

        <div class="button-group">
            <a href="SupplierProfileChangePassword.jsp">Change Password</a>
            <a href="SupplierDashboardServlet">Back to Dashboard</a>
            <a href="SupplierAccountDeleteServlet">Delete Account</a>
        </div>
    </div>

</body>
</html>