<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BbsDao dao = BbsDao.getInstancs();
String seq = request.getParameter("seq");
String se = request.getParameter("se");
if(Integer.parseInt(seq)>0){
	dao.delBbs(seq);%>
	<script type="text/javascript">
	location.href = "bbslist.jsp";
	</script>
<%}
if(Integer.parseInt(se)>0){
	BbsDto dto = dao.getBbsseq(se);
	request.setAttribute("dto", dto);
	pageContext.forward("bbswrite.jsp");
	%>
	<!-- <script type="text/javascript">
	location.href = "bbswrite.jsp";
	</script> -->
<%}%>

