<%@page import="java.util.Date"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%MemberDto mem = (MemberDto)session.getAttribute("login");%>
<%
//file명 변경
String filename = (new Date().getTime())+"";
System.out.println("filename:"+filename);
//mydate.txt > 1616379162263.txt
//original filename : mydate.txt
//filename : 1616379162263.txt 1616379162263.tmp
//1616379162263.txt > mydate.txt
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>자료올리기</h2>

<div align="center">

<!-- 
id			String form field data
title
content
주의할점!
file		byte 
 -->
<form action="pdsupload.jsp?filename=<%=filename %>" method="post" enctype="multipart/form-data"> <!-- 꼭 겟으로 말고 -->

<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" value="<%= mem.getId() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px;">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"></textarea>
	</td>
</tr>
<tr align="center">
	<td colspan="2">
		<input type="submit" value="올리기">
	</td>
</tr>

</table>

</form>

</div>

</body>
</html>

