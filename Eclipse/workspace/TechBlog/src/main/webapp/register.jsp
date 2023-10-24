<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog | Register Page</title>

	<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!--  <style>
	  .banner_background{
clip-path: polygon(30% 0%, 70% 0%, 99% 0, 100% 70%, 70% 100%, 30% 100%, 0% 70%, 0 0);
	  }
	</style> -->

    <style type="text/css">
	
	body{
	  	background: url(Images/bg4.png);
	  	background-size: cover;
	  	background-attachment: fixed;
	  }
	  
	</style>
</head>
<body>

    <%@ include file="navbar.jsp" %>
    
    
	<main class="primary-background p-2 banner-background" style="padding-bottom: 100px;">
    <div class = "container">
        <div class = "col-md-4 offset-md-4">
            <div class= "card">
                <div class= "card-header primary-background text-white text-center">
                   <span class="fa fa-user-plus fa-3x"></span>
                   <br>
                   <h4>Register</h4>
                </div> 
                <div class= "card-body">
                     <form id="reg-form" action="RegisterServlet" method="POST">
						  <div class="form-group">
						    <label for="exampleInputEmail1">User name</label>
						    <input name="user_name" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  
						  <div class="form-group">
						    <label for="gender">Select gender</label>
						    <br>
						    <input type="radio" required id="gender" name="gender" value="male">Male
						    <input type="radio" required id="gender" name="gender" value="female">Female
						  </div>
						  
						  <div>
						  	<textarea name="about" class="form-control" id="" rows="3" placeholder="Write about yourself"></textarea>
						  </div>
						  
						  <div class="form-group form-check">
						    <input name="check" required type="checkbox" class="form-check-input" id="exampleCheck1">
						    <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
						  </div>
						  
						  <div class="container text-center" id = "loader" style="display: none;">
						       <span class="fa fa-refresh fa-spin fa-2x"></span>
						       <h5>Please wait..</h5>
						  </div>
						  <div class="text-center">
						    <button id="submit-btn" type="submit" class="btn btn-warning">Submit</button>
						  </div>
					 </form>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>
    <script>
        $(document).ready(function(){
        	console.log("loaded..")
        	
        	$('#reg-form').on('submit', function(event){
        		event.preventDefault();
        		
        		let form = new FormData(this);
        	
        		
        		$("#submit-btn").hide();
        		$("#loader").show();
        		
        		//send this form data to register servlet
        		$.ajax({
        			url: "RegisterServlet",
        			type: "POST",
        			data: form,
        			success: function(data, textStatus, jqXHR){
        				console.log(data)
        				
        				$("#submit-btn").show();
                		$("#loader").hide();
                		
                		if(data.trim() === 'done'){
	                		swal("User Registered Successfully!", "Click OK to redirect to login page.", "success")
	                		.then((value) => {
	                		  window.location="login.jsp"
	                		});
	                		
	                		//to reset the form
	       	                this.reset();
                		} else {
                			swal("", data, "error");
                		}
        			},
        			error: function(jqXHR, textStatus, errorThrown){
        	        				
        				$("#submit-btn").show();
                		$("#loader").hide();
                		
                		swal("", data, "error");

        			},
        			processData: false,
        			contentType: false
        		});
        	});
        });
    </script>
      
</body>
</html>