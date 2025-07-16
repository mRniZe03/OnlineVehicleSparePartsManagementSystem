<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Spare Part Details</title>
    <style>
        /* Previous styles remain the same */
        .detail-label {
            font-weight: bold;
            color: #555;
            display: inline-block;
            width: 150px; /* Increased width */
        }
        /* Add supplier info style */
        .supplier-info {
            margin-top: 20px;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Spare Part Details</h2>
        
        <div class="detail-row">
            <span class="detail-label">ID:</span>
            <span class="detail-value">${sparePart.spare_id}</span>
        </div>
        
        <div class="detail-row">
            <span class="detail-label">Name:</span>
            <span class="detail-value">${sparePart.name}</span>
        </div>
        
        <div class="detail-row">
            <span class="detail-label">Price:</span>
            <span class="detail-value">$${sparePart.price}</span>
        </div>
        
        <div class="detail-row">
            <span class="detail-label">Category:</span>
            <span class="detail-value">${sparePart.category}</span>
        </div>
        
        <div class="detail-row">
            <span class="detail-label">Quantity:</span>
            <span class="detail-value">${sparePart.quantity}</span>
        </div>
        
        <div class="detail-row">
            <span class="detail-label">Description:</span>
            <span class="detail-value">${sparePart.description}</span>
        </div>
        
        <div class="supplier-info">
            <div class="detail-row">
                <span class="detail-label">Supplier ID:</span>
                <span class="detail-value">${sparePart.supplierid}</span>
            </div>
        </div>
        
        <div class="photo-container">
            <c:if test="${not empty sparePart.photoBase64}">
                <img class="photo" src="data:image/jpeg;base64,${sparePart.photoBase64}" alt="Spare Part Photo"/>
            </c:if>
        </div>
        
        <a href="SparePartReportServlet?spare_id=${sparePart.spare_id}" class="btn">Create Report</a>
        <a href="SupplierDashboardSidebar.jsp" class="btn">Back to Dashboard</a>
    </div>
</body>
</html>