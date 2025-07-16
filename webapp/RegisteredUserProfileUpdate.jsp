<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>

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
        max-width: 600px;
        margin: auto;
        background-color: #1e295e;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
    }

    h2 {
        text-align: center;
        color: #ffcc00;
        margin-bottom: 25px;
    }

    label {
        font-weight: 600;
        display: block;
        margin-bottom: 5px;
        color: #ffffff;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #444;
        border-radius: 6px;
        background-color: #0c1333;
        color: #fff;
        font-size: 14px;
    }

    input:focus {
        outline: none;
        border-color: #ffcc00;
    }

    .btn {
        width: 100%;
        padding: 14px;
        background-color: #ffcc00;
        color: #0f1a3a;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        font-size: 15px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 20px; /* This moves it down */
    }

    .btn:hover {
        background-color: #e6b800;
    }

    #passwordSection {
        display: none;
    }

    .error-msg {
        color: #ff4d4d;
        font-size: 13px;
        margin-top: -10px;
        margin-bottom: 10px;
        display: none;
    }
    
    .btn:hover {
    background-color: #e6b800;
   }

    .btn-back:hover {
    background-color: #1a254b;
   }

</style>
    
</head>
<body>

<div class="container">
    <h2>Update Profile</h2>

    <form id="updateForm" action="RegisteredUserProfileUpdateServlet" method="post">
        <input type="hidden" name="id" value="<%= user.getId() %>">

        <label>Full Name:</label>
        <input type="text" name="name" value="<%= user.getName() %>" required>

        <label>Email:</label>
        <input type="email" name="email" value="<%= user.getEmail() %>" required>

        <label>Username:</label>
        <input type="text" name="username" value="<%= user.getUsername() %>" required>

        <label>Address:</label>
        <input type="text" name="address" value="<%= user.getAddress() %>" required>

        <label>Contact No:</label>
        <input type="text" name="contactNo" value="<%= user.getContactNo() %>" required>

        <!-- Password check section -->
        <div id="passwordSection">
            <label>Enter Your Password to Confirm Update:</label>
            <input type="password" id="confirmPassword" placeholder="Enter current password" required>
            <div class="error-msg" id="errorMsg">Password incorrect. Please try again.</div>
        </div>


        <input type="hidden" name="password" id="hiddenPassword">
        <button type="button" class="btn" id="nextBtn">Update</button>
        <button type="submit" class="btn" id="submitBtn" style="display:none;">Save Changes</button>
    </form>
    
    <form action="RegisteredUserProfile.jsp" method="get">
    <button type="submit" class="btn btn-back" style="margin-top: 10px;">Back to Profile</button>
   </form>
</div>

<script>
    // Show password input section on Update click
    document.getElementById("nextBtn").addEventListener("click", function () {
        document.getElementById("passwordSection").style.display = "block";
        document.getElementById("nextBtn").style.display = "none";
    });

    // When password is entered, check validity
    document.getElementById("confirmPassword").addEventListener("input", function () {
        const password = this.value;

        fetch("RegisteredUserUpdateProfilePagePasswordCheckServlet", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "password=" + encodeURIComponent(password)
        })
        .then(response => response.text())
        .then(data => {
            if (data === "valid") {
                document.getElementById("errorMsg").style.display = "none";

                // Enable Save button
                document.getElementById("submitBtn").style.display = "block";

                // Store correct password in hidden field
                document.getElementById("hiddenPassword").value = password;
            } else {
                document.getElementById("errorMsg").style.display = "block";
                document.getElementById("submitBtn").style.display = "none";
            }
        });
    });
</script>


    
</body>
</html>