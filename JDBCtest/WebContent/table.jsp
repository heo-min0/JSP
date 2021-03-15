<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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

<h1>HR Table</h1>

<pre>
SELECT * FROM TABLE
넘어 온 테이블의 데이터를 출력한다.
</pre>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "hr";

Connection conn = DriverManager.getConnection(url, user, password);

String tname = request.getParameter("tname");
String sql = "SELECT * FROM " + tname;
PreparedStatement psmt = conn.prepareStatement(sql);
ResultSet rs = psmt.executeQuery();
ResultSetMetaData rsmd = rs.getMetaData();
int count = rsmd.getColumnCount();
%>

<table border="1">
<tr>

<%for(int i = 1; i < count +1;i++){%>
	<td><%=rsmd.getColumnName(i)%></td>
<%} %>

</tr>

<%while(rs.next()){ %>
	<tr>
	<%for(int i = 1; i<count+1; i++){	%>
		<td><%=rs.getString(i) %></td>
	<%}	%>
	</tr>
<%}%>




</table>

<%
if(rs != null) rs.close();
if(psmt != null) psmt.close();
if(conn != null) conn.close(); %>


</body>
</html>





