<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
    }

   .navbar {
        background-color: #0d112d;
       display: flex;
       align-items: center;
       padding: 20px 40px;
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

    .form-container {
        width: 100%;
        max-width: 400px;
        margin: 60px auto;
        background-color: #1e295e;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        text-align: center;
    }

    h1 {
        margin-bottom: 25px;
        color: #ffcc00;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #444;
        border-radius: 6px;
        background-color: #0c1333;
        color: white;
        font-size: 14px;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: #ffcc00;
    }

    .forgot-link {
        text-align: right;
        margin: 10px 0;
        font-size: 14px;
    }

    .forgot-link a {
        color: #ffcc00;
        text-decoration: none;
    }

    .forgot-link a:hover {
        text-decoration: underline;
    }

    .login-btn {
        background-color: #ffcc00;
        color: #0f1a3a;
        border: none;
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border-radius: 6px;
        margin-top: 20px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .login-btn:hover {
        background-color: #e6b800;
    }

    .create-account {
        margin-top: 20px;
        font-size: 14px;
        color: #ccc;
    }

    .create-account a {
        display: inline-block;
        margin-top: 10px;
        padding: 10px 20px;
        border: 1px solid #ffcc00;
        color: #ffcc00;
        text-decoration: none;
        border-radius: 6px;
        transition: 0.3s;
    }

    .create-account a:hover {
        background-color: #ffcc00;
        color: #0f1a3a;
    }

    .role-links {
        font-size: 13px;
        margin-top: 20px;
        color: #bbb;
    }

    .role-links a {
        color: #ffcc00;
        text-decoration: none;
        margin: 0 5px;
    }

    .role-links a:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<div class="navbar">
<div class="logo">AutoVio</div>

    <div class="nav-center">
        <a href="UserHome.jsp">Home</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="ContactUs.jsp">Contact Us</a>
    </div>
</div>

<div class="form-container">
    <h1>Login</h1>
    <form action = "RegisteredUserLoginServlet" method="post">
    
         <input type="text" name="username" placeholder="User Name" required>
         <input type="password" name="password" placeholder="Password" required>

        <div class="forgot-link">
            <a href="UnregisteredUserForgotPassword.jsp">forgot password?</a>
        </div>
           
        <input type="submit" value="Login" class="login-btn">
                
    </form>

    <div class="create-account">
        Don't have an Account?<br>
        <a href="UnregisteredUserRegister.jsp">CREATE ACCOUNT</a>
    </div>
    
    <div class="role-links">
        <div><a href="AdminLogin.jsp">Are you Admin?</a></div>
        <div><a href="SupplierLogin.jsp">Are you Supplier?</a></div>
        <div><a href="deliveryPersonLogin.jsp">Are you Delivery Personnel?</a></div>
    </div>
    </div>
    
</body>
</html>