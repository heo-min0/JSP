<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BbsDao dao = BbsDao.getInstancs();
String seq = request.getParameter("seq");

if(Integer.parseInt(seq)>0){
	dao.delBbs(seq);%>
	<script type="text/javascript">
	location.href = "bbslist.jsp";
	</script>
<%}	%>



