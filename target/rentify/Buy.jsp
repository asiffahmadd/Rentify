<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentify.dto.Property"%>
<%@page import="java.util.List"%>
<%@page import="rentify.dao.CustomerDao"%>
<%@page import="rentify.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0; /* Light gray background */
}

.container {
    max-width: 800px;
    margin: 20px auto;
    padding: 0 20px;
}

.product-table {
    border-collapse: collapse;
    width: 100%;
    background-color: #fff; /* White background */
    border: 1px solid #ddd; /* Light gray border */
}

.product-table th, .product-table td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd; /* Light gray border bottom for each cell */
}

.product-table th {
    background-color: #4CAF50; /* Dark green header background */
    color: white;
}

.product-table tbody tr:nth-child(even) {
    background-color: #f2f2f2; /* Alternate row background */
}

.product-table img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 0 auto;
}

.home-link, .buy-btn {
    text-decoration: none;
}

.home-btn, .buy-btn {
    padding: 10px 20px;
    border: none;
    background-color: #4CAF50; /* Dark green button background */
    color: white;
    cursor: pointer;
    font-size: 16px;
}

.home-btn:hover, .buy-btn:hover {
    background-color: #45a049; /* Darker shade of green on hover */
}

.home-link, .buy-btn {
    display: inline-block;
    margin-top: 10px;
    margin-right: 10px;
}

</style>
</head>
<body>

<div class="container">
    <table class="product-table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Price</th>
                <th>No of Bedrooms</th>
                <th>No of Bathrooms</th>
                <th>Nearby College</th>
                <th>Nearby Hospital</th>
                <th>Image</th>
                <th>Buy</th>
            </tr>
        </thead>
        <tbody>
            <% for (Property product : (List<Property>) request.getAttribute("list")) { %>
                <tr>
                    <td><%= product.getPlace() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getNumberofbedrooms() %></td>
                    <td><%= product.getNumberofbathrooms() %></td>
                    <td><%= product.getNearbycollege() %></td>
                    <td><%= product.getNearbyhospital() %></td>
                    <td>
                        <% String base64 = Base64.encodeBase64String(product.getImage()); %>
                        <img src="data:image/jpeg;base64,<%= base64 %>" alt="Product Image">
                    </td>
                    <td><a href="buy?id=<%= product.getId() %>"><button class="buy-btn">Interested</button></a></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <a href="Home.jsp" class="home-link"><button class="home-btn">Home</button></a>
</div>


</body>
</html>