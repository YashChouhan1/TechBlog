<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>



<div class="row">

	<% 
	    /**
	        This section will display posts by user choice, if no choice provided
	        then by default it will load all the posts in newest first order.    
	    **/
	    
	    Thread.sleep(200);
	
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
	
		ArrayList<Post> list = null;
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		if(cid == 0){
			list = dao.getAllPost();
		} 
		else {
			list = dao.getPostByCatID(cid);
		};
		
		if(list.size() == 0){
			out.println("<h4 class='display-4' style='text-align:center; padding:22%;'> No post in this category.</h4>"); 
		}
	    
	    for(Post p : list)
	    {				   				    	
	%>
		<div class="col-md-6 mb-2 " >
			<div class="card mr-3" style="width: 400px;">
			
			    <img class="card-img-top" src="BlogPic/<%= p.getpPic() %>" alt="Card image cap">
			    
			    <div class="card-body">			       
			       <b style="text-align: justify">   <%= p.getpTitle() %>   </b>
			       <p style="text-align: justify">   <%= p.getpContent() %> </p>			       
			    </div>
			    
			    <div class="card-footer primary-background">
			    
			       
			       
			       <% 
			       		LikeDao lao = new LikeDao(ConnectionProvider.getConnection());
			            User user = (User) session.getAttribute("currentUser");			  
			       %>
			       
			       <!-- Like button -->
			       <a href="#!"  onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>, 1)" class="btn btn-outline-success btn-sml ml-5"> <i class="fa fa-thumbs-up"></i> <span class="like-counter-<%= p.getPid() %>"> <%= lao.countLikeOnPost(p.getPid()) %></span> </a>
			       
			       <!-- here user redirected to another web-page whenever he clicks 'Read more..' button with postId using URL rewriting -->			      
			       <a href="show_blog_page.jsp?postId=<%= p.getPid() %>" class="btn btn-outline-warning btn-sml ml-4">Read more.</a>
			       
			       <!-- Comment button -->
			       <a href="#!" class="btn btn-outline-danger btn-sml ml-4" > <i class="fa fa-thumbs-down"></i> <span>0</span> </a>
			      
			    </div>			    
			</div>
		</div>
	<%
	    }
	%>
</div>

<script src="JS/newjs.js"></script>
