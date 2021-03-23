<%@page import="dao.PdsDao"%>
<%@page import="dto.PdsDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDto mem = (MemberDto)session.getAttribute("login"); %>
<%
int seq = Integer.parseInt( request.getParameter("seq") );
PdsDto pds = PdsDao.getInstance().getPdsDto(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





</body>
</html>