<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.RegisteredUserModel, model.AddCartModel, java.util.*, java.math.BigDecimal" %>
<%
    RegisteredUserModel user = (RegisteredUserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RegisteredUserLogin.jsp");
        return;
    }

    // Fetch shipping method
    String shippingMethod = request.getParameter("shipping");
    BigDecimal shippingCost = "Flat Rate".equals(shippingMethod) ? new BigDecimal("300.00") : BigDecimal.ZERO;

    // Fetch cart items from DB/service
    List<AddCartModel> cartItems = service.user.AddCartService.getUserCartItems(user.getId());
    BigDecimal subtotal = service.user.AddCartService.calculateSubtotal(user.getId());
    BigDecimal total = subtotal.add(shippingCost);

    // Store in session for later
    session.setAttribute("cartItems", cartItems);
    session.setAttribute("shippingMethod", shippingMethod);
    session.setAttribute("subtotal", subtotal);
    session.setAttribute("total", total);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

 <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background-color: #0f1a3a; /* dark background */
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
         justify-content: space-between;
         align-items: center;
         padding: 18px 40px;
         box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
         font-family: 'Poppins', sans-serif;
    }

      .logo {
         font-size: 22px;
         color: #ffcc00;
         font-weight: 600;
     }

      .navbar > div:nth-child(2) {
         display: flex;
         gap: 30px;
         justify-content: center;
         flex: 1;
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


    .menu {
         display: flex;
         align-items: center;
         gap: 10px;
    }

    .container {
        display: flex;
        justify-content: space-between;
        gap: 20px;
        padding: 40px;
        max-width: 1200px;
        margin: auto;
    }

    .form-section, .summary-section {
        background-color: #1e295e;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    .form-section {
        flex: 1.5;
    }

    .summary-section {
        flex: 1;
    }

    h2, h3 {
        margin-bottom: 20px;
        color: #ffcc00;
    }

    .field {
        margin-bottom: 18px;
    }

    .field label {
        display: block;
        font-weight: 600;
        margin-bottom: 6px;
        color: #ffffff;
    }

    .field input, .field select {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        background-color: #0c1333;
        border: 1px solid #444;
        color: white;
        font-size: 14px;
    }

    .field input:focus, .field select:focus {
        outline: none;
        border-color: #ffcc00;
    }

    .radio-group {
        margin-bottom: 20px;
        color: #ccc;
    }

    .radio-group input {
        margin-right: 10px;
    }

    .pay-btn {
        padding: 12px;
        background-color: #ffcc00;
        color: #0f1a3a;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        width: 100%;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s;
    }

    .pay-btn:hover {
        background-color: #e6b800;
    }

    .summary-section p {
        font-size: 15px;
        margin-bottom: 10px;
        color: #ddd;
    }

    .summary-section strong {
        font-size: 16px;
        color: #ffffff;
    }

    .summary-section form input[type="submit"] {
        margin-top: 20px;
        padding: 10px 15px;
        background-color: #2d3d75;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }

    .summary-section form input[type="submit"]:hover {
        background-color: #1a254b;
    }

    #cardSection, #bankSection {
        padding: 10px 0;
        margin-bottom: 20px;
    }

    #cardSection p, #bankSection p {
        margin: 5px 0;
        color: #ccc;
    }

    input[readonly] {
        background-color: #0c1333;
        color: #ccc;
    }
    
    .payment-logos {
    margin-top: 20px;
}

.pay-logo, .bank-logo {
    height: 35px;
    margin: 5px 8px 10px 0;
    border-radius: 5px;
    background-color: white;
    padding: 4px;
}
    
    .footer {
    background-color: #111742;
    color: #cccccc;
    text-align: center;
    padding: 15px;
    font-size: 14px;
    margin-top: 40px;
    border-top: 1px solid #222;
}

</style>

