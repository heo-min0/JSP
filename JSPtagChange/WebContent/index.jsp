<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String content = request.getParameter("content");
if(content==null){
	content = "home";
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="width: 500px;" border="1" cellpadding="2" cellspacing="0">
<tr>
	<td>
		<jsp:include page="menu.jsp" flush="false"/>
	</td>
</tr>
<tr>
	<td>
		<jsp:include page='<%=content + ".jsp" %>' flush="false"/>
	</td>
</tr>
<tr>
	<td>
		<jsp:include page="bottom.jsp" flush="false"/>
	</td>
</tr>
</table>





</body>
</html>