package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tech.blog.entities.User;

public class UserDao {
	
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
 
	//method to insert user data into database.
	public boolean saveUser(User user) {

        boolean isDataSaved = false;
		try {
			
			String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
	        PreparedStatement stmt = this.con.prepareStatement(query);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getGender());
			stmt.setString(5, user.getAbout());
			
			stmt.executeUpdate();
			
			isDataSaved = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDataSaved;
	}
	
	public User getUserEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
		
			String query = "select * from user where email = ? and password = ?";
		
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				
				user = new User();
				
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setAbout(set.getString("about"));
				user.setGender(set.getString("gender"));
				user.setProfile(set.getString("profile"));
				user.setDateTime(set.getTimestamp("rdate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public User getUserByUserID(int userId) {
		User user = null;
		
		try {
		
			String query = "select * from user where id = ?";
		
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
						
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				
				user = new User();
				
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setAbout(set.getString("about"));
				user.setGender(set.getString("gender"));
				user.setProfile(set.getString("profile"));
				user.setDateTime(set.getTimestamp("rdate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	//method to update user data into database.
	public boolean updateUser(User user) {

	        boolean isDataUpdated = false;
			try {
				
				String query = "Update user set name = ?, email = ?, password = ?, gender = ?, about = ?, profile = ? where id = ?";
		        PreparedStatement stmt = this.con.prepareStatement(query);
		        
				stmt.setString(1, user.getName());
				stmt.setString(2, user.getEmail());
				stmt.setString(3, user.getPassword());
				stmt.setString(4, user.getGender());
				stmt.setString(5, user.getAbout());
				stmt.setString(6, user.getProfile());
				stmt.setInt   (7 , user.getId());				
				
				stmt.executeUpdate();
				
				isDataUpdated = true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return isDataUpdated;
		}

}
