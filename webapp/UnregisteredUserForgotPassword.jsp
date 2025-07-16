<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

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
        display: flex;
        flex-direction: column;
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
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px 20px;
    }

    .form-box {
        background-color: #1e295e;
        padding: 50px;
        border-radius: 16px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }

    h2 {
        color: #ffcc00;
        margin-bottom: 25px;
        font-size: 24px;
    }

    label {
        font-weight: 500;
        display: block;
        margin-bottom: 8px;
        text-align: left;
        color: #ffffff;
    }

    input[type="email"] {
        width: 100%;
        padding: 12px;
        border: 1px solid #444;
        border-radius: 6px;
        font-size: 14px;
        background-color: #0c1333;
        color: #f0f0f0;
        margin-bottom: 20px;
    }

    input[type="email"]:focus {
        outline: none;
        border-color: #ffcc00;
    }

    input[type="submit"],
    input[type="button"] {
        width: 48%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background-color: #ffcc00;
        color: #0f1a3a;
        font-weight: bold;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover,
    input[type="button"]:hover {
        background-color: #e6b800;
    }

    .btn-group {
        display: flex;
        justify-content: space-between;
        gap: 10px;
    }
</style>


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
        <form action="UnregisteredUserForgotPasswordServlet" method="post">
            <label for="email">Enter your registered email:</label>
            <input type="email" name="email" placeholder="Enter your email" required>

            <div class="btn-group">
                <input type="submit" value="Submit">
                <input type="button" value="Back" onclick="window.location.href='RegisteredUserLogin.jsp'">
            </div>
        </form>
    </div>
</div>
    
</body>
</html>