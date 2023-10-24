<%@ page import="com.tech.blog.entities.User" %>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="java.util.*" %>

<%@ page errorPage="error_page.jsp" %>
 
<!-- This is used to maintain session, if no user found then it get logged out. -->
<%
    User user = (User) session.getAttribute("currentUser");
    if(user == null){
    	response.sendRedirect("login.jsp");
    }
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog | Profile Page</title>

	<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
	  .banner_background{
	      clip-path: polygon(0 0, 100% 0, 100% 92%, 69% 100%, 32% 93%, 0 100%);
	  }
	  .primary-background2{
		  background: #EDC211!important;
      }
      .border {
          border-color: black;
          border-width: 2px;          
	  }
	  body{
	  	background: url(Images/bg4.png);
	  	background-size: cover;
	  	background-attachment: fixed;
	  }
	  .box{
	    position: sticky;
	    top: 55px;
	  }
	  .card1{
	     margin-top: 70px;
	  }
	  .navbar1 {
	    padding:10px;
	    margin-bottom: 50px;
	    position: fixed;
	    top: 0;
	    left: 0;
	    right: 0;
	    z-index: 1000; /* This ensures the navbar is on top of other content */
	  }
	  .footer {
            background-color: #333; /* Background color for the footer */
            color: #fff; /* Text color for the footer */
            padding: 20px; /* Padding for spacing */
            text-align: center; /* Center-align text within the footer */
        }
      
	</style>
	
