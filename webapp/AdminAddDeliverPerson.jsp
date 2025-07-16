<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.AdminModel" %>
<%
    AdminModel admin = (AdminModel) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Delivery Person | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #0f1a3a;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #f0f0f0;
        }

        .form-container {
            background-color: #1e295e;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            width: 420px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #f9c802;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
            color: #f0f0f0;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
            font-family: 'Poppins', sans-serif;
        }

        button {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #2ecc71;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Delivery Person</h2>
    <form action="AddDeliverPersonServlet" method="post">
        <label for="deliverypersonname">Full Name:</label>
        <input type="text" id="deliverypersonname" name="deliverypersonname" required>

        <label for="deliverypersonemail">Email:</label>
        <input type="email" id="deliverypersonemail" name="deliverypersonemail" required>

        <label for="deliverypersonusername">Username:</label>
        <input type="text" id="deliverypersonusername" name="deliverypersonusername" required>

        <label for="deliverypersonphone">Phone:</label>
        <input type="text" id="deliverypersonphone" name="deliverypersonphone" required>

        <label for="deliverypersonpassword">Password:</label>
        <input type="password" id="deliverypersonpassword" name="deliverypersonpassword" required>

        <button type="submit">Add Delivery Person</button>
    </form>
</div>
</body>
</html>