<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #0f1a3a;
        color: #f9c802;
        padding: 50px;
    }

    form {
        background-color: #111742;
        padding: 30px;
        border-radius: 10px;
        width: 400px;
        margin: auto;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    label {
        font-weight: bold;
        color: #f9c802;
        display: block;
        margin-bottom: 6px;
    }

    input[type="text"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: none;
        margin-bottom: 20px;
        font-size: 15px;
    }

    input[type="text"] {
        background-color: #1e2b4d;
        color: white;
    }

    input[type="submit"] {
        background-color: #f9c802;
        color: #0f1a3a;
        font-weight: bold;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #e6b700;
    }
</style>
</head>
<body>
<%
String id= request.getParameter("id");
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String address= request.getParameter("address");
String joining_date= request.getParameter("joining_date");
%>
    <form action="updatedeliveryServlet" method="post">
    <h2>Update Form</h2>
     <label for="name">ID:</label><br>
        <input type="text" id="id" name="id" value="<%=id%>" readonly><br><br>
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" value="<%=name%>" required><br><br>

        <label for="email">Email:</label><br>
        <input type="text" id="email" name="email" value="<%=email%>"required><br><br>

        <label for="phone">ContactNumber:</label><br>
        <input type="text" id="phone" name="phone" value="<%=phone%>"required><br><br>

        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address"value="<%=address%>"required><br><br>

        <label for="joining_date">Date:</label><br>
        <input type="text" id="joining_date" name="joining_date" value="<%=joining_date%>"required><br><br>

        <input type="submit" value="Submit">
    </form>

</body>
</html>