<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!int size=0;%>
<table border="1">
<%for(int j=0;j<=size;j++){%>
	<tr>
		<%for(int i=0;i<11;i++){%>
			<td><%=j%>*<%=i%>=<%=(j*i)%></td>
		<%}%>
	</tr>
<%}%>
<%size++;%>



</table>

<%%>
</body>
</html>