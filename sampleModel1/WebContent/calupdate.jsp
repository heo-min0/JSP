<%@page import="util.UtilEx"%>
<%@page import="java.util.Calendar"%>
<%@page import="calendar.CalendarDao"%>
<%@page import="calendar.CalendarDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String seq = request.getParameter("seq");
CalendarDto dto = CalendarDao.getInstancs().getCalendarList(seq);
System.out.println(dto.getRdate());
String year = dto.getRdate().substring(0, 4);
String month = dto.getRdate().substring(4, 6);
String day = dto.getRdate().substring(6, 8);
String hour = dto.getRdate().substring(8, 10);
String min = dto.getRdate().substring(10, 12);
Calendar cal = Calendar.getInstance();
cal.set(Calendar.YEAR, Integer.parseInt(year));
cal.set(Calendar.MONTH, Integer.parseInt(month)-1);
cal.set(Calendar.DATE, Integer.parseInt(day));
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
<form action="calupdateAF.jsp?seq=<%=seq %>" method="post">
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
		<input type="text" name="title" size="70" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<th>일정</th>
	<td>
	<select name="year">
		<% int tyear = Integer.parseInt(year);%>
		<% for(int i=tyear-5;i<=tyear+5;i++){ %>
			<option <%= year.equals(i+"")?"selected='selected'":"" %>>
				<%=i %>
			</option>
		<% } %>
		</select>년
		
		<select name="month">
		<% for(int i=1;i<=12;i++){ %>
			<option <%= month.equals(UtilEx.two(i+""))?"selected='selected'":"" %>>
				<%=i %>
			</option>
		<% } %>
		</select>월
		
		<select name="day">
		<% for(int i=1;i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH);i++){ %>
			<option <%=day.equals(UtilEx.two(i+""))?"selected='selected'":"" %>>
				<%=i %>
			</option>
		<% } %>
		</select>일
		
		<select name="hour">
		<% for(int i=1;i<24;i++){ %>
			<option <%= hour.equals(i+"")?"selected='selected'":"" %>>
				<%=i %>
			</option>
		<% } %>
		</select>시
		
		<select name="min">
		<% for(int i=1;i<60;i++){ %>
			<option <%= min.equals(i+"")?"selected='selected'":"" %>>
				<%=i %>
			</option>
		<% } %>
		</select>분
		</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="60" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="수정완료">
	</td>
</tr>
</table>

</form>
</div>


</body>
</html>