<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.getPwd(new MemberDto(id,pwd,null,null,0));

if(dto != null && !dto.getId().equals("")){
	//섹션에 로그인 정보 저장
	session.setAttribute("login", dto);
	//session.setMaxInactiveInterval(30 * 60 * 60);
	
	response.sendRedirect("bbslist.jsp");
}else{%>
<script type="text/javascript">
	alert("아이디와 비밀번호가 일치하지 않습니다.")
	location.href = "mylogin.jsp";
</script>	
<%}%>