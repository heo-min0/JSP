<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto mem = (MemberDto)session.getAttribute("mem");
String choice = request.getParameter("choice");
String search = request.getParameter("search");
if(choice == null) choice = "";
if(search == null) search = "";
%>

<%List<BbsDto> list = (List<BbsDto>)request.getAttribute("list");%>
<%!public String arrow(int depth) {
	String rs = "<img src='./img/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; //여백
	String ts = "";
	for(int i = 0;i<depth;i++){	ts += nbsp;	}
	return depth==0?"":ts+rs;
}%>
<%System.out.println("choice"+choice + ", search"+search);%>
<%int pageNum = BbsDao.getInstancs().getAllBbs(choice, search);%>
<%System.out.println("pageNum"+pageNum);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>bbslist(Bulletin Borad System)전자게시판</title>
</head>
<body>
<h4 align="right" style="background-color: #f0f0f0">환영합니다. <%=mem.getId() %>님</h4>
<h1>게시판</h1>
<br>
<div align="center" style="width: 70%; margin: 10px auto;">
<table class="table table-hover thead-light">
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

<div align="center">
<%
int index = 0;
String sidex = request.getParameter("index");
if(sidex != null) index = Integer.parseInt( request.getParameter("index") );
for(int i = 0;i<pageNum;i++){
	if(index == i){
		%>
		<span><%=i+1 %></span>&nbsp;
		<%
	}else{
		%>
		<a href="#" onclick="goPage(<%=i %>)">[<%=i+1 %>]</a>&nbsp;
		<%
	}
}
%>
</div>
<br>
<div style="margin: 0 auto; width: 60%">
<select id="sort" class="btn btn-info dropdown-toggle" data-toggle="dropdown" style="float: left;">
	<option value="title" selected>제목</option>
	<option value="content">내용</option>
	<option value="id">작성자</option>
</select>
<div class="col-sm-4" style="float: left;">
<input type="text" id="ser" class="form-control" value="<%=search %>">
</div>
<button type="button" id="btn" onclick="search()" class="btn btn-info" style="float: left;">검색</button>
</div>
<br><br>
<a href="bbs?param=write">글쓰기</a>
</div>

<script type="text/javascript">
function search() {
	let sort = document.getElementById('sort').value
	let ser = document.getElementById('ser').value
	location.href = "bbs?param=bbs&sort="+sort+"&ser="+ser;
}
function goPage(index) {
	let sort = document.getElementById('sort').value
	let ser = document.getElementById('ser').value
	location.href = "bbs?param=bbs&sort="+sort+"&ser="+ser+"&index="+index;
}

$(document).ready(function() {
	let search = "<%=search %>";
	if(search == "") return;
	
	let obj = document.getElementById("sort");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
})
</script>

</body>
</html>







