<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.SupplierSparePartModel" %>
<%
    SupplierSparePartModel part = (SupplierSparePartModel) request.getAttribute("part");
    if (part == null) {
        response.sendRedirect("AdminManageSparePartsServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Spare Part Stock Report | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0f1a3a;
            color: #f0f0f0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            background-color: #1e295e;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.25);
        }

        h2 {
            text-align: center;
            color: #f9c802;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 14px 12px;
            border-bottom: 1px solid #344180;
        }

        .label {
            font-weight: bold;
            width: 35%;
            background-color: #2a376f;
            color: #f9c802;
        }

        .value {
            background-color: #1a2550;
            color: #ffffff;
        }

        .back-btn {
            margin-top: 30px;
            text-align: center;
        }

        .back-btn a,
        .print-btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #3498db;
            color: white;
            border: none;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .back-btn a:hover,
        .print-btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Stock Report</h2>
    <table>
        <tr><td class="label">Spare ID</td><td class="value">${part.spare_id}</td></tr>
        <tr><td class="label">Name</td><td class="value">${part.name}</td></tr>
        <tr><td class="label">Category</td><td class="value">${part.category}</td></tr>
        <tr><td class="label">Unit Price</td><td class="value">Rs. ${part.price}</td></tr>
        <tr><td class="label">Quantity in Stock</td><td class="value">${part.quantity}</td></tr>
        <tr><td class="label">Description</td><td class="value">${part.description}</td></tr>
    </table>

    <div class="back-btn">
        <a href="AdminManageSparePartsServlet">&larr; Back</a>
        <button class="print-btn" onclick="window.print()">Print Report</button>
    </div>
</div>
</body>
</html>
