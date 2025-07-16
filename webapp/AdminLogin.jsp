<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Login | AutoVio Admin</title>
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
        .login-container {
            background: rgba(30,41,94,0.95);
            padding: 36px 32px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            width: 100%;
            max-width: 360px;
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
        input[type="text"],
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
        input[type="text"]:focus,
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
        .forgot-link {
            margin-top: 18px;
            text-align: center;
        }
        .forgot-link a {
            color: #f9c802;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }
        .forgot-link a:hover {
            color: #3498db;
            text-decoration: underline;
        }
        @media (max-width: 400px) {
            .login-container {
                padding: 28px 20px;
                max-width: 90vw;
            }
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
    <script>
        function validateForm() {
            const u = document.forms["loginForm"]["adminusername"].value.trim();
            const p = document.forms["loginForm"]["adminpassword"].value.trim();
            if (u === "" || p === "") {
                alert("Please fill in both username and password.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="login-container" role="main" aria-label="Admin Login Form">
        <h2>Admin Login</h2>
        <form name="loginForm" action="AdminLoginServlet" method="post" onsubmit="return validateForm();" novalidate>
            <label for="adminusername">Username:</label>
            <input type="text" id="adminusername" name="adminusername" required autocomplete="username" />

            <label for="adminpassword">Password:</label>
            <input type="password" id="adminpassword" name="adminpassword" required autocomplete="current-password" />

            <button type="submit">Login</button>
        </form>

        <div class="forgot-link">
            <a href="AdminProfileForgotPassword.jsp">Forgot Password?</a>
        </div>
    </div>
</body>
</html>