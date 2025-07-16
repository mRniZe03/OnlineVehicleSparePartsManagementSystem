<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | AutoVio</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0f1a3a;
            color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #0d112d;
            padding: 15px;
            text-align: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: 500;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background-color: #1a2550;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
        }

        h2 {
            text-align: center;
            color: #f9c802;
            margin-bottom: 25px;
        }

        .info-section {
            margin-bottom: 30px;
        }

        .info-section h3 {
            color: #f9c802;
            margin-bottom: 10px;
        }

        .info-section p {
            margin: 5px 0;
        }

        .contact-methods {
            background-color: #0d112d;
            padding: 20px;
            border-radius: 10px;
        }

        .contact-methods h4 {
            color: #f9c802;
            margin-bottom: 10px;
        }

        .contact-methods ul {
            list-style-type: none;
            padding-left: 0;
        }

        .contact-methods li {
            margin: 8px 0;
        }

        
    </style>
</head>
<body>

    <div class="navbar">
        <a href="UserHome.jsp">Home</a>
        <a href="UserShopServlet">Shop</a>
        <a href="AboutUs.jsp">About Us</a>
        
    </div>

    <div class="container">
        <h2>Contact Us</h2>

        <div class="info-section">
            <h3>Contact Information</h3>
            <p><strong>Phone:</strong> +94 77 123 4567</p>
            <p><strong>Email:</strong> support@eSpareMart.com</p>
            <p><strong>Fax:</strong> +94 11 234 5678</p>
        </div>

        <div class="contact-methods">
            <h4>Other Contact Methods</h4>
            <ul>
                <li>📧 Email Support (24/7)</li>
                <li>📞 Call Center: Mon - Fri (8 AM - 6 PM)</li>
                <li>💬 Live Chat: Available on homepage (9 AM - 9 PM)</li>
                
            </ul>
        </div>
    </div>

    
</body>
</html>
