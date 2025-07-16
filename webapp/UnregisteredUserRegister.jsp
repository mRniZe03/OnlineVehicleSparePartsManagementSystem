<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

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
    }

    .navbar {
        background-color: #0d112d;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 40px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        position: relative;
     }

    .logo {
        font-size: 22px;
        color: #ffcc00;
        font-weight: 600;
     }

     .nav-center {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        gap: 40px;
     }

     .nav-center a {
        color: white;
        text-decoration: none;
        font-size: 16px;
        font-weight: 500;
        transition: color 0.3s ease;
     }

      .nav-center a:hover {
         color: #ffcc00;
     }

      .auth a {
         background-color: #ffcc00;
         color: #0f1a3a;
         padding: 6px 14px;
         border-radius: 6px;
         font-weight: bold;
         text-decoration: none;
         transition: background-color 0.3s;
     }

      .auth a:hover {
         background-color: #e6b800;
         color: #000;
     }
     
    .form-container {
        background-color: #1e295e;
        width: 500px;
        margin: 50px auto;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #ffcc00;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
        vertical-align: top;
        color: #fff;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #444;
        border-radius: 6px;
        background-color: #0c1333;
        color: #f0f0f0;
        font-size: 14px;
    }

    input[type="text"]:focus,
    textarea:focus {
        outline: none;
        border-color: #ffcc00;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #ffcc00;
        color: #0f1a3a;
        font-weight: bold;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 15px;
    }

    input[type="submit"]:hover {
        background-color: #e6b800;
    }
</style>

</head>
<body>
<div class="navbar">
<div class="logo">eSpareMart</div>

    <div class="nav-center">
        <a href="UserHome.jsp">Home</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="ContactUs.jsp">Contact Us</a>
    </div>
    
    <div class="auth">
        <a href="RegisteredUserLogin.jsp">Login</a>
    </div>
</div>

<div class="form-container">
<h2>User Registration</h2>
    <form action = "UnregisteredUserRegisterServlet" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" required></td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="text" name="password" required></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><textarea name="address" required></textarea></td>
            </tr>
            <tr>
                <td>Contact No:</td>
                <td><input type="text" name="contactNo" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Register"></td>
            </tr>
        </table>
    </form>
    </div>
    
</body>
</html>