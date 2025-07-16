<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>About Us | AutoVio Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #0f1a3a 0%, #1e295e 100%);
            color: #f0f0f0;
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            box-sizing: border-box;
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
        
        .about-container {
            max-width: 900px;
            margin: 0 auto;
            background: rgba(30,41,94,0.95);
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
        }
        h1 {
            text-align: center;
            color: #f9c802;
            font-size: 2.8rem;
            margin-bottom: 20px;
            font-weight: 700;
            letter-spacing: 1.2px;
        }
        p {
            font-size: 1.15rem;
            line-height: 1.7;
            margin-bottom: 20px;
            color: #e0e0e0;
        }
        .team-section {
            margin-top: 40px;
        }
        .team-section h2 {
            color: #f9c802;
            font-size: 2rem;
            margin-bottom: 25px;
            font-weight: 600;
            letter-spacing: 1px;
            text-align: center;
        }
        .team-members {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }
        .member-card {
            background: #1e295e;
            border-radius: 12px;
            padding: 20px;
            width: 220px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            text-align: center;
            transition: transform 0.3s ease;
        }
        .member-card:hover {
            transform: translateY(-8px);
        }
        .member-photo {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid #f9c802;
        }
        .member-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: #f9c802;
            margin-bottom: 6px;
        }
        .member-role {
            font-size: 1rem;
            color: #ccc;
            margin-bottom: 10px;
        }
        .member-bio {
            font-size: 0.9rem;
            color: #ddd;
            line-height: 1.4;
        }
        @media (max-width: 650px) {
            .team-members {
                flex-direction: column;
                align-items: center;
            }
            .member-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="navbar">

        <a href="UserHome.jsp">Home</a>
        <a href="UserShopServlet">Shop</a>
        <a href="ContactUs.jsp">Contact Us</a>
        
    </div>
    <div class="about-container">
        <h1>About eSpareMart</h1>
        <p>
            eSpareMart is a leading provider of automotive parts and services, dedicated to delivering high-quality products and exceptional customer support. Founded in 2010, we have grown to become a trusted partner for auto repair shops, dealerships, and individual car enthusiasts across the region.
        </p>
        <p>
            Our mission is to simplify the process of sourcing reliable spare parts while maintaining competitive pricing and fast delivery. We believe in innovation, transparency, and building long-term relationships with our customers.
        </p>

        <div class="team-section">
            <h2>Meet Our Team</h2>
            <div class="team-members">
                <div class="member-card">
                    <div class="member-name">🧑🏻‍💻</div>
                    <div class="member-name">Chethaka</div>
                    <div class="member-role">Admin</div>
                    <div class="member-bio">
                        John has over 15 years of experience in the automotive industry and leads eSpareMart with passion and vision.
                    </div>
                </div>
                <div class="member-card">
                    <div class="member-name">👩🏻‍💻</div>
                    <div class="member-name">Chathurya</div>
                    <div class="member-role">Supplier</div>
                    <div class="member-bio">
                        Jane oversees daily operations ensuring smooth supply chain management and customer satisfaction.
                    </div>
                </div>
                <div class="member-card">
                    <div class="member-name">👩🏻‍💻</div>
                    <div class="member-name">Thiruni</div>
                    <div class="member-role">Delivery Personal</div>
                    <div class="member-bio">
                        Alex leads our sales team with a focus on building strong client relationships and expanding market reach.
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>