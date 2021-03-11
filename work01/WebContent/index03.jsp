<%@page import="work01.memCls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String hobby[] = request.getParameterValues("hobby");
String age = request.getParameter("age");
String text = request.getParameter("text");

memCls dto = new memCls(id, pw, hobby, age, text);
//session.setAttribute("mem", dto);
//response.sendRedirect("index03.jsp");
request.setAttribute("mem", dto);
pageContext.forward("index04.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>아이디 : <%=id%></p>
<p>패스워드 : <%=pw%></p>
<%for (int i = 0; i < hobby.length; i++) {%>
	<p>취미 : <%=hobby[i]%></p>
<%}%>
<p>나이 : <%=age%></p>
<p>상세내역 : <%=text%></p>



</body>
</html>