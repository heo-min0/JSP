<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%MemberDto mem = (MemberDto)session.getAttribute("mem");%>
<%List<BbsDto> list = BbsDao.getInstancs().getBbsList();%>
<%!public String arrow(int depth) {
	String rs = "<img src='./img/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; //여백
	String ts = "";
	for(int i = 0;i<depth;i++){	ts += nbsp;	}
	return depth==0?"":ts+rs;
}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbslist(Bulletin Borad System)전자게시판</title>
</head>
<body>
<h4 align="right" style="background-color: #f0f0f0">환영합니다. <%=mem.getId() %>님</h4>
<h1>게시판</h1>

<div align="center">
<table border="1">
<col width="70"><col width="600"><col width="150">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>
<%if(list == null || list.size() == 0){%>
	<tr>
		<td colspan="3">작성된 글이 없습니다.</td>
	</tr>
<%}else{
	for(int i = 0;i<list.size();i++){
		BbsDto bbs = list.get(i);
		%>
		<tr>
			<th><%=i+1 %></th>
			<td>
			<% if(bbs.getDel()==0) {%>
			<%=arrow(bbs.getDepth()) %>
			<a href="bbs?param=seq&seq=<%=bbs.getSeq() %>">
				<%=bbs.getTitle() %>
			</a>
			<%}else{%>
				<font color="red">**이글은 작성자에 의해서 삭제되었습니다.</font>
			<%}%>
			</td>
			<td><%=bbs.getId() %></td>
		</tr>
		<%}
}%>
</table>
<br><br>
<select id="sort">
	<option value="TITLE" selected>제목</option>
	<option value="CONTENT">내용</option>
	<option value="ID">작성자</option>
</select>
<input type="text" id="ser">
<button type="button" id="btn" onclick="search()">검색</button>
<br><br>
<a href="bbs?param=write">글쓰기</a>
</div>

<script type="text/javascript">
function search() {
	let sort = document.getElementById('sort').value
	let ser = document.getElementById('ser').value
	location.href = "bbs?param=search&sort="+sort+"&ser="+ser;
}
</script>

</body>
</html>







