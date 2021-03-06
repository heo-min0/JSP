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
				+ " WHERE " + sort + " LIKE ? AND DELL=0 ";
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
						//????????? ??????      ???????????????
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
			conn.setAutoCommit(false); //?????? ?????? ??????
			System.out.println("1/6 answer");
			
			//update ??????
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			count = psmt.executeUpdate();
			System.out.println("2/6 answer");
			
			psmt.clearParameters();//psmt ?????????
			System.out.println("3/6 answer");
			
			//?????? insert
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
	
	public int getAllBbs(String choice, String search) {
		String sql = "SELECT COUNT(*) FROM BBS ";
				
		String sql1 = "";
		if(choice.equals("title")) {
			sql1 = "WHERE TITLE LIKE '%"+search+"%' AND DELL=0 ";
		}else if(choice.equals("content")) {
			sql1 = "WHERE CONTENT LIKE '%"+search+"%' AND DELL=0 ";
		}else if(choice.equals("id")) {
			sql1 = "WHERE ID='"+search+"' AND DELL=0 ";
		}
		sql = sql+sql1+" ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				len = rs.getInt(1);
			}
			
		} catch (SQLException e) {System.out.println("getAllBbs fail");}
		finally {DBClose.Close(conn, psmt, rs);	}
		int slen = len/10;
		if(len%10 > 0) slen += 1; 
		return slen;
	}
	
	public List<BbsDto> getBbsPagingList(String choice, String search, int page) {
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, DELL, READCOUNT "
					+ " FROM ";
		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM, " + 
			   " SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DELL, READCOUNT " + 
			   " FROM BBS ";
				
		String sWord = "";
		if(choice.equals("title")) {
			sWord = " WHERE TITLE LIKE '%" + search + "%' AND DELL=0 ";
		}else if(choice.equals("content")) {
			sWord = " WHERE CONTENT LIKE '%" + search + "%' AND DELL=0 ";
		}else if(choice.equals("id")) {
			sWord = " WHERE ID='" + search + "' AND DELL=0 ";
		} 
		sql += sWord + " ORDER BY REF DESC, STEP ASC) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";
		
		int start = 10*page + 1;
		int end = 10*page + 10;		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbsPagingList success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("2/4 getBbsPagingList success");
			
			rs = psmt.executeQuery();			
			System.out.println("3/4 getBbsPagingList success");
			
			while(rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getInt(3), 
										rs.getInt(4), 
										rs.getInt(5), 
										rs.getString(6), 
										rs.getString(7), 
										rs.getString(8), 
										rs.getInt(9), 
										rs.getInt(10));
				list.add(dto);
			}			
			System.out.println("4/4 getBbsPagingList success");
		}
		catch (SQLException e) { System.out.println("getBbsPagingList fail");}
		finally { DBClose.Close(conn, psmt, rs); }
		return list;
	}
}
