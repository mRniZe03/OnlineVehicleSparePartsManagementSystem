<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String email = (String) session.getAttribute("resetEmail");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background-color: #0f1a3a;
        color: #f0f0f0;
        min-height: 100vh;
    }

    .navbar {
       background-color: #0d112d;
       display: flex;
       align-items: center;
       padding: 25px 50px;
       box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
       position: relative;
     }

    .navbar .logo {
       font-size: 22px;
       color: #ffcc00;
       font-weight: 600;
       flex: 0 0 auto;
     }

    .navbar .nav-center {
       position: absolute;
       left: 50%;
       transform: translateX(-50%);
       display: flex;
       gap: 40px;
     }

    .navbar .nav-center a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        font-weight: 500;
        transition: color 0.3s ease;
     }

     .navbar .nav-center a:hover {
          color: #ffcc00;
     }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 100px 0;
    }

    .form-box {
        background-color: #1e295e;
        padding: 50px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }

    .form-box h2 {
        color: #ffcc00;
        margin-bottom: 25px;
        font-size: 22px;
    }

    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 18px;
        border-radius: 6px;
        background-color: #0c1333;
        border: 1px solid #444;
        color: #fff;
        font-size: 14px;
    }

    input[type="password"]:focus {
        outline: none;
        border-color: #ffcc00;
    }

    .btn-group {
        display: flex;
        justify-content: space-between;
        gap: 10px;
    }

    input[type="submit"],
    input[type="button"] {
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background-color: #ffcc00;
        color: #0f1a3a;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
        background-color: #e6b800;
    }
</style>

<script>
        function validatePasswords() {
            var pw1 = document.forms["resetForm"]["newPassword"].value;
            var pw2 = document.forms["resetForm"]["confirmPassword"].value;
            if (pw1 !== pw2) {
                alert("Passwords do not match");
                return false;
            }
            return true;
        }
</script>
    
</head>
<body>

<!-- Navbar -->
<div class="navbar">
<div class="logo">eSpareMart</div>

    <div class="nav-center">
        <a href="UserHome.jsp">Home</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="ContactUs.jsp">Contact Us</a>
    </div>
</div>

<!-- Main Content -->
<div class="container">
    <div class="form-box">
        <h2>Forgot Password</h2>
        <form name="resetForm" action="UnregisteredUserResetPasswordServlet" method="post" onsubmit="return validatePasswords()">
              <input type="hidden" name="email" value="<%= email %>">
              <input type="password" name="newPassword" placeholder="New Password"><br>
              <input type="password" name="confirmPassword" placeholder="Confirm Password"><br>
        
             <div class="btn-group">
                 <input type="submit" value="Reset">
                 <input type="button" value="Back" onclick="window.location.href='UnregisteredUserForgotPassword.jsp'">
             </div>
        </form>
      </div>
</div>
    
</body>
</html>