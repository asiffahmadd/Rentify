<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-image: url('background-image.jpg'); /* Replace 'background-image.jpg' with the path to your image */
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    color: #fff; /* Text color */
}

h1 {
    text-align: center;
}

form {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.7); /* White background color with transparency */
    border: 1px solid #ddd; /* Light gray border */
    border-radius: 5px;
}

label {
    color: #333; /* Dark text color */
}

input[type="text"],
input[type="file"],
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
    color: #fff; /* Text color */
}

</style>
</head>
<body>
<%
if(session.getAttribute("customer")==null)
{
	response.getWriter().print("<h1>Invalid Session</h1>");
	request.getRequestDispatcher("Home.jsp").include(request, response);
}else{
%>
	<h1>Add Property to Sell</h1>
	<form action="addproduct" method="post" enctype="multipart/form-data">
		<label> Place:</label> <input type="text" name="pplace"><br> 
		 <label> Price:</label><input type="text" name="pprice"><br>
		<label>No._of_BathR:</label> <input type="text" name="NBEDR"><br> 
		<label> No._of_BedR:</label> <input type="text" name="NBATHDR"><br> 
		 
		<label> Nearbycollege:</label> <input type="text" name="Nbycollege"><br> 
		 
		<label> Nearbyhospital:</label> <input type="text" name="Nbyhospital"><br> 
		
		IMage:<input type="file" name="pimage"><br>
		<button type="reset">Cancel</button>
		<button>Put on Sale</button>
	</form>
	<br>
	<br>
	<a href="Home.jsp">Home</a>
	<%} %>
</body>
</html>
	