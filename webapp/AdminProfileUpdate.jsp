<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ page import="model.AdminModel" %>
<%
    AdminModel admin = (AdminModel) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    String updateMsg = (String) session.getAttribute("updateMsg");
    if (updateMsg != null) {
%>
<script>alert("<%= updateMsg.replace("\"", "\\\"") %>");</script>
<%
        session.removeAttribute("updateMsg");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Update Profile | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #0f1a3a 0%, #1e295e 100%);
            min-height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f0f0f0;
        }
        .update-container {
            background: rgba(30,41,94,0.98);
            padding: 40px 32px 32px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.27);
            width: 100%;
            max-width: 410px;
            box-sizing: border-box;
        }
        h2 {
            text-align: center;
            color: #f9c802;
            margin-bottom: 28px;
            letter-spacing: 1px;
            font-size: 1.8rem;
            font-weight: 600;
        }
        .form-group {
            position: relative;
            margin-bottom: 24px;
        }
        .form-group input {
            width: 100%;
            padding: 12px 14px 12px 40px;
            border-radius: 6px;
            border: 1.5px solid #2c3767;
            background: #18204a;
            color: #f0f0f0;
            font-size: 1.07rem;
            outline: none;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        .form-group input::placeholder {
            color: #aaa;
        }
        .form-group input:focus {
            border-color: #f9c802;
        }
        .form-group label {
            position: absolute;
            top: 50%;
            left: 40px;
            transform: translateY(-50%);
            font-size: 1rem;
            color: #aaa;
            pointer-events: none;
            transition: 0.2s ease all;
        }
        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -10px;
            left: 12px;
            font-size: 0.85rem;
            color: #f9c802;
            background: #1e295e;
            padding: 0 4px;
        }
        .form-group .fa-solid {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #3498db;
            font-size: 1.2rem;
            pointer-events: none;
        }
        .note {
            font-size: 0.95rem;
            color: #f9c802;
            margin-top: 2px;
            margin-bottom: 10px;
            display: inline-block;
        }
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 10px;
        }
        button[type="submit"], .back-link {
            width: 100%;
            padding: 12px;
            font-size: 1.08rem;
            font-weight: 600;
            border: none;
            border-radius: 7px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background 0.3s, color 0.3s, transform 0.16s;
            text-decoration: none;
        }
        button[type="submit"] {
            background: linear-gradient(90deg, #3498db 60%, #f9c802 100%);
            color: #1e295e;
        }
        button[type="submit"]:hover {
            background: linear-gradient(90deg, #f9c802 60%, #3498db 100%);
            color: #0f1a3a;
            transform: translateY(-1px) scale(1.03);
        }
        .back-link {
            background: #2c3767;
            color: #f0f0f0;
            text-align: center;
        }
        .back-link:hover {
            background: #3498db;
            color: #fff;
            transform: translateY(-1px) scale(1.03);
        }
        @media (max-width: 500px) {
            .update-container {
                padding: 22px 6vw 18px;
                max-width: 96vw;
            }
            h2 {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="update-container">
        <h2><i class="fa-solid fa-user-pen"></i> Update Profile</h2>
        <form action="AdminUpdateProfileServlet" method="post" autocomplete="off">
            <input type="hidden" name="adminid" value="<%= admin.getId() %>" />

            <div class="form-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" id="adminname" name="adminname" value="<%= admin.getName() %>" required placeholder=" " />
                <label for="adminname">Full Name</label>
            </div>

            <div class="form-group">
                <i class="fa-solid fa-envelope"></i>
                <input type="email" id="adminemail" name="adminemail" value="<%= admin.getEmail() %>" required placeholder=" " />
                <label for="adminemail">Email</label>
            </div>

            <div class="form-group">
                <i class="fa-solid fa-user-tag"></i>
                <input type="text" id="adminusername" name="adminusername" value="<%= admin.getUsername() %>" required placeholder=" " />
                <label for="adminusername">Username</label>
            </div>

            <div class="form-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" id="adminpassword" name="adminpassword" required placeholder=" " />
                <label for="adminpassword">Password <span class="note">(Confirm update)</span></label>
            </div>

            <div class="btn-group">
                <button type="submit"><i class="fa-solid fa-floppy-disk"></i> Save Changes</button>
                <a href="AdminProfile.jsp" class="back-link"><i class="fa-solid fa-arrow-left"></i> Back to Profile</a>
            </div>
        </form>
    </div>
</body>
</html>