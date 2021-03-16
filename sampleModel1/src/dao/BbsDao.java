package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {
	private static BbsDao dao = new BbsDao(); 
	
	public BbsDao() {}
	
	public static BbsDao getInstancs() {
		return dao;
	}
	
	public List<BbsDto> getBbsList() {
		String sql = "SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DELL, READCOUNT "
				+ " FROM BBS "
				+ " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				BbsDto dto = new BbsDto( rs.getInt(1), // seq,
										 rs.getString(2), // id,
										 rs.getInt(3), //ref,
										 rs.getInt(4), //step,
										 rs.getInt(5), //depth,
										 rs.getString(6), //title,
										 rs.getString(7), //content,
										 rs.getString(8), //wdate,
										 rs.getInt(9), //del,
										 rs.getInt(10) ); //readcount
				list.add(dto);
			}
			System.out.println("4/4 getBbsList");
			
		} catch (SQLException e) {System.out.println("getBbsList fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		return list;
	}
	
	public boolean addBbs(BbsDto dto) {
		String sql = "INSERT INTO BBS (SEQ, ID, REF, STEP, DEPTH, TITLE, "
					+ "CONTENT, WDATE, DELL, READCOUNT ) "
					+ " VALUES(SEQ_BBS.nextval,?,0,0,0,?,?,'21/03/16',0,0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		System.out.println("1/3 addBbs success");
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			System.out.println("2/3 addBbs success");
			count = psmt.executeUpdate();
			System.out.println("3/3 addBbs success");
		} catch (SQLException e) {System.out.println("addBbs fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		return count>0?true:false;
	}
	
	public BbsDto getBbsseq(String seq) {
		String sql = "SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DELL, READCOUNT "
				+ " FROM BBS "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BbsDto dto = null;
		System.out.println("1/3 getBbsseq");
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(seq));
			rs = psmt.executeQuery();
			System.out.println("2/3 getBbsseq");
			while (rs.next()) {
				dto = new BbsDto( rs.getInt(1), // seq,
					 			  rs.getString(2), // id,
								  rs.getInt(3), //ref,
								  rs.getInt(4), //step,
								  rs.getInt(5), //depth,
								  rs.getString(6), //title,
								  rs.getString(7), //content,
								  rs.getString(8), //wdate,
								  rs.getInt(9), //del,
								  rs.getInt(10) ); //readcount
			}
			System.out.println("3/3 getBbsseq");
			
		} catch (SQLException e) {System.out.println("getBbsseq fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		return dto;
	}
	
	public boolean delBbs(String seq) {
		String sql = "DELETE FROM BBS WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(seq));
			count = psmt.executeUpdate();
			System.out.println("1/1 delBbs");
			
		} catch (SQLException e) {System.out.println("delBbs fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		return count>0?true:false;
	}
}
