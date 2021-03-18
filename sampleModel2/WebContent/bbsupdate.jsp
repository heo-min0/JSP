<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%BbsDto bbs = (BbsDto)request.getAttribute("dto");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="bbs?param=updateAF&seq=<%=bbs.getSeq() %>" id="frm" method="post">
<div align="center" style="margin: 30px">
<table border="1">
<tr>
	<th>작성자</th>
	<td><input type="text" name="id" value="<%=bbs.getId() %>" readonly="readonly">  </td>
</tr>
<tr>
	<th>제 목</th>
	<td><input type="text" size="68" id="title" name="title"></td>
</tr>
<tr>
	<th>내 용</th>
	<td align="center"><textarea rows="20" cols="70" id="content" name="content"></textarea></td>
</tr>
</table>
</div>

<div align="center">
	<button type="submit" style="font-size: 18px;">글수정</button>
</div>
</form>

<script type="text/javascript">
document.getElementById('title').value = "<%=bbs.getTitle() %>"
document.getElementById('content').value = "<%=bbs.getContent() %>"
</script>

</body>
</html>