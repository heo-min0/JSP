<%@page import="calendar.CalendarDao"%>
<%@page import="calendar.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String seq = request.getParameter("seq");
boolean is = CalendarDao.getInstancs().delCalendarList(seq);
if(is){ %>
	<script type="text/javascript">
	alert("일정삭제 성공")
	location.href = "calendarlist.jsp";
	</script>
<%}else{%>
	<script type="text/javascript">
	alert("일정삭제 실패")
	location.href = "calendarlist.jsp";
	</script>
<%}%>