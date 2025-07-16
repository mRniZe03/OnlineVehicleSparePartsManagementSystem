<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.AdminSparePartModel" %>
<%
    AdminSparePartModel sparePart = (AdminSparePartModel) request.getAttribute("sparePart");
    model.AdminModel admin = (model.AdminModel) session.getAttribute("admin");
    if (sparePart == null || admin == null) {
        response.sendRedirect("AdminSparePartGetAllServlet");
        return;
    }
    java.time.LocalDate today = java.time.LocalDate.now();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Spare Part Stock | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #0f1a3a;
            font-family: 'Poppins', sans-serif;
            color: #f0f0f0;
        }

        .form-container {
            width: 680px;
            margin: 50px auto;
            background-color: #1e295e;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.3);
        }

        h2 {
            color: #f9c802;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: 500;
            color: #f0f0f0;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-bottom: 16px;
            font-family: 'Poppins', sans-serif;
        }

        input[readonly] {
            background-color: #ccc;
            color: #333;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Stock Order / Removal</h2>
    <form action="AdminUpdateSparePartActionServlet" method="post">
        <input type="hidden" name="spare_id" value="<%= sparePart.getSpare_id() %>" />
        <input type="hidden" name="adminid" value="<%= admin.getId() %>" />
        <input type="hidden" name="orderdate" value="<%= today.toString() %>" />

        <label>Spare Part ID:</label>
        <input type="text" value="<%= sparePart.getSpare_id() %>" readonly />

        <label>Supplier ID:</label>
        <input type="text" name="supplierid" value="<%= sparePart.getSupplierid() %>" readonly />

        <label>Available Quantity:</label>
        <input type="text" name="quantity" value="<%= sparePart.getQuantity() %>" readonly />

        <label>Amount to Order / Remove:</label>
        <input type="number" name="amount" required min="1" />

        <label>Action Type:</label>
        <select name="status" required>
            <option value="">-- Select Action --</option>
            <option value="order">Order</option>
            <option value="remove">Remove</option>
        </select>

        <label>Reason:</label>
        <textarea name="reason" required></textarea>

        <button type="submit">Submit Stock Request</button>
    </form>
</div>
</body>
</html>