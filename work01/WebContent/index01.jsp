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
int gnum=0;
%>
<table border="1">
<tr>
<%for(int j=0;j<=gnum;j++){%>
<%for(int i=0;i<11;i++){%>
	<td><%=j%>*<%=i%>=<%=(j*i)%></td>
<%}%>
</tr>
<%}%>
<%gnum++;%>



</table>

<%%>
</body>
</html>