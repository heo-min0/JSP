package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import calendar.CalendarDto;
import db.DBClose;
import db.DBConnection;
import dto.PdsDto;

public class PdsDao {
	private static PdsDao dao = new PdsDao();
	private PdsDao() {}
	public static PdsDao getInstance() {return dao;}
	
	public List<PdsDto> getPdsList() {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT,"
				+ " FILENAME, ORIFILENAME, READCOUNT, DOWNCOUNT, REGDATE"
				+ " FROM PDS "
				+ " ORDER BY SEQ DESC "; //+ " ORDER BY REF DESC STEP ASC "
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PdsDto> list = new ArrayList<PdsDto>();
		System.out.println("1/4 getPdsList");
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getPdsList");
			rs = psmt.executeQuery();
			System.out.println("3/4 getPdsList");
			while(rs.next()) {
				int i = 1;
				PdsDto dto = new PdsDto(rs.getInt(i++),		//seq
										rs.getString(i++),  //id
										rs.getString(i++),  //title
										rs.getString(i++),  //content
										rs.getString(i++),  //filename
										rs.getString(i++),  //orifilename
										rs.getInt(i++), 	//readcount
										rs.getInt(i++), 	//downcount
										rs.getString(i++)); //regdate
				list.add(dto);
			}
			System.out.println("4/4 getPdsList");
		}
		catch (SQLException e) {System.out.println("fail getPdsList");}
		finally { DBClose.Close(conn, psmt, rs);}
		return list;
	}
	
	public boolean writePds(PdsDto pds) {
		String sql = " INSERT INTO PDS(SEQ,ID,TITLE,CONTENT,FILENAME,ORIFILENAME, "
				+ " READCOUNT, DOWNCOUNT, REGDATE) "
				+ " VALUES(SEQ_PDS.NEXTVAL,?,?,?,?,?, "
				+ " 0, 0, SYSDATE)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 writePds");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getId());
			psmt.setString(2, pds.getTitle());
			psmt.setString(3, pds.getContent());
			psmt.setString(4, pds.getFilename());
			psmt.setString(5, pds.getOriFilename());
			System.out.println("2/3 writePds");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 writePds");
			
		}catch (SQLException e) {System.out.println("fail writePds");}
		finally { DBClose.Close(conn, psmt, null);}
		return count>0?true:false;
	}
	
	public PdsDto getPdsDto(int seq) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT,"
				+ " FILENAME, ORIFILENAME, READCOUNT, DOWNCOUNT, REGDATE"
				+ " FROM PDS "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PdsDto dto = new PdsDto();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("1/3 getPdsDto");
			
			rs = psmt.executeQuery();
			System.out.println("2/4 getPdsDto");
			while(rs.next()) {
				int i = 1;
				dto = new PdsDto(rs.getInt(i++),		//seq
										rs.getString(i++),  //id
										rs.getString(i++),  //title
										rs.getString(i++),  //content
										rs.getString(i++),  //filename
										rs.getString(i++),  //orifilename
										rs.getInt(i++), 	//readcount
										rs.getInt(i++), 	//downcount
										rs.getString(i++)); //regdate
			}
			System.out.println("3/3 getPdsDto");
		}
		catch (SQLException e) {System.out.println("fail getPdsDto");}
		finally { DBClose.Close(conn, psmt, rs);}
		return dto;
	}
	
	public boolean counter(int seq, String t) {
		String sql = "";
		if(t.equals("readcount")) {
			sql = " UPDATE PDS SET READCOUNT=READCOUNT+1 WHERE SEQ=? ";
		}
		if(t.equals("downcount")) {
			sql = " UPDATE PDS SET DOWNCOUNT=DOWNCOUNT+1 WHERE SEQ=? ";
		}
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("1/2 counter");
			
			count = psmt.executeUpdate();
			System.out.println("2/2 counter");
			
		}catch (SQLException e) {System.out.println("fail counter");}
		finally { DBClose.Close(conn, psmt, null);}
		return count>0?true:false;
	}
	
	public boolean updatePds(PdsDto pds, String seq) {
		String sql = " UPDATE PDS SET REGDATE=SYDATE, TITLE=?, CONTENT=?, ";
		if(pds.getOriFilename()!="") {
			sql += " FILENAME=?, ORIFILENAME=? ";
		}
		sql += " WHERE SEQ=? ";
		System.out.println("ori:"+pds.getOriFilename() +", " + pds.getFilename());
		System.out.println("up sql:"+sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 updatePds");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getTitle());
			psmt.setString(2, pds.getContent());
			if(pds.getOriFilename()!="") {
				psmt.setString(3, pds.getFilename());
				psmt.setString(4, pds.getOriFilename());
			}
			System.out.println("2/3 updatePds");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 updatePds");
			
		}catch (SQLException e) {System.out.println("fail updatePds");}
		finally { DBClose.Close(conn, psmt, null);}
		return count>0?true:false;
	}
	
}
