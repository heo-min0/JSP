<%@page import="java.util.List"%>
<%@page import="calendar.CalendarDao"%>
<%@page import="calendar.CalendarDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%MemberDto mem = (MemberDto)session.getAttribute("login");
if(mem == null){%>
	<script>alert("로그인 해 주십시오.");location.href = "login.jsp";</script>	
<%}%>

<%
request.setCharacterEncoding("utf-8");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String rdate = year + month + day;
List<CalendarDto> list = CalendarDao.getInstancs().getCalendarList(mem.getId(), rdate);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<tr>
	<th>번호</th><th>제목</th><th>일정</th>
</tr>

<%if(list == null || list.size() == 0){%>
<tr>
	<td colspan="3">작성된 글이 없습니다.</td>
</tr>
<%}else{
	for(int i = 0;i<list.size();i++){%>
		<%CalendarDto cal = list.get(i); %>
		<tr>
			<th><%=i+1 %></th>
			
			<td>
				<a href="bbsdetail.jsp?seq=<%=cal.getSeq() %>">
				<%=cal.getTitle() %>
				</a>
			</td>

			<td><%=cal.getId() %></td>
		</tr>
<%}}%>
</table>

</body>
</html>




