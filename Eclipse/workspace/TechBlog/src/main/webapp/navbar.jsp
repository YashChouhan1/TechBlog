<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="com.tech.blog.entities.User" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="java.util.*" %>




<nav class="navbar navbar-expand-lg navbar-dark primary-background">

  <a class="navbar-brand" href="index.jsp"><span class="fa fa-desktop"></span> TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="fa fa-file-code-o"></span> Code with Yash <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-navicon"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        
        		<%
        		
        			PostDao dao = new PostDao(ConnectionProvider.getConnection());
        			ArrayList<Category> list = dao.getCategories();
        			
        			for(Category cat : list){
				    	 
				    	 %>
				    	 	  <a href="#" onclick = "redirectToLoginIfUserNotFound()" class="dropdown-item"><%= cat.getName() %></a>
				    	 <%
				    	 
				     } 		        		      		
        		        		
        		%>
                  
		          <div class="dropdown-divider" ></div>
		             <a class="dropdown-item" onclick = "redirectToLoginIfUserNotFound()" href="#">Other..</a>
         </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="register.jsp"><span class="fa fa-user-plus"></span> Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.jsp"><span class="fa fa-user-circle-o"></span> Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="resume.html"><span class="fa fa-vcard-o"></span> About Us</a>
      </li>
    </ul>
    
    <form class="form-inline my-2 my-lg-0">s
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Search</button>
    </form>
    
  </div>
</nav>


<script type="text/javascript">
    	
    function redirectToLoginIfUserNotFound() {
        // Check if the User object is stored in the session (you can use any appropriate key)
        var user = sessionStorage.getItem("currentUser"); // Change "user" to the appropriate key

        // If the User object is not found, redirect to the login page
        if (!user) {
            window.location.href = "login.jsp"; // Replace with the URL of your login page
        }
    }

</script>