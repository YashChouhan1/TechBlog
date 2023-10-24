package com.tech.blog.servlets;

import java.io.PrintWriter;
import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
@SuppressWarnings("serial")
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	@SuppressWarnings("deprecation")
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){
			
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet S1</title>");
			out.println("</head>");
			out.println("<body>");
			
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userAbout = request.getParameter("user_about");
			String userPassword = request.getParameter("user_password");
			Part   userImage = request.getPart("user_image");
			
			String imageName = userImage.getSubmittedFileName();
			
			//Get the user from session
			//Update its details.
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("currentUser");
			
			user.setName(userName);
			user.setEmail(userEmail);
			user.setPassword(userPassword);
			user.setAbout(userAbout);
			
			String oldProfile = user.getProfile();
			user.setProfile(imageName);
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			boolean userUpadeted = dao.updateUser(user);
			
			if(userUpadeted) {
				out.println("User Updated Successfully.");
				
				String path = request.getRealPath("/") + "ProfilePic" + File.separator + user.getProfile();
				
				//Only delete old profile if it is other that default profile.
				
				String oldFilePath = request.getRealPath("/") + "ProfilePic" + File.separator + oldProfile;

				if(oldProfile.equals("default.png")) {
					Helper.deleteFile(oldFilePath);
				}
				
				if(Helper.saveFile(userImage.getInputStream(), path)) {
					
					out.println("<br> Profile Updated.");
					
					Message msg = new Message("Profile Updated Successfully.", "success", "alert-success");					
					session.setAttribute("msg", msg);
					
				}else {
					// If not found any picture.
					
					out.println("Profile Updated but no profile picture found. Please insert photo to update profile picture.");		
					
					Message msg = new Message("Profile Updated Successfully.", "success", "alert-success");
					session.setAttribute("msg", msg);
				}
			} else {
				
				out.print("User not Updated!!");
				
				Message msg = new Message("Profile Not Updated!!", "error", "alert-danger");
				session.setAttribute("msg", msg);
			}
			
			response.sendRedirect("profile.jsp");
						
			out.println("</body>");
			out.println("</html>");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    processRequest(request,response);
	}
	
}
