<%@page import="work01.memCls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//memCls dto = (memCls)session.getAttribute("mem");
memCls dto = (memCls)request.getAttribute("mem");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>12아이디 : <%=dto.getId()%></p>
<p>패스워드 : <%=dto.getPw()%></p>
<%if(dto.getHobby() != null) {%>
<%for (int i = 0; i < dto.getHobby().length; i++) {%>
	<p>취미 : <%=dto.getHobby()[i]%></p>
<%}}%>
<p>나이 : <%=dto.getAge()%></p>
<p>상세내역 : <%=dto.getText()%></p>

</body>
</html>