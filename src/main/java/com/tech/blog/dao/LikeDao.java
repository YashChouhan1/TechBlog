package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.helper.ConnectionProvider;

public class LikeDao {
	
	Connection con;
	
	public LikeDao(Connection con) {
		this.con = con;
	}
	
	// This function aims to update each like on post in Liked table in DB.
	public boolean insertLike(int pid, int uid) {
		
		boolean isLikeInserted = false;
		
		LikeDao lao = new LikeDao(ConnectionProvider.getConnection());
		
		try {						
			//If user not liked the post
			if(!lao.isLikedByUser(pid, uid)) {
				
				String query = "Insert into liked(pid, uid) values (?,?)";
				PreparedStatement stmt = this.con.prepareStatement(query);
				
				stmt.setInt(1, pid);
				stmt.setInt(2, uid);
				
				stmt.executeUpdate();
				
				isLikeInserted = true; 
				
			} else {
				// If already liked the post then dislike it;				
				lao.deleteLike(pid, uid);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isLikeInserted;
	}
	
	//This function aims to return likes of any particular post using its pid;
	public int countLikeOnPost(int pid) {
		
		int count = 0;
		
		try {
			
			String query = "select count(*) from liked where pid = ?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			
			stmt.setInt(1, pid);
			
			ResultSet set = stmt.executeQuery();
			
			if(set.next()) {		
				count = set.getInt("count(*)");
			}
					
		} catch( Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// This function checks whether user liked the given post or not
	public boolean isLikedByUser(int pid, int uid) {
		
		boolean isLiked = false;
		
		try {
			
			String query = "Select * from liked where pid = ? and uid = ?";
			PreparedStatement stmt = this.con.prepareStatement(query);
			
			stmt.setInt(1, pid);
			stmt.setInt(2, uid);
			
            ResultSet set = stmt.executeQuery();
			
			if(set.next()) {		
				isLiked = true; 
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isLiked;
	}
	
	// This function disliked the liked post by deleting that like from the Liked Table
	public boolean deleteLike(int pid, int uid) {
			
			boolean isDisLiked = false;
			
			try {
				
				String query = "Delete  from liked where pid = ? and uid = ?";
				PreparedStatement stmt = this.con.prepareStatement(query);
				
				stmt.setInt(1, pid);
				stmt.setInt(2, uid);
				
				stmt.executeUpdate();
				
				isDisLiked = true;		
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return isDisLiked;
		}

}
