<%@page import="dto.MemberDto"%>
<%@page import="calendar.CalendarDto"%>
<%@page import="calendar.CalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String seq = request.getParameter("seq");
CalendarDto dto = CalendarDao.getInstancs().getCalendarList(seq);
String date = dto.getRdate();
String rdate = String.format("%s년  %s월 %s일 %s시 %s분", date.substring(0, 4), date.substring(4, 6),
		date.substring(6, 8), date.substring(8, 10),date.substring(10, 12) );

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%MemberDto mem = (MemberDto)session.getAttribute("login");
if(mem == null){%>
<script> alert("로그인 해 주십시오."); location.href = "login.jsp"; </script>	
<%} session.setAttribute("mem", mem);%>

<h2>세부일정</h2>

<div align="center">
<form action="calupdate.jsp?seq=<%=seq %>" method="post">
<table border="1">
<col width="200"><col width="500">
<tr>
	<th>ID</th>
	<td>
		<%=mem.getId() %>
		<input type="hidden" name="id" value="<%=mem.getId() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="70" readonly="readonly" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
		<%=rdate %>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="60" name="content" readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="일정수정">
		<input type="button" onclick="location.href='caldell.jsp?seq=<%=seq %>'" value="일정삭제">
	</td>
</tr>
</table>

</form>
</div>


</body>
</html>