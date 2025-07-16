<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("deliverypersonid");
    String name = request.getParameter("deliverypersonname");
    String email = request.getParameter("deliverypersonemail");
    String phone = request.getParameter("deliverypersonphone");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Delivery Person | AutoVio Admin</title>
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
        input[type="email"] {
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
            background-color: #3498db;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Edit Delivery Personnel</h2>
    <form action="AdminUpdateDeliverServlet" method="post">
        <input type="hidden" name="deliverypersonid" value="<%= id %>">

        <label for="deliverypersonname">Name:</label>
        <input type="text" id="deliverypersonname" name="deliverypersonname" value="<%= name %>" required>

        <label for="deliverypersonemail">Email:</label>
        <input type="email" id="deliverypersonemail" name="deliverypersonemail" value="<%= email %>" required>

        <label for="deliverypersonphone">Phone:</label>
        <input type="text" id="deliverypersonphone" name="deliverypersonphone" value="<%= phone %>" required>

        <button type="submit">Update Delivery Personnel</button>
    </form>
</div>
</body>
</html>
