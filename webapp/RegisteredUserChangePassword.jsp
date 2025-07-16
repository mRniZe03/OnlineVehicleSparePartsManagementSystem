<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RegisteredUserLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
        padding: 40px 0;
    }

    .container {
        max-width: 450px;
        margin: auto;
        background-color: #1e295e;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    h2 {
        text-align: center;
        color: #ffcc00;
        margin-bottom: 25px;
    }

    label {
        font-weight: 600;
        display: block;
        margin-top: 10px;
        color: #ffffff;
    }

    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-top: 6px;
        border: 1px solid #444;
        border-radius: 6px;
        background-color: #0c1333;
        color: white;
        font-size: 14px;
    }

    input[type="password"]:focus {
        outline: none;
        border-color: #ffcc00;
    }

    button {
        background-color: #ffcc00;
        color: #0f1a3a;
        padding: 12px 18px;
        border: none;
        border-radius: 6px;
        margin-top: 25px;
        cursor: pointer;
        width: 100%;
        font-weight: bold;
        font-size: 15px;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #e6b800;
    }

    .error {
        color: #ff4d4d;
        font-size: 14px;
        margin-top: 5px;
    }
</style>

</head>
<body>


<div class="container">
    <h2>Change Password</h2>
    <form id="passwordForm" method="post" action="RegisteredUserChangePasswordServlet">
        <label for="currentPassword">Current Password:</label>
        <input type="password" id="currentPassword" name="currentPassword" required>
        <span id="currentError" class="error"></span>

        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" disabled required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" disabled required>
        <span id="confirmError" class="error"></span>

        <button type="submit">Update Password</button>
        
    </form>
    
    <form action="RegisteredUserProfile.jsp" method="get">
        <button type="submit" class="btn btn-back" style="margin-top: 10px;">Back to Profile</button>
     </form>
</div>

<script>
document.getElementById('currentPassword').addEventListener('blur', function () {
    const currentPassword = this.value;
    fetch('CheckUserCurrentPasswordServlet?password=' + encodeURIComponent(currentPassword))
        .then(response => response.text())
        .then(data => {
            if (data.trim() === "valid") {
                document.getElementById('currentError').textContent = "";
                document.getElementById('newPassword').disabled = false;
                document.getElementById('confirmPassword').disabled = false;
            } else {
                document.getElementById('currentError').textContent = "Password incorrect, try again";
                document.getElementById('newPassword').disabled = true;
                document.getElementById('confirmPassword').disabled = true;
                document.getElementById('newPassword').value = "";
                document.getElementById('confirmPassword').value = "";
            }
        });
});

document.getElementById('passwordForm').addEventListener('submit', function (e) {
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (newPassword !== confirmPassword) {
        document.getElementById('confirmError').textContent = "Passwords not match";
        e.preventDefault();
    } else {
        document.getElementById('confirmError').textContent = "";
    }
});
</script>

</body>
</html>