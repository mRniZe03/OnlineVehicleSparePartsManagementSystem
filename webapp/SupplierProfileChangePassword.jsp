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
 <title>Change Password</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #0f1a3a 0%, #1e295e 100%);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f0f0f0;
        }
        .change-container {
            background: rgba(30,41,94,0.95);
            padding: 30px 28px 28px;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }
        h2 {
            text-align: center;
            margin-bottom: 24px;
            color: #f9c802;
            font-weight: 600;
            font-size: 1.8rem;
            letter-spacing: 1px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-top: 18px;
            margin-bottom: 8px;
            color: #f9c802;
            font-size: 1rem;
        }
        input[type="password"] {
            width: 100%;
            padding: 12px 14px;
            border-radius: 6px;
            border: 1.5px solid #2c3767;
            background: #18204a;
            color: #f0f0f0;
            font-size: 1.1rem;
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input[type="password"]:focus {
            border-color: #f9c802;
        }
        button {
            margin-top: 28px;
            width: 100%;
            padding: 14px 0;
            background: linear-gradient(90deg, #3498db 60%, #f9c802 100%);
            color: #1e295e;
            font-weight: 700;
            font-size: 1.1rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease, color 0.3s ease, transform 0.16s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        button:hover {
            background: linear-gradient(90deg, #f9c802 60%, #3498db 100%);
            color: #0f1a3a;
            transform: translateY(-2px) scale(1.03);
        }
        .error-message {
            color: #ff6b6b;
            font-weight: 600;
            margin-top: 8px;
            font-size: 0.9rem;
            display: none;
        }
    </style>
</head>
<body>
    <div class="change-container">
        <h2>Change Password</h2>
        <form action="SupplierProfileChangePasswordServlet" method="post">
            <input type="hidden" name="supplierid" value="<%= supplier.getSupplierid() %>">
            <input type="hidden" name="supplieremail" value="<%= supplier.getSupplieremail() %>">

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