package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
/*
 * To get all the categories from Category table in database.
 * 
 * */
public class PostDao {
	
	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	//To get all categories from database.
	public ArrayList<Category> getCategories(){
		
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			String query = "Select * from category";
			Statement stmt = this.con.createStatement();
			ResultSet set = stmt.executeQuery(query);
			
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				
				Category c = new Category(cid, name, description);
				list.add(c);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	//method to insert user data into database.
	public boolean savePost(Post post) {

	        boolean isPostSaved = false;
			try {
				
				String query = "insert into post(pTitle, pContent, pCode, pPic, catId, userId) values (?,?,?,?,?,?)";
		        PreparedStatement stmt = this.con.prepareStatement(query);
				stmt.setString(1, post.getpTitle());
				stmt.setString(2, post.getpContent());
				stmt.setString(3, post.getpCode());
				stmt.setString(4, post.getpPic());
				stmt.setInt(5, post.getCatId());
				stmt.setInt(6, post.getUserId());
				
				stmt.executeUpdate();
				
				isPostSaved = true;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return isPostSaved;
		}
	
	//To get all p from database.
	public ArrayList<Post> getAllPost(){
		
		ArrayList<Post> list = new ArrayList<>();
		
		try {
			
			PreparedStatement stmt = this.con.prepareStatement("select * from post order by pid");
			
			ResultSet set = stmt.executeQuery();
			
			while(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				
				Post post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
				
				list.add(post);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//To get the post by there category id.
	public ArrayList<Post> getPostByCatID(int catId){
		
		ArrayList<Post> list = new ArrayList<>();
		
		try {
			
            PreparedStatement stmt = this.con.prepareStatement("select * from post where catId = ?");
            stmt.setInt(1, catId);
			
			ResultSet set = stmt.executeQuery();
			
			while(set.next()) {
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				
				Post post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);
				
				list.add(post);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//To get the post by there post id.
	public Post getPostByPostID(int postId) {
		Post post =  null;
		
		try {
			
			String query = "select * from post where pid = ?";			
			PreparedStatement stmt = this.con.prepareStatement(query);
			
			stmt.setInt(1, postId);
			
			ResultSet set = stmt.executeQuery();
			
			while(set.next()) {
				
				post = new Post();
				
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				int catId = set.getInt("catId");
				
				post = new Post(pid,pTitle,pContent,pCode,pPic,pDate,catId,userId);				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
}
