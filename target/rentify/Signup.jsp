<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="x" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction:column;
    height: 100vh;
}
.areaaa{
padding: 20px;
 display: flex;
    justify-content: center;
    align-items: center;
    flex-direction:column;
}

h1 {
    text-align: center;
    color: #333;
}

form {
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
}

form input[type="text"],
form input[type="tel"],
form input[type="password"],
form input[type="date"],
form input[type="email"] {
    width: calc(100% - 22px); /* Adjust for padding */
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

form input[type="radio"] {
    margin: 0 5px 0 0;
}

form label {
    display: block;
    margin: 10px 0 5px;
}

form textarea {
    resize: none;
}

form button {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
}

form button[type="reset"] {
    background: #ccc;
    color: #333;
    margin-right: 10px;
}

form button[type="submit"] {
    background: #28a745;
    color: #fff;
}

form button:hover {
    opacity: 0.9;
}
</style>
</head>
<body>

<div class="areaaa">
<h1>${msg}</h1>

	<h1>Signup Here</h1>

	<x:form action="signup" method="post" modelAttribute="customer">

Name:<input type="text" name="name" required="required">
		<br>
Mobile:<input type="tel" name="mobile" pattern="[0-9]{10}"
			required="required">
		<br>
Password:<input type="password" name="password" required="required">
		<br>
Gender:<input type="radio" name="gender" value="male"
			required="required">Male
		<input type="radio" name="gender" value="female">Female<br>
<br>
DOB:<input type="date" required="required" name="bdate">
		<br>
Email:<input type="email" name="email" required="required">
		<br>
		<button type="reset">Cancel</button>
		<button>Signup</button>
	</x:form>
	<br>
	<br>
	<a href="Home.jsp"><button>Home</button></a>
</div>
</body>
</html>