<script>
    function togglePayment(type) {
        document.getElementById("cardSection").style.display = type === 'card' ? 'block' : 'none';
        document.getElementById("bankSection").style.display = type === 'bank' ? 'block' : 'none';

        // Clear fields when switching
        if (type === 'card') {
            document.getElementById("depositBank").value = "";
            document.getElementById("depositSlip").value = "";
        } else {
            document.getElementById("cardName").value = "";
            document.getElementById("cardNumber").value = "";
            document.getElementById("expDate").value = "";
            document.getElementById("cvv").value = "";
        }
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
    
<div class="container">
    <!-- Checkout Form -->
    <div class="form-section">
        <h2>Billing & Payment</h2>
        <form action="RegisteredUserCheckoutServlet" method="post">
            <div class="field"><label>Email</label><input type="email" name="email" required></div>
            <div class="field"><label>Phone</label><input type="text" name="phone" required></div>
            <div class="field"><label>First Name</label><input type="text" name="firstName" required></div>
            <div class="field"><label>Last Name</label><input type="text" name="lastName" required></div>
            <div class="field"><label>Street Address</label><input type="text" name="street" required></div>
            <div class="field"><label>City</label><input type="text" name="city" required></div>
            <div class="field"><label>Postcode / ZIP</label><input type="text" name="postcode" required></div>
            <div class="field"><label>Country</label><input type="text" name="country" value="Sri Lanka" readonly></div>
            <div class="field"><label>Province</label><input type="text" name="province" required></div>

            <!-- Payment Method -->
             <h3>Payment Method</h3>
               <div class="radio-group">
                  <input type="radio" name="paymentMethod" value="Card Payment" onclick="togglePayment('card')" required> Card Payment<br>
                  <input type="radio" name="paymentMethod" value="Bank Payment" onclick="togglePayment('bank')"> Bank Transfer
               </div>

            <!-- Card Payment Fields -->
            <div id="cardSection" style="display:none">
                <div class="field"><label>Cardholder Name</label><input type="text" name="cardName" id="cardName"></div>
                <div class="field"><label>Card Number</label><input type="text" name="cardNumber" id="cardNumber"></div>
                <div class="field"><label>Expiration Date</label><input type="month" name="expDate" id="expDate"></div>
                <div class="field"><label>CVV</label><input type="text" name="cvv" id="cvv"></div>
            </div>

            <!-- Bank Payment Fields -->
            <div id="bankSection" style="display:none">
                <p><strong>Bank Options:</strong></p>
                <p>Bank: Commercial Bank <br>
                   Acc No: 123456789<br>
                   Branch: Colombo
                 </p>
                <p>Bank: BOC <br> 
                   Acc No: 987654321 <br> 
                   Branch: Kandy
                 </p>
                <div class="field"><label>Deposited Bank</label><input type="text" name="depositBank" id="depositBank"></div>
                <div class="field"><label>Deposit Slip Code</label><input type="text" name="depositSlip" id="depositSlip"></div>
            </div>

            <input type="hidden" name="shippingMethod" value="<%= shippingMethod %>">
<input type="hidden" name="total" value="<%= total %>">
<button type="submit" class="pay-btn">Submit Order</button>

        </form>
    </div>

    <!-- Order Summary -->
    <div class="summary-section">
    <h3>Order Summary</h3>
    <% for (AddCartModel item : cartItems) { %>
        <p><%= item.getPart_name() %> x<%= item.getQuantity() %> – LKR <%= item.getLinetotal() %></p>
    <% } %>
    <p>Subtotal: LKR <%= subtotal %></p>
    <p>Shipping (<%= shippingMethod %>): LKR <%= shippingCost %></p>
    <p><strong>Total: LKR <%= total %></strong></p>
    
    
    <form action="RegisteredUserShoppingCartServlet" method="get">
            <input type="submit" value="Back">
        </form>
        
      <!-- Payment Logos from local folder -->
      <div class="payment-logos">

         <p style="margin-top: 20px; color: #ffcc00; font-weight: bold;">Supported Banks:</p>
         <img src="image/commercialbank.png" alt="Commercial Bank" class="bank-logo">
         <img src="image/boc.jpg" alt="BOC" class="bank-logo">
         
</div>

</div>
</div>

<!-- Footer -->
<div class="footer">
    v1.0 — © 2025 <strong>AutoVio</strong>. All rights reserved.
</div>
</body>
</html>