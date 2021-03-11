<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//내장객체 : 동적할당 하지 않고 사용할 수 있는 객체 클래스
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String age = request.getParameter("age");
String hobby[] = request.getParameterValues("hobby");
%>
<h3>이름 : <%=name %></h3>
<h3>나이 : <%=age %></h3>
<%
for (int i = 0; i < hobby.length; i++) {
%>
	<h3>취미 : <%=hobby[i]%></h3>
<%
}
%>

</body>
</html>