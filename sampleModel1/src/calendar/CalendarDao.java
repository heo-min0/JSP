package calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class CalendarDao {
	private static CalendarDao dao = new CalendarDao();
	
	private CalendarDao() {	}
	public static CalendarDao getInstancs() {
		return dao;
	}
	
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		
		String sql = "SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ " FROM (SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(RDATE, 1, 8)ORDER BY RDATE ASC) AS RNUM, "
				+ " SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ " FROM CALENDAR "
				+ " WHERE ID=? AND SUBSTR(RDATE, 1, 6)=?) "
				+ " WHERE RNUM BETWEEN 1 AND 5 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getCalendarList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, yyyyMM);
			System.out.println("2/4 getCalendarList " + id +yyyyMM);
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getCalendarList");
			
			while(rs.next()) {
				int i = 1;
				CalendarDto dto = new CalendarDto(
						rs.getInt(i++),	   //seq
						rs.getString(i++), //id
						rs.getString(i++), //title
						rs.getString(i++), //content
						rs.getString(i++), //rdate
						rs.getString(i++)  //wdate 
						);
				list.add(dto);
			}
			System.out.println("4/4 getCalendarList");
		}
		catch (SQLException e) {System.out.println("getCalendarList fail");e.printStackTrace();}
		finally { DBClose.Close(conn, psmt, rs);}
		return list;
	}
	
	public boolean addCalendar(CalendarDto cal) {
		
		String sql = " INSERT INTO CALENDAR(SEQ,ID,TITLE,CONTENT,RDATE,WDATE) "
				+ " VALUES(SEQ_CAL.NEXTVAL,?,?,?,?,SYSDATE) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addCalendar");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cal.getId());
			psmt.setString(2, cal.getTitle());
			psmt.setString(3, cal.getContent());
			psmt.setString(4, cal.getRdate());
			System.out.println("2/3 addCalendar :" + cal.getId() + cal.getTitle() + cal.getContent() + cal.getRdate());
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addCalendar");
		}
		catch (SQLException e) {System.out.println("addCalendar fail");e.printStackTrace();}
		finally { DBClose.Close(conn, psmt, null);}
		return count>0?true:false;
	}
	
	public CalendarDto getCalendarList(String seq) {
		String sql = "SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ " FROM CALENDAR WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CalendarDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 SEQ get");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(seq));
			System.out.println("2/4 SEQ get");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 SEQ get");
			
			while(rs.next()) {
				int i = 1;
				dto = new CalendarDto(
						rs.getInt(i++),	   //seq
						rs.getString(i++), //id
						rs.getString(i++), //title
						rs.getString(i++), //content
						rs.getString(i++), //rdate
						rs.getString(i++)  //wdate 
						);
			}
			System.out.println("4/4 SEQ get");
		}
		catch (SQLException e) {System.out.println("get SEQ fail");e.printStackTrace();}
		finally { DBClose.Close(conn, psmt, rs);}
		return dto;
	}
	
	public boolean delCalendarList(String seq) {
		String sql = "DELETE FROM CALENDAR WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 del cal");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(seq));
			System.out.println("2/4 del cal");
			
			count = psmt.executeUpdate();
			System.out.println("3/4 del cal");
		}
		catch (SQLException e) {System.out.println("get SEQ fail");e.printStackTrace();}
		finally { DBClose.Close(conn, psmt, null);}
		return count>0?true:false;
	}
	
	public boolean updateCalendar(String seq, CalendarDto cal) {
		String sql = " UPDATE CALENDAR SET "
				+ " TITLE=?, CONTENT=?, RDATE=?, WDATE=SYSDATE "
				+ " WHERE SEQ=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 updateCalendar");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cal.getTitle());
			psmt.setString(2, cal.getContent());
			psmt.setString(3, cal.getRdate());
			psmt.setInt(4, Integer.parseInt(seq));
			System.out.println("2/3 updateCalendar");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 updateCalendar");
		}
		catch (SQLException e) {System.out.println("updateCalendar fail");e.printStackTrace();}
		finally { DBClose.Close(conn, psmt, null);}
		return count>0?true:false;
	}
	
}
