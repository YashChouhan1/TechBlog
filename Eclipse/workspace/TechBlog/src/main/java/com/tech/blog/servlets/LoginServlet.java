package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){
			
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet S1</title>");
			out.println("</head>");
			out.println("<body>");
			
			// GET Parameters
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User user = dao.getUserEmailAndPassword(userEmail, userPassword);
			
			if(user == null) {
				
				// No user found.
				// This will show error message of invalid details.
				
				Message msg = new Message("Invalid email or password!", "error", "alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				
				response.sendRedirect("login.jsp");
				
			} else {
				
				//User found.
				// This will redirect it to User Profile.
				
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
			
			
		
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
