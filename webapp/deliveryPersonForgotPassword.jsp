<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Forgot Password </title>
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
        .forgot-container {
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
        input[type="email"] {
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
        input[type="email"]:focus {
            border-color: #f9c802;
        }
        button {
            width: 100%;
            padding: 14px 0;
            background: #3498db;
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
        @media (max-width: 400px) {
            .forgot-container {
                padding: 28px 20px;
                max-width: 90vw;
            }
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="forgot-container" role="main" aria-label="Forgot Password Form">
        <h2>Forgot Password</h2>
        <form action="deliveryPersonForgotPasswordServlet" method="post" novalidate>
            <label for="adminemail">Enter Your Email:</label>
            <input type="email" id="adminemail" name="adminemail" required autocomplete="email" />
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>