<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Delivery Staff Data Form</title>
<style>
        body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #0f1a3a;
        margin: 0;
        padding: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .form-container {
        background-color: #111742;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0,0,0,0.3);
        width: 500px;
        color: #fff;
    }

    h2 {
        text-align: center;
        color: #f9c802;
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #f0f0f0;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="date"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        background-color: #0f1a3a;
        border: 1px solid #ccc;
        border-radius: 6px;
        color: #fff;
        font-size: 14px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #f9c802;
        color: #0f1a3a;
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        width: 100%;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #e0b700;
    }
</style>
   
</head>
<body>


<div class="form-container">
    <h2>Delivery Staff Form</h2>
    <form action="insertServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Contact Number:</label>
        <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" maxlength="10" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="joining_date">Joining Date:</label>
        <input type="date" id="joining_date" name="joining_date" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>