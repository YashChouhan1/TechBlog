package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){
			
			int cid = Integer.parseInt(request.getParameter("cid"));
			String title = request.getParameter("pTitle");
			String content = request.getParameter("pContent");
			String code = request.getParameter("pCode");
			Part part = request.getPart("pic");
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentUser");
			
			Post post = new Post(title, content, code, part.getSubmittedFileName(),cid, user.getId());
		    PostDao pod = new PostDao(ConnectionProvider.getConnection());
		    
		    if(pod.savePost(post)) {
		    	
				String path = request.getRealPath("/") + "BlogPic" + File.separator + part.getSubmittedFileName();
				Helper.saveFile(part.getInputStream(), path);
				
		    	out.print("done");
		    } else {
		    	out.print("post not saved");
		    }
					
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request,response);
	}
	
}
