<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel, model.AddCartModel, java.util.*, java.math.BigDecimal" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RegisteredUserLogin.jsp");
        return;
    }

    List<AddCartModel> cartItems = (List<AddCartModel>) request.getAttribute("cartItems");
    BigDecimal subtotal = (BigDecimal) request.getAttribute("subtotal");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a;
        color: #f0f0f0;
    }

    .top-bar {
        background-color: #0b0f3d;
        color: white;
        padding: 10px 40px;
        font-size: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: 'Poppins', sans-serif;
     }

      .top-bar i {
        margin-right: 8px;
     }

      .right-icons {
         display: flex;
         align-items: center;
         gap: 10px;
         font-size: 15px;
    }

      .navbar {
         background-color: #0d112d;
         display: flex;
         align-items: center;
         justify-content: space-between;
         padding: 18px 40px;
         box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
         font-family: 'Poppins', sans-serif;
   }

      .navbar .logo {
        font-size: 22px;
        color: #ffcc00;
        font-weight: 600;
   }

      .navbar > div:nth-child(2) {
         flex: 1;
         display: flex;
         justify-content: center;
         gap: 30px;
   }

      .navbar a {
         color: white;
         text-decoration: none;
         font-weight: 500;
         font-size: 15px;
         transition: color 0.3s ease;
   }

   .navbar a:hover {
        color: #f9c802;
   }

    .menu {
        display: flex;
        align-items: center;
        gap: 14px;
   }

    .menu a {
        background-color: #f9c802;
        color: #0f1a3a;
        padding: 6px 14px;
        border-radius: 6px;
        font-weight: bold;
        text-decoration: none;
        transition: background-color 0.3s ease;
   }

    .menu a:hover {
        background-color: #e6b800;
        color: #000;
    }
    
    .cart-container {
        padding: 40px;
        display: flex;
        gap: 20px;
        max-width: 1200px;
        margin: auto;
    }

    table {
        width: 70%;
        background-color: #1e295e;
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    th, td {
        padding: 14px;
        text-align: center;
        border-bottom: 1px solid #333;
        color: #ffffff;
    }

    th {
        background-color: #222c5e;
        color: #ffcc00;
        font-weight: 600;
    }

    .summary {
        width: 30%;
        padding: 30px;
        background-color: #1e295e;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    .summary h3 {
        margin-top: 0;
        color: #ffcc00;
    }

    .summary p {
        font-size: 15px;
        margin: 10px 0;
    }

    .btn {
        padding: 10px 18px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
        font-family: inherit;
    }

    .btn-remove {
        background-color: #cc0000;
        color: white;
    }

    .btn-remove:hover {
        background-color: #990000;
    }

    .btn-checkout {
        background-color: #ffcc00;
        color: #0f1a3a;
        width: 100%;
        margin-top: 20px;
        font-size: 16px;
    }

    .btn-checkout:hover {
        background-color: #e6b800;
    }

    .shipping-method {
        margin-top: 15px;
        color: #cccccc;
    }

    .qty-form input[type=number] {
        width: 60px;
        padding: 6px;
        border-radius: 5px;
        background-color: #0c1333;
        border: 1px solid #444;
        color: #fff;
    }

    .qty-form input[type=number]:focus {
        outline: none;
        border-color: #ffcc00;
    }

    input[type="radio"] {
        margin-right: 6px;
    }
    
   .footer {
    background-color: #111742;
    color: #cccccc;
    text-align: center;
    padding: 15px;
    font-size: 14px;
    border-top: 1px solid #222;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
}

</style>
    
    <script>
        function updateTotal(flatRate) {
            const subtotal = parseFloat(document.getElementById("subtotal").value);
            const flatRateCharge = flatRate ? 300 : 0;
            document.getElementById("flatRateDisplay").textContent = "LKR " + flatRateCharge.toFixed(2);
            document.getElementById("totalDisplay").textContent = "LKR " + (subtotal + flatRateCharge).toFixed(2);
        }
    </script>
    
    
</head>
<body>

<!-- Top Bar -->
    <div class="top-bar">
        <div>🚚</div>
        <div class="right-icons">
            <i>❤</i>
            <i>🛒</i>
            <span>£0.00</span>
        </div>
    </div>
    
<!-- Navbar -->
<div class="navbar">
<div class="logo">eSpareMart</div>

         <div>
            <a href="UserHome.jsp">Home</a>
            <a href="UserShopServlet">Shop</a>
            <a href="ContactUs.jsp">Contact Us</a>
            <a href="AboutUs.jsp">About Us</a>
            <a href="RegisteredUserProfileServlet">My Profile</a>
            <a href="RegisteredUserShoppingCartServlet">My Cart</a>
            <a href="RegisteredUserOrders.jsp">My Orders</a>
            <a href="UserFeedbackForm.jsp">Submit Feedback</a>
            <a href="UserPublicFeedback.jsp">View All Feedback</a>
               
         </div> 
    <div class="menu">
        
        <h4>👤<%= user.getName() %></h4> |
        <a href="RegisteredUserLogoutServlet">Logout</a>
        
    </div>
</div>

    <div class="cart-container">
        <table>
            <tr>
                <th>PRODUCT NAME</th>
                <th>UNIT PRICE</th>
                <th>QUANTITY</th>
                <th>LINE TOTAL</th>
                <th>REMOVE</th>
            </tr>
            <%
                for (AddCartModel item : cartItems) {
            %>
            <tr>
                <td><%= item.getPart_name() %></td>
                <td>LKR <%= item.getUnitprice() %></td>
                <td>
                    <form action="UpdateCartQuantityServlet" method="post" class="qty-form">
                        <input type="hidden" name="part_id" value="<%= item.getPart_id() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" onchange="this.form.submit()">
                    </form>
                </td>
                <td>LKR <%= item.getLinetotal() %></td>
                <td>
                    <form action="RemoveCartItemServlet" method="post">
                        <input type="hidden" name="part_id" value="<%= item.getPart_id() %>">
                        <button type="submit" class="btn btn-remove">X</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>

        <div class="summary">
            <h3>Order Summary</h3>
            <p>Subtotal: <span id="subtotalDisplay">LKR <%= subtotal %></span></p>
            <p class="shipping-method">Shipping Method:</p>
            <label><input type="radio" name="shipping" onclick="updateTotal(false)" checked> Local Pickup (LKR 0)</label><br>
            <label><input type="radio" name="shipping" onclick="updateTotal(true)"> Flat Rate (LKR 300)</label>
            <br><br>
            <p>Flat Rate: <span id="flatRateDisplay">LKR 0.00</span></p>
            <p><b>Total: <span id="totalDisplay">LKR <%= subtotal %></span></b></p>
            <input type="hidden" id="subtotal" value="<%= subtotal %>">
           <form action="RegisteredUserCheckout.jsp" method="get">
    <input type="hidden" name="shipping" id="shippingMethod">
    <button type="submit" class="btn btn-checkout">PROCEED TO CHECKOUT</button>
</form>

<script>
    function updateTotal(flatRate) {
        const subtotal = parseFloat(document.getElementById("subtotal").value);
        const shippingMethodInput = document.getElementById("shippingMethod");
        const flatRateCharge = flatRate ? 300 : 0;
        shippingMethodInput.value = flatRate ? "Flat Rate" : "Local Pickup";
        document.getElementById("flatRateDisplay").textContent = "LKR " + flatRateCharge.toFixed(2);
        document.getElementById("totalDisplay").textContent = "LKR " + (subtotal + flatRateCharge).toFixed(2);
    }
</script>
        </div>
    </div>
 
  
    <!-- Footer -->
    <div class="footer">
    v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
</div>
    
</body>
</html>