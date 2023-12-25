package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
   private static Connection con;
   
   public static Connection getConnection() {
	    
	   try {
		   
		   if(con == null) {
			   // Load driver class
			   Class.forName("com.mysql.jdbc.Driver");
			   
			   // Get database essentials
			   con = DriverManager
					   .getConnection("jdbc:mysql://localhost:3360/techblog", "root", "yash");
		   }
		   
	   } catch(Exception e) {
		   e.printStackTrace();
	   }
	   
	   return con;
   }
}
