<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! something went wrong..</title>


	<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
	  .banner_background{
	      clip-path: polygon(0 0, 100% 0, 100% 92%, 69% 100%, 32% 93%, 0 100%);
	  }
	</style>
</head>
<body>
    <div class="container text-center">
     
     <img src="Images/computer.png" class="img-fluid mt-5" width = "250" height = "250" >
     <h3 class="display-4">Sorry ! something went wrong..</h3>
     <%= exception.getMessage() %>
     <br>
     <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Go back to Home</a>
    </div>
</body>
</html>