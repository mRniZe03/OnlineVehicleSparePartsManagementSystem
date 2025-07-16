<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CompanyOrderReportModel" %>
<%
    CompanyOrderReportModel report = (CompanyOrderReportModel) request.getAttribute("report");
    if (report == null) {
        response.sendRedirect("AdminCompanyOrdersServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company Order Report | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #0f1a3a;
            color: #f0f0f0;
        }

        .container {
            max-width: 700px;
            margin: 60px auto;
            background-color: #1e295e;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 0 14px rgba(0, 0, 0, 0.3);
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
            padding: 14px 16px;
            vertical-align: top;
        }

        .label {
            font-weight: bold;
            width: 40%;
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
            margin: 0 6px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border: none;
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
    <h2>Company Order Report</h2>
    <table>
        <tr><td class="label">Request ID</td><td class="value"><%= report.getrequest_id() %></td></tr>
        <tr><td class="label">Spare Part</td><td class="value"><%= report.getspare_name() %> (<%= report.getspare_id() %>)</td></tr>
        <tr><td class="label">Category</td><td class="value"><%= report.getcategory() %></td></tr>
        <tr><td class="label">Amount Requested</td><td class="value"><%= report.getamount() %></td></tr>
        <tr><td class="label">Order Date</td><td class="value"><%= report.getorderdate() %></td></tr>
        <tr><td class="label">Reason</td><td class="value"><%= report.getreason() %></td></tr>
        <tr><td class="label">Order Status</td><td class="value"><%= report.getstatus() %></td></tr>
        <tr><td class="label">Action Status</td><td class="value"><%= report.getstatus() == null ? "Pending" : report.getstatus() %></td></tr>
        <tr><td class="label">Supplier</td><td class="value"><%= report.getsuppliername() %> (ID: <%= report.getsupplierid() %>)</td></tr>
        <tr><td class="label">Supplier Email</td><td class="value"><%= report.getsupplieremail() %></td></tr>
    </table>

    <div class="back-btn">
        <a href="AdminCompanyOrdersServlet">&larr; Back to Company Orders</a>
        <button class="print-btn" onclick="window.print()">Print Report</button>
    </div>
</div>
</body>
</html>