</head>
<body> 
   
  <!-- Start of navbar -->
	  
	  <nav class="navbar navbar-expand-lg navbar-dark primary-background navbar1" style="position: fixed;">
	  <a class="navbar-brand" href="index.jsp"><span class="fa fa-desktop"></span> TechBlog</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#"><span class="fa fa-file-code-o"></span> Code with Yash <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <span class="fa fa-navicon"></span> Categories
	        </a>
	        
	        <div id ="category-dropdown" class="dropdown-menu" aria-labelledby="navbarDropdown">
        
        		<%
        		
        			PostDao dao1 = new PostDao(ConnectionProvider.getConnection());
        			ArrayList<Category> list1 = dao1.getCategories();
        			
        			for(Category cat : list1){
				    	 
				    	 %>
				    	 	  <a href="#" onclick = "closeDropdown()" class="dropdown-item"><%= cat.getName() %></a>
				    	 <%
				    	 
				     } 		        		      		
        		        		
        		%>
                  
		          <div class="dropdown-divider" ></div>
		             <a class="dropdown-item" onclick = "closeDropdown()" href="#">Other..</a>
            </div>
            
	      </li>
	            
	      <li class="nav-item">
	        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-calendar-plus-o"></span> Create Post</a>
	      </li>
	      
	      <li class="nav-item">
	        <a class="nav-link" href="resume.html"><span class="fa fa-vcard-o"></span> About Us</a>
	      </li>
	      
	    </ul>
	    
	    <ul class="navbar-nav mr-right">
	      <li class="nav-item">
	        <a class="nav-link" href="#!" data-toggle="modal" data-target="#Profile-Modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
	      </li>
	      
	      <li class="nav-item">
	        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
	      </li>
	    </ul>
	  </div>
	</nav>

 <!-- End of Navbar -->
 
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
                
    <!-- Start of  Main Body of Profile -->
    
    <main>
    	<div class="container-fluid">
    		<div class="row">
    		    
    		    <!-- /**
			        This section will display posts by user choice, if no choice provided
			        then by default it will load all the posts in newest first order.    
			    **/ -->
			    
    		    <!-- First column(Section) -->
    			<div class="col-md-3 box card1" >
    				<!-- Categories -->
    				  <div class="list-group box">
						  <a href="#" onclick = "getPosts(0, this)" class=" c-link list-group-item list-group-item-action primary-background2">
						    All Posts
						  </a>
						  
						  <%
						     PostDao dao = new PostDao(ConnectionProvider.getConnection());
						     ArrayList<Category> list = dao.getCategories();
						     
						     for(Category cat : list){
						    	 
						    	 %>
						    	 	  <a href="#" onclick = "getPosts(<%= cat.getCid() %>, this)" class=" c-link list-group-item list-group-item-action"><%= cat.getName() %></a>
						    	 <%
						    	 
						     }
						  
						  %>
						 
				     </div>
    	
             	</div>
             	
             	 <!-- Second column(Section) -->
             	<div class="col-md-9 card1">
    				<div class="container text-center card1" id = "loader" style="margin-top: 200px;" >
    					<i class="fa fa-refresh fa-spin fa-3x" ></i>
    					<h4 class="mt-2">Loading...</h4>
    				</div>
    				
    				<div class="container-fluid" id="post-container">
    				
    				</div>
    	        </div>    	
    	    </div>
    	</div>
    </main>
    
  
    
    <!-- End of  Main Body of Profile -->
 
    <!-- Profile Modal -->
 
 	<!-- Profile Detail -->
 	
	<!-- Modal -->
	
	<div class="modal fade" id="Profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white" >
	        <h4 class="modal-title" id="exampleModalLabel">Profile</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      
	      
	      <div class="modal-body">
	        <div class="container text-center">
	               
	            <img alt="<%= user.getProfile() %>" src="ProfilePic/<%= user.getProfile() %>" class="image-fluid" style="border-radius: 50%; max-width: 150px"></img>
	            <h5 class="modal-title mt-3 mb -3" id="exampleModalLabel"> <%= user.getName() %></h5>
	        
	        <!-- User details -->
	        <div id="profile-detail" class="container">
	            <table class="table">
				 
				  <tbody>
				    <tr>
				      <th scope="row">Id : </th>
				      <td><%= user.getId() %></td>
				      
				    </tr>
				    <tr>
				      <th scope="row">Email : </th>
				      <td><%= user.getEmail() %></td>
				      
				    </tr>
				    <tr>
				      <th scope="row">Gender : </th>
				      <td><%= user.getGender() %></td>
				      
				    </tr>
				    <tr>
				      <th scope="row">About : </th>
				      <td><%= user.getAbout() %></td>
				      
				    </tr>
				    <tr>
				      <th scope="row">Registered on : </th>
				      <td><%= user.getDateTime().toLocaleString()%></td>
				    </tr>
				  </tbody>
				</table>
	          </div>
	          
	          <!-- Edit details modal -->
	          <div id="profile-edit" class="container" style="display: none;">
	            <h3 class="mt-2">Edit profile</h3>
	            <form action="EditServlet" method="post" enctype="multipart/form-data">
	            	<table class="table">
	            		<tr>
	            			<td>Id :</td>
	            			<td><%= user.getId() %></td>
	            		</tr>
	            		
	            		<tr>
	            			<td>Gender :</td>
	            			<td><%= user.getGender().toUpperCase() %></td>
	            		</tr>
	            			            		
	            		<tr>
	            			<td>Name :</td>
	            			<td><input type="text" class="form-control text-center" name="user_name" value="<%= user.getName() %>"></td>
	            		</tr>
	            		
	            		<tr>
	            			<td>Email :</td>
	            			<td><input type="email" class="form-control text-center" name="user_email" value="<%= user.getEmail() %>"></td>
	            		</tr>
	            		
	            		<tr>
	            			<td>Password :</td>
	            			<td><input type="text" class="form-control text-center" name="user_password" value="<%= user.getPassword() %>"></td>
	            		</tr>
	            		
	            		<tr>
	            			<td>About :</td>
	            			<td><textarea rows='2' class="form-control text-center" name="user_about" ><%= user.getAbout() %></textarea></td>
	            		</tr>
	            		<tr>
	            			<td>New Profile picture :</td>
	            			<td><input type="file" class="form-control" name="user_image" ></td>
	            		</tr>
	            		
	            	</table>
	            	
	            	<div class="container">
	            	    <button type="submit" class="btn btn-success btn-lg">Save</button>
	            	</div>
	            </form>
	          </div>
	          
	          
	        </div>
	      </div>
	      
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button id="edit-button" type="button" class="btn btn-warning">Edit</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Add post modal start  -->
 
 		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header primary-background text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        
				   <form id="add-post-form" action="AddPostServlet" method="post">
				   
				   		<div class = "form-group">
				   			<select class="form-control" name="cid"> 
				   				<option selected disabled>---Select Category---</option>
				   				
				   				
				   				<% 
				   					PostDao pod = new PostDao(ConnectionProvider.getConnection());
				   				    ArrayList<Category> list2 =  pod.getCategories();
				   				    
				   				    for(Category c : list2)
				   				    {				   				    	
				   				%>
				   						<option value="<%= c.getCid() %>"><%= c.getName() %></option>
				   				<%
				   				    }
				   				%>
				   								   				
				   			</select>
				   		</div>
				   		
				   		<div class = "form-group">
				   			<input name = "pTitle" type= "text"  placeholder="Enter your Title" class="form-control">
				   		</div>
				   		
				   		<div class="form-group">
				   			<textarea  name = "pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
				   		</div>
				   		
				   		<div class="form-group">
				   			<textarea name = "pCode" class="form-control" style="height: 150px;" placeholder="Enter your program (if any)"></textarea>
				   		</div>
				   		
				   		<div class="form-group">
				   			<label><b>Insert Photo Attachment :-</b></label>
				   			<input type="file" name = "pic" >
				   		</div>
				   
				   
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">POST</button>
				      </div>
		            </form>
			      </div>
			    </div>
			  </div>
			</div>
    <!-- add post modal end -->
    
    <div class="footer">
        <!-- Footer content goes here -->
        <p>&copy; 2023 | TECHBLOG. ALL RIGHTS RESERVED.</p> <!-- Replace with your website name and copyright information -->
    </div>
    
 	<!-- JavaScript Files -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="JS/myjs.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    <script>
                        
		    $(document).ready(function(){
		   		
				let editStatus = false;
				
				$("#edit-button").click(function()
				{
		
				    if(editStatus == false){
		    			
		    			$("#profile-edit").show();
		    			$("#profile-detail").hide();
		    			
		    			$(this).text("Back");
		    			
		    			editStatus = true;
		    		} 
		    		else {
		    			
		    			$("#profile-edit").hide();
		    			$("#profile-detail").show();
		    			
		    			$(this).text("Edit");
		    			
		    			editStatus = false;
		    		}
				
			   })
		   });     
    </script>
    
    <!-- JS for new post -->
    
    <script>
         $(document).ready(function(e){

				$("#add-post-form").on("submit", function(event){
					
					// this will call on submitting the post.
					
					event.preventDefault();
					console.log("data submitted");
					let form = new FormData(this);
					
					//now request to server.
					$.ajax({
						url: "AddPostServlet",
						type: 'POST',
						data: form,
						success: function(data, textStatus, jqXHR){
							if(data.trim() == "done"){
								swal("Good job!", "Post Saved Successfully.", "success");
							} else {
								swal("Error", "Post Not Saved. try again!!", "error");
							}
							
						},
						error: function(jqXHR, textStatus, errorThrown){
							swal("Error", "Post Not Saved. try again!!", "error");
						}, 
						processData: false,
						contentType: false
					})
				
					
					
				})
         })
    </script>
    
    <!-- Loading post using ajax -->
    <script>
    
    	function getPosts(catId, temp){
    		    		    		
			$("#loader").show();
			$("#post-container").hide();
			
			//To remove selected category with highlight Blue color in category section.
			$(".c-link").removeClass("primary-background2");
			
			//To remove border to selected category in category section.
			$(".c-link").css({
				    "border-color": "",
 				    "border-width": ""
 				});
			
    		$.ajax({
    			    			   			    			
     			url : "load_posts.jsp",
     			data : {cid : catId},
     			success: function(data, textStatus, jqXHR){
     				console.log(data);
     				$("#loader").hide();
     				$("#post-container").show();
     				
     				$("#post-container").html(data);
     				
     				//To highlight selected category with Blue color in category section.
     				$(temp).addClass("primary-background2");
     				$(temp).css('color', 'black');
     				
     				//To add border to selected category in category section.
     				$(temp).css({
     				    "border-color": "black",
     				    "border-width": "1px"
     				});
				}
     		})
    	}
     	$(document).ready(function(e){
     		
     		getPosts(0)
     	})
     	
     	// It will hide the category drop down menu
     	
     	function closeDropdown() {
		    // Use jQuery to find the dropdown menu by its ID and hide it
		    $("#category-dropdown").toggle();
		}
    </script>
    
    
   </body>
</html>



 
       <!-- This is used to toggle the edit button in profile section
            it will interchange the profile and Edit details section.  -->
       
       
       
	   		<!-- let editStatus = false;
	   		
	   		$("#Profile-Modal").show()
	
	   		$("#edit-button").click(function()
	   		{
	   			alert("hello")
	   		}) 
       
       }); 
       
       
     
       
          $(document).ready(function(){
       	        		
        		let editStatus = false;
        		
        		$("#Profile-Modal").show()

        		$("#edit-button").click(function()
        		{

        		    alert("fine")
	        		if(editStatus == false){
	        			
	        			$("#profile-edit").show();
	        			$("#profile-detail").hide();
	        			
	        			$(this).text = "Back";
	        			
	        			editStatus = true;
	        		} 
	        		else {
	        			
	        			$("#profile-edit").hide();
	        			$("#profile-detail").show();
	        			
	        			$(this).text = "Edit";
	        			
	        			editStatus = false;
	        		}
        		
        	})
        });     
    
    </script>  -->