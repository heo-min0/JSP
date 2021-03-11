<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
int gnum = 0;
%>

<%
gnum++;

int num = 0;
num++;
%>

<p>gnum : <%=gnum %></p>
<p>num : <%=num %></p>

</body>
</html>