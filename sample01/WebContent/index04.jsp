<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//Object obj = request.getAttribute("you");
Object obj = session.getAttribute("you");
YouClass ycls = null;

if(obj != null ) {ycls = (YouClass) obj;}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(ycls != null){
%>
<h1>넘어 온 이름 : <%=ycls.toString() %></h1>		
<%
}
%>


</body>
</html>