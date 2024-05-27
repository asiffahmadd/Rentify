<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("https://media.istockphoto.com/id/1409298953/photo/real-estate-agents-shake-hands-after-the-signing-of-the-contract-agreement-is-complete.jpg?s=612x612&w=0&k=20&c=SFybbpGMB0wIoI0tJotFqptzAYK_mICVITNdQIXqnyc="); /* Replace 'background-image.jpg' with the path to your image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.5); /* Dark background color with transparency */
            color: #fff; /* Text color */
            padding: 10px 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
        }

        .nav-links {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links li:last-child {
            margin-right: 0;
        }

        .nav-links .nav-btn {
            text-decoration: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .nav-links .nav-btn:hover {
            background-color: #555; /* Darker background color on hover */
        }

        .content {
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #fff; /* Text color */
        }

        #login-options {
            max-width: 600px;
            margin: 20px auto;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.7); /* White background color with transparency */
            border: 1px solid #ddd; /* Light gray border */
            text-align: center;
        }

        button {
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        #login-btn {
            background-color: #4CAF50; /* Dark green button background */
            color: white;
        }

        #signup-btn {
            background-color: #FFC107; /* Amber button background */
            color: white;
        }

        #buy-btn {
            background-color: #2196F3; /* Blue button background */
            color: white;
        }

        #sell-btn {
            background-color: #673AB7; /* Purple button background */
            color: white;
        }

        #add-money-btn {
            background-color: #FF5722; /* Deep orange button background */
            color: white;
        }

        #logout-btn {
            background-color: #F44336; /* Red button background */
            color: white;
        }

        button:hover {
            opacity: 0.8; /* Reduce opacity on hover */
        }
        /* Style the container */
.content {
    text-align: center;
}

/* Style the first h1 */
.content h1:nth-of-type(1) {
      font-size: 3em;
    color: red; /* Change color as needed */
    margin-bottom: 20px; /* Add some space below */
	border:2px solid red;
	border-radius:5px;
	background-color: #FFFFFF;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Add a text shadow */
}

/* Style the second h1 */
.content h1:nth-of-type(2) {
    font-size: 3em;
    color: red; /* Change color as needed */
    margin-bottom: 20px; /* Add some space below */
	border:2px solid red;
	border-radius:5px;
	background-color: #FFFFFF;
}
.content h1:nth-of-type(1):hover {
  	border:5px solid red;
	border-radius:5px;
	background-color: #FFFFF1;
}

/* Style the button */
#login-btn {
    padding: 10px 20px;
    font-size: 1em;
    background-color: #ff6600; /* Change color as needed */
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#login-btn:hover {
    background-color: #cc5500; /* Darker color on hover */
}
        
    </style>
</head>
<body>
<nav class="navbar">
    <div class="container">
        <a href="#" class="logo">RENTIFY</a>
        <ul class="nav-links">
            <c:if test="${empty sessionScope.customer}">
                <li><a href="Login.jsp" class="nav-btn">Login</a></li>
                <li><a href="load" class="nav-btn">Sign Up</a></li>
            </c:if>
            <li><a href="displayproducts" class="nav-btn">Buy</a></li>
            <c:if test="${not empty sessionScope.customer}">
                <li><a href="AddProduct.jsp" class="nav-btn">Sell</a></li>
                <li><a href="AddMoney.jsp" class="nav-btn">Add Money</a></li>
                <li><a href="logout" class="nav-btn">Logout</a></li>
            </c:if>
        </ul>
    </div>
</nav>
<div class="content">
    <h1>${msg}</h1>
    <h1>Welcome to RENTIFY Home</h1><br>
    <div id="login-options">
        <c:if test="${empty sessionScope.customer}">
            <a href="Login.jsp"><button id="login-btn">Login</button></a><br><br>
            <a href="load"><button id="signup-btn">Signup</button></a><br><br>
        </c:if>
        <a href="displayproducts"><button id="buy-btn">View Property</button></a>
        <br>
        <br>
        <c:if test="${not empty sessionScope.customer}">
            <a href="AddProduct.jsp"><button id="sell-btn">add Property</button></a><br><br>
            <a href="AddMoney.jsp"><button id="add-money-btn">Add Money to Wallet</button></a><br><br>
            <a href="logout"><button id="logout-btn">Logout</button></a><br><br> 
        </c:if>
    </div>
    </div>
</body>
</html>
