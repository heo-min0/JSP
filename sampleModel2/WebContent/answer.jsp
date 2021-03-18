<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%BbsDto bbs = (BbsDto)request.getAttribute("dto");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div align="center">
 <h2>부모글</h2>
 
 <table border="2">
 <col width="200"><col width="500">
 <tr>
	<td>작성자</td> 
	<td><%=bbs.getId() %></td>
 </tr>
 <tr>
	<td>제목</td> 
	<td><%=bbs.getTitle() %></td>
 </tr>
 <tr>
	<td>작성일</td> 
	<td><%=bbs.getWdate() %></td>
 </tr>
 
 <tr>
	<td>조회수</td> 
	<td><%=bbs.getReadcount() %></td>
 </tr>
 <tr>
<td>내용</td> 
<td>
<textarea rows="10" cols="50"
readonly="readonly">
<%=bbs.getContent() %>
</textarea>
</td>
 </tr>

 </table>
 <%
 MemberDto mem = (MemberDto)session.getAttribute("login");
 %>
 <h2>답글</h2>
 <form action="bbs?param=answerAF" method="post">
 <input type="hidden" name="seq" value="<%=bbs.getSeq()%>"> 

<table border="1">
<col width="200"><col width="500">
<tr>
	<td>아이디</td>
	<td>
	<input type="text" name="id" size="50" readonly="readonly"
		value="<%=bbs.getId() %>">
	</td>
</tr>
<tr>
	<td>제목</td>
	<td>
	<input type="text" name="title" size="50">
	</td>
</tr>
<tr>
	<td>내용</td>
	<td>
	<textarea rows="10" cols="50" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" style="text-align: center;">
		<input type="submit" value="답글작성완료">
	</td>
</tr>
</table>

</form>
 </div>

</body>
</html>



