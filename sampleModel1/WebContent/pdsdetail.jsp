<%@page import="dao.PdsDao"%>
<%@page import="dto.PdsDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% MemberDto mem = (MemberDto)session.getAttribute("login"); %>
<%
int seq = Integer.parseInt( request.getParameter("seq") );
PdsDto pds = PdsDao.getInstance().getPdsDto(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>자료 상세페이지</h2>

<div align="center">

<form action="pdsupdate.jsp?seq=<%=pds.getSeq()%>" method="post">
<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" value="<%= mem.getId() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>파일명</th>
	<td>
		<%=pds.getOriFilename()%>&nbsp;&nbsp;
		<input type="button" name="btndown" value="파일 내려받기"
			onclick=" location.href='filedown?filename=<%=pds.getFilename()%>&seq=<%=pds.getSeq()%>' ">
	</td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=pds.getReadcount()%></td>
</tr>
<tr>
	<th>다운로드 수</th>
	<td><%=pds.getDowncount()%></td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" value="<%=pds.getTitle()%>" readonly="readonly">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content" readonly="readonly"><%=pds.getContent()%></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" style="text-align: center;">
		<input type="submit" value="수정" style="width: 70px;">
		<button type="button" style="width: 70px;" onclick="location.href = 'pdsdell.jsp?seq=<%=pds.getSeq()%>' ">삭제</button>
	</td>
</tr>
</table>
</form>
</div>


</body>
</html>

