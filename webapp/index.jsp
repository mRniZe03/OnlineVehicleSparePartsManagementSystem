<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vehicle Spare Parts Management System</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
    }

  
    /* Main content area */
    .main-content {
        flex: 1;
        padding: 20px;
        overflow-y: auto;
        background-color: #f5f5f5;
        height: 100vh;
        box-sizing: border-box;
        overflow-y: auto; 
    }

    /* Home page specific styles */
    .home-content {
         flex: 1;
        display: flex;
        flex-direction: column;
        background-color: white;;
        
    }

    .hero {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        flex:1;
        text-align: center;
        padding: 0 20px;
        background-image: url('image/image.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #333;
        
    }

    h1 {
        font-size: 36px;
        margin-bottom: 20px;
        color: #2c3e50;
    }

    p {
        font-size: 18px;
        margin-bottom: 30px;
        color: #555;
    }

    .btn {
        display: inline-block;
        padding: 12px 30px;
        background-color: #3498db;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .btn:hover {
        background-color: #2980b9;
    }

    /* Navigation bar styles */
    .nav-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 20px;
        background-color: white;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        margin-bottom: 20px;
        border-radius: 5px;
    }

    .logo {
        font-size: 22px;
        font-weight: bold;
        color: #3498db;
    }

    .nav-links {
        display: flex;
        gap: 20px;
    }

    .nav-links a {
        text-decoration: none;
        color: #333;
        font-weight: 500;
    }

    .nav-links a:hover {
        color: #3498db;
    }
</style>
</head>
<body>
    <div>
        <!-- Main Content -->
        <div class="main-content" id="dynamic-content">
            <div class="home-content">
                <!-- Navigation Bar -->
                <div class="nav-bar">
                    <div class="logo">eSpareMart</div>
                    <div class="nav-links">
                        <a href="#">About</a>
                        <a href="#">Inventory</a>
                        <a href="#">Order Now</a>
                    </div>
                </div>
                
                <!-- Hero Section -->
                <section class="hero">
                    <div>
                        <h1>Find the Best Vehicle Spare Parts</h1>
                        <p>Browse our catalog and order high-quality spare parts for your vehicle.</p>
                        <a href="#" class="btn">Order Now</a>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const buttons = document.querySelectorAll(".sidebar-button");
            const content = document.querySelector(".loaded-content");

            function loadPage(page) {
                fetch(page)
                    .then(response => response.text())
                    .then(html => {
                        content.innerHTML = html;
                    })
                    .catch(() => {
                        content.innerHTML = "<p>Error loading page.</p>";
                    });
            }

            // Button clicks
            buttons.forEach(btn => {
                btn.addEventListener("click", () => {
                    buttons.forEach(b => b.classList.remove("active"));
                    btn.classList.add("active");
                    loadPage(btn.getAttribute("data-target"));
                });
            });
        });
    </script>
</body>
</html>