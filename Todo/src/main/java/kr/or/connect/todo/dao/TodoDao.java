package kr.or.connect.todo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.connect.todo.dto.TodoDto;

public class TodoDao {

	private static String dburl = "jdbc:mysql://localhost:3306/connectdb?serverTimezone=UTC";
	private static String dbuser = "connectuser";
	private static String dbpasswd = "connect123!@#";
	
	public int addToDo(TodoDto list) {
		int insertCount = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		String sql = "INSERT INTO todo (id, title, name, sequence, type, regdata) VALUES (?,?,?,?,?,?)";
		
		try(Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setLong(1, list.getId());
			ps.setString(2, list.getTitle());
			ps.setString(3, list.getName());
			ps.setInt(4, list.getSequence());
			ps.setString(5, list.getType());
			ps.setString(6, list.getRegDate());
			
			insertCount = ps.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return insertCount;
	}
	
	public List<TodoDto> getToDos() {
		List<TodoDto> list = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String sql = "select id, title, name, sequence, type, regdate from todo order by regdate desc";
		try(
				Connection conn = DriverManager.getConnection(dburl,dbuser,dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)){
			try(ResultSet rs = ps.executeQuery()){
				while(rs.next()) {
					long id = rs.getLong("id");
					String title = rs.getString("title");
					String name = rs.getString(3);
					int sequence = rs.getInt(4);
					String type = rs.getString(5);
					String regdate = rs.getString(6);
					TodoDto todo = new TodoDto(id, title, name, sequence, type, regdate);
					list.add(todo);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
			return list;
	}


	public int deleteToDo(long id) {
		int deleteCount = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection ( dburl, dbuser, dbpasswd );
			String sql = "DELETE FROM todo WHERE id = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setLong(1, id);
	
			deleteCount = ps.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				}catch(Exception ex) {}
			} // if
			
			if(conn != null) {
				try {
					conn.close();
				}catch(Exception ex) {}
			} // if
		} // finally

		return deleteCount;
	}
	
	public int updateRole(TodoDto list) {
		int updateCount = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection ( dburl, dbuser, dbpasswd );
			
			String sql = "update todo set type = ? where id = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, list.getType());
			ps.setLong(2,  list.getId());
			
			updateCount = ps.executeUpdate();

		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(ps != null) {
				try {
					ps.close();
				}catch(Exception ex) {}
			} // if
			
			if(conn != null) {
				try {
					conn.close();
				}catch(Exception ex) {}
			} // if
		} // finally
		
		return updateCount;
	}

}