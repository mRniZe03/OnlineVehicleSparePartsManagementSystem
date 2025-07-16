<%@ page import="model.DeliveryPersonModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
DeliveryPersonModel delivery = (DeliveryPersonModel) session.getAttribute("delivery");
    if (delivery == null) {
        response.sendRedirect("deliveryPersonLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivery Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0f1a3a 0%, #1e295e 100%);;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color:white;
        }
        .profile-box {
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
            background: rgba(30,41,94,0.98);
            
        }
        h2 {
            text-align: center;
            color:white;
        }
        .info {
            margin: 15px 0;
        }
        .info label {
            font-weight: bold;
            color:#f9c802;
        }
        .info span {
            display: block;
            margin-top: 4px;
            color:#ffffff;
        }
        .button-group {
            text-align: center;
            margin-top: 25px;
        }
        .button-group a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 6px;
            margin: 5px  5px;
            display: inline-block;
        }
        .button-group a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<div class="profile-box">
    <h2>Delivery Person Profile</h2>

    <div class="info">
        <label>ID:</label>
        <span><%= delivery.getDeliverypersonid() %></span>
    </div>
    <div class="info">
        <label>Name:</label>
        <span><%= delivery.getDeliverypersonname() %></span>
    </div>
    <div class="info">
        <label>Email:</label>
        <span><%= delivery.getDeliverypersonemail() %></span>
    </div>
    <div class="info">
        <label>Username:</label>
        <span><%= delivery.getDeliverypersonusername() %></span>
    </div>

    <div class="button-group">
        <a href="dashboard.jsp">Back to Dashboard</a>
        
        <a href="deliveryPersonChangePassword.jsp">Change Password</a>
    </div>
</div>

</body>
</html>