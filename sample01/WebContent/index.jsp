<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//자바영역
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 전자정부 프레임웍 > Spring framework(jsp)
jsp를 대신 > Spring boot(back end), Vue react JQuery(front end) -->

<%-- JSP 주석문 --%>
<h1>Hello JSP</h1>

<% //java영역 scriptlet = script + applet
	//System.out.println("콘솔출력");
	String str = "Hello JSP";
	//out : web에 출력하는 object
	out.println("<h3>내장객체  out</h3>");
%>
<p>str:<%= str %></p>
<input type="text" size="20" value="<%= str %>">
<%
for(int i=0;i<5;i++){
%>
<p>hello p tag<%=i %></p>
<% 	
}
%>
<p id="demo">p id demo</p>

<script type="text/javascript">
document.getElementById("demo").innerHTML = "p 태그 내용";
</script>


</body>
</html>





