<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("adminemail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Reset Password | AutoVio Admin</title>
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
        .reset-container {
            background: rgba(30,41,94,0.95);
            padding: 36px 32px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            width: 100%;
            max-width: 400px;
            box-sizing: border-box;
        }
        h2 {
            text-align: center;
            margin-bottom: 28px;
            color: #f9c802;
            font-weight: 600;
            font-size: 1.8rem;
            letter-spacing: 1px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #f9c802;
            font-size: 1rem;
        }
        input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            margin-bottom: 20px;
            border-radius: 8px;
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
        }
        button:hover {
            background: linear-gradient(90deg, #f9c802 60%, #3498db 100%);
            color: #0f1a3a;
            transform: translateY(-2px) scale(1.03);
        }
        .error-message {
            color: #ff6b6b;
            font-weight: 600;
            margin-bottom: 12px;
            font-size: 0.9rem;
            display: none;
        }
        @media (max-width: 450px) {
            .reset-container {
                padding: 28px 20px;
                max-width: 90vw;
            }
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
    <script>
        function validateResetForm() {
            const newPassword = document.forms["resetForm"]["newpassword"].value.trim();
            const confirmPassword = document.forms["resetForm"]["confirmpassword"].value.trim();
            const errorMsg = document.getElementById('error-message');

            if (newPassword === "" || confirmPassword === "") {
                errorMsg.style.display = 'block';
                errorMsg.textContent = "Please fill in all password fields.";
                return false;
            }
            if (newPassword !== confirmPassword) {
                errorMsg.style.display = 'block';
                errorMsg.textContent = "New Password and Confirm Password do not match.";
                return false;
            }
            errorMsg.style.display = 'none';
            return true;
        }
    </script>
</head>
<body>
    <div class="reset-container" role="main" aria-label="Reset Password Form">
        <h2>Reset Password</h2>
        <form name="resetForm" action="AdminProfileResetPasswordServlet" method="post" onsubmit="return validateResetForm();">
            <input type="hidden" name="adminemail" value="<%= email %>" />

            <label for="newpassword">New Password:</label>
            <input type="password" id="newpassword" name="newpassword" required autocomplete="new-password" />

            <label for="confirmpassword">Confirm Password:</label>
            <input type="password" id="confirmpassword" name="confirmpassword" required autocomplete="new-password" />

            <div id="error-message" class="error-message"></div>

            <button type="submit">Reset Password</button>
        </form>
    </div>
</body>
</html>
