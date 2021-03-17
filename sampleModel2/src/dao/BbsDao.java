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
					+ " VALUES(SEQ_BBS.nextval,?, "
					+ " (SELECT NVL(MAX(REF), 0)+1 FROM BBS),0,0, "
					+ " ?,?,SYSDATE,0,0) ";
		
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
				+ " WHERE SEQ=?  ";
		
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
	
	public List<BbsDto> search(String sort, String ser) {
		String sql = "SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DELL, READCOUNT "
				+ " FROM BBS "
				+ " WHERE " + sort + " LIKE ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BbsDto> list = new ArrayList<BbsDto>();
		System.out.println("1/3 search");
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 search "+sort + ", " + ser);
			
			//psmt.setString(1, sort);
			psmt.setString(1, "%"+ser+"%");
			rs = psmt.executeQuery();
			System.out.println("3/3 search");
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
			System.out.println("4/3 search");
			
		} catch (SQLException e) {System.out.println("search fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		return list;
	}
	
	public boolean delBbs(String seq) {
		//String sql = "DELETE FROM BBS WHERE SEQ=? ";
		String sql = "UPDATE BBS SET DELL=1 WHERE SEQ=? ";
		
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
	
	public boolean setBbs(BbsDto dto, String seq) {
		String sql = "UPDATE BBS SET TITLE=?, CONTENT=? WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		System.out.println("1/2 setBbs");
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, Integer.parseInt(seq));
			count = psmt.executeUpdate();
			System.out.println("2/2 setBbs");
			
		} catch (SQLException e) {System.out.println("setBbs fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		return count>0?true:false;
	}
	
	public void readcount(int seq) {
		String sql = " UPDATE BBS "
					+ " SET READCOUNT=READCOUNT+1 "
					+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("1/6 readcount");
			psmt.setInt(1, seq);
			psmt.executeUpdate();
			System.out.println("2/6 readcount");
			
			
		} catch (SQLException e) {System.out.println("readcount fail");}
		finally {DBClose.Close(conn, psmt, null);	}
	}
						//부모글 번호      새로운답글
	public boolean answer(int seq, BbsDto bbs) {
		//update
		String sql1 = "UPDATE BBS SET STEP=STEP+1 "
				+ " WHERE REF=(SELECT REF FROM BBS WHERE SEQ=? )"
				+ " AND STEP>(SELECT STEP FROM BBS WHERE SEQ=? )";
		//insert
		String sql2 = "INSERT INTO BBS "
				+ " (SEQ,ID,REF,STEP,DEPTH,"
				+ "TITLE,CONTENT,WDATE,DELL,READCOUNT) "
				+ "VALUES(SEQ_BBS.NEXTVAL,?,"
				+ "(SELECT REF FROM BBS WHERE SEQ=?),"
				+ "(SELECT STEP FROM BBS WHERE SEQ=?)+1,"
				+ "(SELECT DEPTH FROM BBS WHERE SEQ=?)+1,"
				+ "?,?,SYSDATE,0,0) ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false); //자동 커밋 해체
			System.out.println("1/6 answer");
			
			//update 부터
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			count = psmt.executeUpdate();
			System.out.println("2/6 answer");
			
			psmt.clearParameters();//psmt 초기화
			System.out.println("3/6 answer");
			
			//다음 insert
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, bbs.getId());
			psmt.setInt(2, seq);
			psmt.setInt(3, seq);
			psmt.setInt(4, seq);
			psmt.setString(5, bbs.getTitle());
			psmt.setString(6, bbs.getContent());
			System.out.println("4/6 answer");
			
			count = psmt.executeUpdate();
			System.out.println("5/6 answer");
			
			conn.commit();
			System.out.println("6/6 answer");
			
		} catch (SQLException e) {
			System.out.println("answer fail");
			try {conn.rollback();
			} catch (SQLException e1) {e1.printStackTrace();}
		}
		finally {
			try {conn.setAutoCommit(true);
			} catch (SQLException e) {e.printStackTrace();}
			DBClose.Close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
}
