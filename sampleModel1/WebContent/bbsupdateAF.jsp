<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("mem");
String title = request.getParameter("title");
String content = request.getParameter("content");
String seq = request.getParameter("seq");
System.out.println("글수정"+title+ ", " + content+", " + seq);

BbsDao dao = BbsDao.getInstancs();
BbsDto dto =  new BbsDto(mem.getId(), title, content);
boolean b = dao.setBbs(dto,seq);
if(b == false){
	%>
	<script type="text/javascript">
	alert("글 수정 실패")
	location.href = "bbslist.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("글 수정 완료")
	location.href = "bbslist.jsp";
	</script>
	<%
}
%>