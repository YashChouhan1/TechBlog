<%@ page import="com.tech.blog.entities.Message" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog | Login Page</title>
	
	<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style type="text/css">
	
	body{
	  	background: url(Images/bg4.png);
	  	background-size: cover;
	  	background-attachment: fixed;
	  }
	  
	</style>
	

</head>
<body>

    <!-- including navigation bar -->    
    <%@include file="navbar.jsp" %>
    
   <main class="d-flex align-items-center primary-background banner_background" style="height : 91vh;">
    <div class = "container">
    <div class= "row">
        <div class = "col-md-4 offset-md-4">
            <div class= "card">
                <div class= "card-header primary-background text-white text-center">
                   <span class="fa fa-user-circle fa-3x"></span>
                   <br>
                   <h4>Login</h4>
                </div> 
                
                
                
                <%
                    Message msg = (Message) session.getAttribute("msg");
                     
                    if(msg != null){
                    //this is a invalid error message
                    if(msg.getType() == "error"){
                    	
                        %>
                        
                            <div class="alert <%= msg.getCssClass() %> d-flex align-items-center" role="alert">
							  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
							    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
							  </svg>
							  <div>
							    <%= msg.getContent() %>
							  </div>
							</div>
                        	
                        <%
                    	session.removeAttribute("msg");
                    }
                    
                   //This is success message
                   if(msg.getType() == "success"){
                    	
                        %>
                        
                            <div class="alert <%= msg.getCssClass() %> d-flex align-items-center" role="alert">
							  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-check-circle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Success:">
                                 <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
							  </svg>
							  <div>
							    <%= msg.getContent() %>
							  </div>
							</div>
                        	
                        <%
                    	session.removeAttribute("msg");
                    }
                    }
                %>
                <div class= "card-body">
                     <form action="LoginServlet" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input name = "email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  <div class="text-center">
						    <button type="submit" class="btn btn-warning">Submit</button>
						  </div>
					 </form>
                </div>  
             </div>        
         </div>    
    </div> 
    </div>
    </main> 


	<!-- JavaScript Files -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="JS/myjs.js" type="text/javascript"></script>
    
</body>
</html>