<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<%
String id = request.getParameter("id");
System.out.println("넘어온 id : "+id);
MemberDao dao = MemberDao.getInstance();
boolean b = dao.getID(id); //맞으면 true
out.println(b);
/* if(b==true){
	out.println("NO");
}else{
	out.println("YES");
} */
%>