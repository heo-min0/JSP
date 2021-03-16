package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {
	private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {
		return dao;
	}
	
	public boolean addMember(MemberDto dto) {
		
		String sql = "INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH) "
				   + " VALUES(?,?,?,?,3) ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addMember success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 addMember success");
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addMember success");
		}
		catch (SQLException e) {System.out.println("addMember fail");}
		finally {DBClose.Close(conn, psmt, null);}
		
		return count>0?true:false;
	}
	
	public boolean getID(String id) {
		String sql = "SELECT ID FROM MEMBER WHERE ID=?";
		//String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID = '?'";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String tid = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getID success");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			System.out.println("2/3 getID success");
			rs = psmt.executeQuery();
			System.out.println("3/3 getID success");
			
			if(rs.next()) {
				tid = rs.getString("ID");
				System.out.println("4/3 getID success");
			}
		}
		catch (SQLException e) {System.out.println("getID fail");}
		finally {DBClose.Close(conn, psmt, null);}
		System.out.println(id + ", "+tid);
		return id.equals(tid);
	}
	
	public boolean getPwd(String id, String pwd) {
		String sql = "SELECT ID, PWD FROM MEMBER WHERE ID=?";
		//String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID = '?'";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String lid = null;
		String lpw = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getPwd success");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			System.out.println("2/3 getPwd success");
			rs = psmt.executeQuery();
			System.out.println("3/3 getPwd success");
			
			if(rs.next()) {
				lid = rs.getString("ID");
				lpw = rs.getString("PWD");
				System.out.println("4/3 getPwd success");
			}
		}
		catch (SQLException e) {System.out.println("getPwd fail");}
		finally {DBClose.Close(conn, psmt, null);}
		
		System.out.println(id + ", "+lid + ", "+lpw);
		boolean b = false;
		if(id.equals(lid) && pwd.equals(lpw)) {	b=true;	}
		return b;
	}
}
