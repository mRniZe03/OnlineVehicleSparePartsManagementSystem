<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel, model.UserSparePartModel ,service.supplier.SparePartService" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    String spareId = request.getParameter("id");
    UserSparePartModel part = SparePartService.getSparePartById(spareId);

    if (part == null) {
        out.println("Spare part not found.");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spare Part View</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
    }

    .container {
        max-width: 1100px;
        margin: 40px auto;
        background-color: #1e295e;
        padding: 30px;
        border-radius: 12px;
        display: flex;
        box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    }

    .spare-info {
        flex: 1;
        padding-right: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .spare-info img {
        width: 100%;
        max-width: 420px;
        height: auto;
        padding: 20px;
        background: white;
        border-radius: 12px;
        object-fit: contain;
        border: 3px solid transparent;
        border-image: linear-gradient(45deg, #007cf0, #00dfd8, #ff0080, #7928ca);
        border-image-slice: 1;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease-in-out;
        cursor: zoom-in;
    }

    .spare-info img:hover {
        transform: scale(1.02);
        box-shadow: 0 0 25px rgba(255, 204, 0, 0.5);
    }

    .details-section {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .spare-details h2 {
        font-size: 28px;
        margin-bottom: 15px;
        color: #ffcc00;
    }

    .spare-details p {
        font-size: 16px;
        margin: 6px 0;
        color: #ddd;
    }

    form {
        margin-top: 20px;
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
        align-items: center;
    }

    input[type="number"] {
        padding: 10px;
        width: 100px;
        font-size: 15px;
        border: 1px solid #444;
        border-radius: 6px;
        background-color: #0c1333;
        color: white;
    }

    input[type="number"]:focus {
        outline: none;
        border-color: #ffcc00;
    }

    .description-section {
        margin-top: 25px;
        text-align: left;
    }

    .description-section h3 {
        font-size: 20px;
        margin-bottom: 10px;
        color: #ffcc00;
        border-bottom: 2px solid #ff4d4d;
        padding-bottom: 5px;
        display: inline-block;
    }

    .description-text {
        font-size: 15px;
        line-height: 1.8;
        color: #ccc;
        padding-left: 15px;
    }

    .description-text .bullet {
        color: #ff4d4d;
        font-weight: bold;
    }

    .add-cart-btn {
        background-color: #ff4d4d;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 15px;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .add-cart-btn:hover {
        background-color: #cc0000;
    }

    .back-btn {
        margin-top: 30px;
        display: inline-block;
        text-decoration: none;
        background-color: #2d3d75;
        color: white;
        padding: 10px 18px;
        border-radius: 6px;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    .back-btn:hover {
        background-color: #1a254b;
    }

    a {
        color: #ffcc00;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

    <script>
        function zoomImage(img) {
            const src = img.src;
            const overlay = document.createElement("div");
            overlay.style.position = "fixed";
            overlay.style.top = 0;
            overlay.style.left = 0;
            overlay.style.width = "100vw";
            overlay.style.height = "100vh";
            overlay.style.background = "rgba(0,0,0,0.85)";
            overlay.style.display = "flex";
            overlay.style.justifyContent = "center";
            overlay.style.alignItems = "center";
            overlay.style.zIndex = "1000";

            const enlarged = document.createElement("img");
            enlarged.src = src;
            enlarged.style.maxWidth = "80%";
            enlarged.style.maxHeight = "80%";
            enlarged.style.borderRadius = "10px";
            enlarged.style.boxShadow = "0 0 20px white";
            overlay.appendChild(enlarged);

            overlay.onclick = () => document.body.removeChild(overlay);
            document.body.appendChild(overlay);
        }

        function redirectToLogin() {
            window.location.href = "RegisteredUserLogin.jsp";
        }
    </script>
</head>
<body>

<div class="container">
    <!-- Left Image -->
    <div class="spare-info">
        <img src="data:image/jpeg;base64,<%= part.getPhotoBase64() %>" alt="Spare Part" onclick="zoomImage(this)">
    </div>

    <!-- Right Details -->
    <div class="details-section">
        <div class="spare-details">
            <h2><%= part.getName() %></h2>
            <p><strong>Category:</strong> <%= part.getCategory() %></p>
            <p><strong>Price:</strong> Rs. <%= part.getPrice() %></p>
            <p><strong>Status:</strong> <%= part.getQuantity() > 0 ? "Available" : "Out of Stock" %></p>

            <div class="description-section">
                <h3>Description</h3>
                <div class="description-text">
                    <%= part.getDescription().replaceAll("(?m)^\\d+\\.", "<br><span class='bullet'>$0</span>") %>
                </div>
            </div>
        </div>

        <% if (user != null) { %>
            <!-- Logged-in users see full Add to Cart form -->
            <form action="RegisteredUserAddCartServlet" method="post">
                <input type="hidden" name="spare_id" value="<%= part.getSpare_id() %>">
                <input type="number" name="quantity" min="1" max="<%= part.getQuantity() %>" required placeholder="Qty">
                <button type="submit" class="add-cart-btn">Add to Cart</button>
            </form>
        <% } else { %>
            <!-- Not logged in: Show fake form and redirect -->
            <div style="margin-top: 20px;">
                <input type="number" placeholder="Qty" disabled />
                <button onclick="redirectToLogin()" class="add-cart-btn">Add to Cart</button>
                <p style="margin-top: 10px;"><a href="RegisteredUserLogin.jsp">Login</a> to add this item to your cart.</p>
            </div>
        <% } %>

        <a href="UserShopServlet" class="back-btn">← Back to Shop</a>
    </div>
</div>

</body>
</html>
