<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8" />
    <title>Change Password | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
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
    <script>
        function validatePasswordForm() {
            const newPassword = document.getElementById('newpassword').value.trim();
            const confirmPassword = document.getElementById('confirmpassword').value.trim();
            const errorMsg = document.getElementById('error-message');

            if (newPassword !== confirmPassword) {
                errorMsg.style.display = 'block';
                errorMsg.textContent = "New Password and Confirm Password do not match.";
                return false; // Prevent form submission
            }
            errorMsg.style.display = 'none';
            return true;
        }
    </script>
</head>
<body>
    <div class="change-container">
        <h2><i class="fa-solid fa-key"></i> Change Password</h2>
        <form action="AdminProfileChangePasswordServlet" method="post" onsubmit="return validatePasswordForm();">
            <input type="hidden" name="adminid" value="<%= admin.getId() %>" />
            <input type="hidden" name="adminemail" value="<%= admin.getEmail() %>" />

            <label for="currentpassword">Current Password:</label>
            <input type="password" id="currentpassword" name="currentpassword" required autocomplete="current-password" />

            <label for="newpassword">New Password:</label>
            <input type="password" id="newpassword" name="newpassword" required autocomplete="new-password" />

            <label for="confirmpassword">Confirm New Password:</label>
            <input type="password" id="confirmpassword" name="confirmpassword" required autocomplete="new-password" />

            <div id="error-message" class="error-message"></div>

            <button type="submit"><i class="fa-solid fa-floppy-disk"></i> Update Password</button>
        </form>
    </div>

    <!-- Font Awesome CDN for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
