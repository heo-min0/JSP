<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!-- DB에 데이터를 추가 -->
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String email = request.getParameter("email");
System.out.println(id +", " + pwd + ", " + name +", " + email);
%>
<!-- 이동 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regiAF.jsp</title>
</head>
<body>

<%
MemberDao dao = MemberDao.getInstance();
MemberDto dto = new MemberDto(id, pwd, name, email, 0);
boolean isS = dao.addMember(dto);
if(isS){
%>
<script type="text/javascript">
alert("성공적 가입")
location.href = "login.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
alert("다시 기입");
location.href = "regi.jsp";
</script>
<%
}
%>	





</body>
</html>



