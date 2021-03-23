<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%-- jstil.jar   standard.jar 추가 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- String data = "core tag 입니다.";
request.setAttribute("_data", data);
out.println(data); --%>

<c:set var="_data" value="core tag + el 입니다."/>
<c:out value="${_data}"/>

<% request.setAttribute("count", "10");
String scount = (String)request.getAttribute("count");
int count = Integer.parseInt(scount);%>
<% if(count>=10){ %>
	<p>count:<%= count %></p>
<% } %>
<c:if test="${count >= 10 }">
	<p>core count:<c:out value="${count}"/></p>
</c:if>
<br><br>
<% request.setAttribute("name", "홍길동"); %>

<c:if test="${name eq '홍길동'}">
	<p>이름은 홍길동입니다.</p>
</c:if>

<c:forEach begin="0" end="9" step="1" varStatus="i">
	<c:out value="${i.index }"/>
</c:forEach>
<br><br>

<% List<MemberDto> list = new ArrayList<>();

MemberDto m = new MemberDto();
m.setMessage("hello");
list.add(m);

m = new MemberDto();
m.setMessage("world");
list.add(m);

request.setAttribute("_list", list);
%>

<c:forEach begin="0" end="1" var="mem" items="${_list }" varStatus="i">
	<p>index:<c:out value="${i.index }"/>
		data:<c:out value="${mem.message }"/></p>
</c:forEach>

</body>
</html>





