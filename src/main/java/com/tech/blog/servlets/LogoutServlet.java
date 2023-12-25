package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;


@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){
			
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet S1</title>");
			out.println("</head>");
			out.println("<body>");
			
			// First of all get the session object
			HttpSession session = request.getSession();
			
			// Remove current user from the session for logout process
			session.removeAttribute("user");
			
			// Deliver a message for successful logout in upcoming page
			Message message = new Message("User successfully logged out.", "success", "alert-success");
			session.setAttribute("msg", message);
			
			response.sendRedirect("login.jsp");
			
		    			
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
