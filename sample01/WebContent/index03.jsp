<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
YouClass cls = new YouClass("성춘향");
//request.setAttribute("you", cls); //짐싸기

session.setAttribute("you", cls); //계속 유지 무거워질수도  중요 데이터는 가지고 있음
//request.getSession().setAttribute("you", cls); //위와 동일


//pageContext.forward("index04.jsp"); //가져가기
//request.getRequestDispatcher("index04.jsp").forward(request, response);

response.sendRedirect("index04.jsp");
// 섹션으로 포장한거는 가져간다 근데 사이트가 바뀜 사이트가 바뀜

//application, config


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





</body>
</html>






