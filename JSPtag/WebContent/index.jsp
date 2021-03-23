<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- forward(전진), include(불러오기) --> 
<h3>index.jsp start</h3>

<jsp:include page="NewFile.jsp"/>

<h3>index.jsp end</h3>

<%-- <jsp:forward page="NewFile.jsp"/> --%>

<jsp:useBean id="dto" class="dto.MemberDto"/>
<jsp:setProperty property="message" name="dto" value="안녕하세요"/>
<jsp:getProperty property="message" name="dto"/>
<br>
msg:${dto.message }<br>





</body>
</html>





