<%@page import="calendar.CalendarDto"%>
<%@page import="calendar.CalendarDao"%>
<%@page import="util.UtilEx"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String hour = request.getParameter("hour");
String min = request.getParameter("min");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
 // rdate
String rdate = year + UtilEx.two(month) + UtilEx.two(day)
			+ UtilEx.two(hour) + UtilEx.two(min);
CalendarDao dao = CalendarDao.getInstancs();
boolean is = dao.addCalendar(new CalendarDto(id, title, content, rdate));
if(is){ %>
	<script type="text/javascript">
	alert("일정추가완료")
	location.href = "calendarlist.jsp";
	</script>
<%}else{%>
	<script type="text/javascript">
	alert("일정추가실패")
	location.href = "calendarlist.jsp";
	</script>
<%}%>


</body>
</html>
