<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("mem");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDao dao = BbsDao.getInstancs();
BbsDto dto =  new BbsDto(mem.getId(), title, content);
boolean b = dao.addBbs(dto);
if(b == false){
	%>
	<script type="text/javascript">
	alert("글 추가 실패")
	location.href = "bbslist.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("글 추가 완료")
	location.href = "bbslist.jsp";
	</script>
	<%
}
%>