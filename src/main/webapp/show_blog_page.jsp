<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>
<%@ page import="com.tech.blog.dao.UserDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Post" %>
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

<% 

    int postId = Integer.parseInt(request.getParameter("postId"));

	//To get the post details
  	PostDao pod = new PostDao(ConnectionProvider.getConnection());	
	Post post = pod.getPostByPostID(postId);	
	int userId_Of_userWhoPosted = post.getUserId();
	
	//To get the user of particular post by its userId 
	UserDao uod = new UserDao(ConnectionProvider.getConnection());
	User userWhoPosted = uod.getUserByUserID(userId_Of_userWhoPosted);

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="ISO-8859-1">
	<title><%= post.getpTitle() %></title>

<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
	  .banner_background{
	      clip-path: polygon(0 0, 100% 0, 100% 92%, 69% 100%, 32% 93%, 0 100%);
	  }
	  .card-title{
	  	  font-weight: 250;
	  	  font-size: 35px;	  	  
	  }
	  .card-content{
	  	  font-weight: 470;
	  	  font-size: 17px;	 
	  	  font-family: inherit; 	  
	  }
	  .card-code{
	  	  font-weight: 250;
	  	  font-size: 17px;	  	  
	  }
	  .when-posted{
	  	  font-style: italic;
	  	  font-weight: bold;	  
	  	  	  
	  }
	  .who-posted{
	  	  font-size: 30px;
	  }
	  
	  body{
	  	background: url(Images/bg4.png);
	  	background-size: cover;
	  	background-attachment: fixed;
	  }
	  
	  .footer {
            background-color: #333; /* Background color for the footer */
            color: #fff; /* Text color for the footer */
            padding: 15px; /* Padding for spacing */
            text-align: center; /* Center-align text within the footer */
       }
	  
	</style>
	
	<!-- Facebook comment plugin -->
	<div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v18.0" nonce="Av2C1b6d"></script>

</head>
<body>
	
	 
  <!-- Start of navbar -->
	  
	  <nav class="navbar navbar-expand-lg navbar-dark primary-background">
	  <a class="navbar-brand" href="index.jsp"><span class="fa fa-desktop"></span> TechBlog</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="profile.jsp"><span class="fa fa-file-code-o"></span> Code with Yash <span class="sr-only">(current)</span></a>
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
    
    <!-- start of full Post Modal -->
    <div class="container">
    	<div class="row my-4">
    		<div class="col-md-8 offset-md-2">
    			<div class="card">
    			
    				<div class="card-header text-center">
    				    					
    					<h4 class="card-title"><b style="text-align: center; color: black;"> <%= post.getpTitle() %></b></h4>    					
   				    </div>
   				    
   				    <div class="card-body my-2">
   				    
   				    	<img class="card-img-top" src="BlogPic/<%= post.getpPic() %>" alt="Card image cap">
   				        <br>
   				        
   				        <div class="row my-4">
   				        	<div class="col-md-8">
   				        		<p class="who_posted"><a href="#!"><b> <%= userWhoPosted.getName() %> </b></a> has posted :</p>
   				            </div>
   				            <div class="col-md-4">
   				         		<h6>Posted on: <p class="when-posted"> <%= post.getpDate().toLocaleString() %> </p></h6>
   				            </div>
   				        </div>
   				        
                        <p class="card-content" style="text-align: justify;"> <%= post.getpContent() %></p>
                        <hr>
                        <div class="card-code">
                            <h5>Code :</h5>
                        	<pre  style="text-align: justify;"> <%= post.getpCode() %></pre>          
                        </div>              
   				    </div>
   				    
   				    <div class="card-footer primary-background">
   				        
   				        <% LikeDao lao = new LikeDao(ConnectionProvider.getConnection()); %>
   				        <div style="text-align: right;">
   				    	<!-- Like and Comment button -->
				        <a href="#!" onclick="doLike(<%= post.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-success btn-sml"> <i class="fa fa-thumbs-up"></i> <span class="like-counter-<%= post.getPid() %>"><%= lao.countLikeOnPost(post.getPid()) %></span> </a>
				        <a href="#!" onclick="doDislike(<%= post.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-danger btn-sml ml-2" > <i class="fa fa-thumbs-down"></i> <span>0</span> </a>				      
   				        </div>
   				    </div>
   				    
   				    <div class="card-footer">		        
   				        <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog_page.jsp?postId=<%= post.getPid() %>" data-width="" data-numposts="9"></div>
   				    </div>
   				</div>
            </div>
        </div>
    </div>
	
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
    <script src="JS/newjs.js"></script>
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
	

</body>
</html>