<%@page import="rentify.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Money to Wallet</title>

<style type="text/css">body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0; /* Light gray background */
    color: #333; /* Dark text color */
}

h1 {
    text-align: center;
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
<%
Customer customer=(Customer)session.getAttribute("customer");
if(customer==null)
{
	response.getWriter().print("<h1>Invalid Session</h1>");
	request.getRequestDispatcher("Home.jsp").include(request, response);
}else{
%>
<h1>Current Balance:<%=customer.getWallet()%><br></h1>
<form action="addmoney">
<input type="number" name="money">
<button>Add</button>
</form>
<br><br>
	<a href="Home.jsp"><button>Home</button></a>
<%} %>

</body>
</html>