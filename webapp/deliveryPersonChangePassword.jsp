<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="model.DeliveryPersonModel" %>
<%
DeliveryPersonModel deliver = (DeliveryPersonModel) session.getAttribute("deliver");
    if (deliver == null) {
        response.sendRedirect("deliveryPersonLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .change-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="change-container">
        <h2>Change Password</h2>
        <form action="deliveryPersonChangePasswordServlet" method="post">
            <input type="hidden" name="deliverid" value="<%= deliver.getDeliverypersonid() %>">
            <input type="hidden" name="deliveremail" value="<%= deliver.getDeliverypersonemail() %>">

            <label>Current Password:</label>
            <input type="password" name="currentpassword" required>

            <label>New Password:</label>
            <input type="password" name="newpassword" required>

            <label>Confirm New Password:</label>
            <input type="password" name="confirmpassword" required>

            <button type="submit">Update Password</button>
        </form>
    </div>
<body>

</body>
</html>