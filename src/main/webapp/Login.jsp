<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0; /* Light gray background */
    color: #333; /* Dark text color */
}

.navbar {
    background-color: #333; /* Dark background color */
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
}

.nav-links li {
    display: inline;
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

h1 {
    text-align: center;
    margin-top: 20px;
}

form {
    max-width: 400px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff; /* White background */
    border: 1px solid #ddd; /* Light gray border */
    border-radius: 5px;
}

input[type="number"],
input[type="password"],
button {
    display: block;
    width: 100%;
    margin-bottom: 10px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc; /* Light gray border */
    border-radius: 5px;
    box-sizing: border-box; /* Ensure padding and border are included in element's total width and height */
}

button {
    background-color: #4CAF50; /* Dark green button background */
    color: white;
    border: none;
    cursor: pointer;
}

button[type="reset"] {
    background-color: #FF5722; /* Deep orange button background */
}

button:hover {
    opacity: 0.8; /* Reduce opacity on hover */
}

a {
    display: block;
    width: fit-content;
    margin: 20px auto;
    text-align: center;
    text-decoration: none;
    color: #333; /* Dark text color */
}
</style>
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <a href="#" class="logo">RENTIFY</a>
            <ul class="nav-links">
                <li><a href="Home.jsp" class="nav-btn">Home</a></li>
            </ul>
        </div>
    </nav>

    <h1>${msg}</h1>
    <h1>Login Here</h1>
    <br>
    <form action="login" method="post">
        Customer Id:<input type="number" name="cid" placeholder="Enter Customer Id"><br> 
        Password:<input type="password" name="password"><br>
        <button type="reset">Cancel</button>
        <button>Login</button>
    </form>
    <br>
    <br>
    <a href="Home.jsp"><button>Home</button></a>
</body>
</html>