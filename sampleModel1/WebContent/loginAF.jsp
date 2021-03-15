<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDao dao = MemberDao.getInstance();
boolean b = dao.getPwd(id, pwd);
if(b){
	response.sendRedirect("bbslist.jsp");
}else{%>
<script type="text/javascript">
	alert("아이디와 비밀번호가 일치하지 않습니다.")
	location.href = "mylogin.jsp";
</script>	
<%}%>