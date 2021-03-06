<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String seq = request.getParameter("seq");
BbsDao dao = BbsDao.getInstancs();
BbsDto dto = dao.getBbsseq(seq);
dao.readcount(Integer.parseInt(seq));
MemberDto mem = (MemberDto)session.getAttribute("mem");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center" style="margin: 20px">
<table border="1">
	<col width="100px">
<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<th>제 목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<th>정 보</th>
	<td><%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %></td>
</tr>
<tr>
	<th>내 용</th>
	<td>
	<textarea rows="20" cols="70" readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>
</div>

<div align="center">
<%if(mem.getId().equals(dto.getId()) ){ %>
	<button type="button" id="del" onclick="del()" style="font-size: 18px">글삭제</button>
	<button type="button" id="update" onclick="upda()" style="font-size: 18px">글수정</button>
<%} %>	
	<button type="button" id="list" onclick="list()" style="font-size: 18px">글목록</button>
	<button type="button" onclick="answerbbs(<%=seq %>)" style="font-size: 18px">답글</button>
</div>

<script type="text/javascript">
function list() {
	location.href = "bbslist.jsp";
}
function del() {
	location.href = "bbsdetailAF.jsp?seq=<%=seq %>";
}
function upda() {
	location.href = "bbsupdate.jsp?seq=<%=seq %>";
}
function answerbbs(seq) {
	location.href = "answer.jsp?seq="+seq;
}
</script>

</body>
</html>





