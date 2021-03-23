<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

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
<h4 align="right" style="background-color: #f0f0f0">환영합니다. ${mem.id}님</h4>
<h1>게시판</h1>
<br>
<div align="center" style="width: 70%; margin: 10px auto;">
<table class="table table-hover thead-light">
<col width="70"><col width="600"><col width="150">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>
<c:choose>
	<c:when test="${empty list || list.size() == 0}">
	<tr>
		<td colspan="3">작성된 글이 없습니다.</td>
	</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="bbs" varStatus="i">
			<tr>
				<th>${i.count}</th>
				<td>
				<c:choose>
					<c:when test="${bbs.del==0}">
						<jsp:useBean id="arr" class="arr.Arrow"></jsp:useBean>
						<jsp:setProperty property="depth" name="arr" value="${bbs.depth}"/>
						<jsp:getProperty property="res" name="arr"/>
						<a href="bbs?param=seq&seq=${bbs.seq}">${bbs.title}</a>
					</c:when>
					<c:otherwise>
						<font color="red">**이글은 작성자에 의해서 삭제되었습니다.</font>
					</c:otherwise>
				</c:choose>
				</td>
				<td>${bbs.id}</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<div align="center">

<c:forEach begin="0" end="${pageNum-1}" step="1" varStatus="i">
	<c:choose>
		<c:when test="${page == i.index}">
			${i.count} &nbsp;
		</c:when>
		<c:otherwise>
			<a href="#" onclick="goPage(${i.index})">[${i.count}]</a>&nbsp;
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
<br>
<div style="margin: 0 auto; width: 60%">
<select id="sort" class="btn btn-info dropdown-toggle" data-toggle="dropdown" style="float: left;">
	<option value="title" selected>제목</option>
	<option value="content">내용</option>
	<option value="id">작성자</option>
</select>
<div class="col-sm-4" style="float: left;">
<input type="text" id="ser" class="form-control" value="${search}">
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

function goPage(index1) {
	let sort = document.getElementById('sort').value
	let ser = document.getElementById('ser').value
	location.href = "bbs?param=bbs&sort="+sort+"&ser="+ser+"&index="+index1;
}

$(document).ready(function() {
	let search = ${search} + "";
	if(search == "") return;
	
	let obj = document.getElementById("sort");
	obj.value = ${choice} + "";
	obj.setAttribute("selected", "selected");
})
</script>

</body>
</html>

