<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>
	<script>
	alert("로그인 해 주십시오.");
	location.href = "login.jsp";
	</script>	
<%
}
mem = (MemberDto)ologin;
session.setAttribute("mem", mem);
%>

<%!
//댓글 depth와 image를 추가하는 함수
// depth = 1  ' '->
// depth = 2  '  '->
public String arrow(int depth) {
	String rs = "<img src='./img/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; //여백
	String ts = "";
	for(int i = 0;i<depth;i++){	ts += nbsp;	}
	return depth==0?"":ts+rs;
}
%>
<%
String thr = request.getParameter("thr");
String ser = request.getParameter("ser");
if(thr == null) thr = "";
if(ser == null) ser = "";
%>

<%//dao로부터 list
BbsDao dao = BbsDao.getInstancs();
List<BbsDto> list = dao.getBbsList(thr,ser);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>bbslist(Bulletin Borad System)전자게시판</title>
</head>
<body>
<h4 align="right" style="background-color: #f0f0f0">환영합니다. <%=mem.getId() %>님</h4>
<h1>게시판</h1>

<div align="center" style="width: 70%; text-align: center;" >

<table border="1" style="margin: 10%;" class="table table-hover">
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
			<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
				<%=bbs.getTitle() %>
			</a>
			<%}else{%>
				<font color="red">**이글은 작성자에 의해서 삭제되었습니다.</font>
			<%}%>
			</td>
			<td><%=bbs.getId() %></td>
		</tr>
			
		<%
	}

}%>

</table>

<br><br>
<select id="three">
	<option value="TITLE" selected>제목</option>
	<option value="CONTENT">내용</option>
	<option value="ID">작성자</option>
</select>
<input type="text" id="ser">
<button type="button" id="btn" onclick="search()">검색</button>
<br><br>
<a href="bbswrite.jsp">글쓰기</a>
</div>

<script type="text/javascript">
function search() {
	let thr = document.getElementById('three').value
	let ser = document.getElementById('ser').value
	location.href = "bbslist.jsp?thr="+thr+"&ser="+ser;
}
</script>

</body>
</html>








