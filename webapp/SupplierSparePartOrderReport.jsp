<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.SupplierSparePartReportModel" %>
<%
    SupplierSparePartReportModel report = (SupplierSparePartReportModel) request.getAttribute("report");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spare Part Report</title>
    <style>
        body {
            font-family: Arial,sans-serif;
            padding: 20px;
            background-color:#0c113a;
        }
        h2 {
            color:#f1c40f;
            text-align: center;
        }
        table {
            width: 70%;
            margin: 0 auto;
            border-collapse: collapse;
            background:#1e295e;
            color:white;
            font-weight:bold;
            border-radius:12px;
        }
        td, th {
            padding: 12px;
            text-align: left;
        }
        th{
          color:#f1c40f;
          
        }
        .button-container {
            text-align: center;
            margin-top: 30px;
        }
        .print-btn,.back-btn{
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background-color:#2471a3;
            color: white;
            cursor: pointer;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        .back-btn {
            background-color:#2ecc71;
            
        }
        .print-btn:hover, .back-btn:hover {
            background-color: #1e295e;
        }
     
    </style>
</head>
<body>

<h2>Supplier Spare Part Report</h2>

<% if (report != null) { %>
    <table>
        <tr><th>Notification ID</th><td><%= report.getNotification_id() %></td></tr>
        <tr><th>Request ID</th><td><%= report.getRequest_id() %></td></tr>
        <tr><th>Spare ID</th><td><%= report.getSpare_id() %></td></tr>
        <tr><th>Admin ID</th><td><%= report.getAdminid() %></td></tr>
        <tr><th>Amount Ordered</th><td><%= report.getAmount() %></td></tr>
        <tr><th>Order Date</th><td><%= report.getOrderdate() %></td></tr>
        <tr><th>Category</th><td><%= report.getCategory() %></td></tr>
        <tr><th>Spare Part Name</th><td><%= report.getName() %></td></tr>
        <tr><th>Previous Quantity</th><td><%= report.getPreviousQuantity() %></td></tr>
    </table>
<% } else { %>
    <p style="text-align: center; color: red;">Report details not found.</p>
<% } %>

<div class="button-container">
    <button class="print-btn" onclick="window.print()">Print Report</button>
    <button class="back-btn" onclick="window.history.back()">Back to Orders</button>
</div>

</body>
</html>

