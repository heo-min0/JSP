<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
BbsDao dao = BbsDao.getInstancs();
String sort = request.getParameter("thr");
String ser = request.getParameter("ser");
List<BbsDto> list = dao.search(sort,ser);
%>
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
<title>Insert title here</title>
</head>
<body>

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
			<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
				<%=bbs.getTitle() %>
			</a>
<%-- 			<%}else{%>
				<font color="red">**이글은 작성자에 의해서 삭제되었습니다.</font> --%>
			<%}%>
			</td>
			<td><%=bbs.getId() %></td>
		</tr>
			
		<%
	}

}%>

</table>
</div>


</body>
</html>