<%@page import="java.util.Date"%>
<%@page import="dao.PdsDao"%>
<%@page import="dto.PdsDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDto mem = (MemberDto)session.getAttribute("login"); %>
<%
int seq = Integer.parseInt( request.getParameter("seq") );
PdsDto pds = PdsDao.getInstance().getPdsDto(seq);
String filename = (new Date().getTime())+"";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>자료 수정페이지</h2>

<div align="center">

<form action="pdsupdateAF.jsp?seq=<%=pds.getSeq()%>" method="post" enctype="multipart/form-data">

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
		<input type="text" name="orifilename" value="<%=pds.getOriFilename()%>" readonly="readonly">
		<input type="hidden" name="filename" value="<%=pds.getFilename()%>">
	</td>
</tr>
<tr>
	<th>변경할 파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px;">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" value="<%=pds.getTitle()%>">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"><%=pds.getContent()%></textarea>
	</td>
</tr>
<tr align="center">
	<td colspan="2">
		<input type="submit" value="수정완료">
	</td>
</tr>

</table>

</form>

</div>
</body>
</html>