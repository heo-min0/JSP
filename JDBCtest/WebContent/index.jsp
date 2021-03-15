<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HR Tables</h1>

<pre>
SELECT * FROM TAB
모든 테이블 목록 출력
</pre>
<%!
public boolean has$(String msg){ //테이블명에 $문자가 포함되어 있는지 조사
	return msg.contains("$");
}
%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "hr";

Connection conn = DriverManager.getConnection(url, user, password);
String sql = "SELECT * FROM TAB";
PreparedStatement psmt = conn.prepareStatement(sql);
ResultSet rs = psmt.executeQuery();
ResultSetMetaData rsmd = rs.getMetaData(); // 컬럼의 정보
int count = rsmd.getColumnCount(); //컬럼의 수
%>

<table border="1">
<tr>
	<%for(int i = 1;i<count + 1;i++){%>
		<td><%=rsmd.getColumnName(i)%></td>
	<%}%>
</tr>

<%while(rs.next()){%>
<tr>
	<%for(int i = 1;i<count + 1;i++){
		String cols = rs.getString(i);
		if(i==1 && has$(cols)==false){%>
	<td>
		<a href="table.jsp?tname=<%=cols %>"><%=cols %></a>
	</td>
	<%}else{%>
	<td>
		<%=rs.getString(i)%>
	</td>
	<%}
	}%>
</tr>
<%}%>
</table>

<%  if(rs != null) rs.close();
	if(psmt != null) psmt.close();
	if(conn != null) conn.close(); %>


</body>
</html>





