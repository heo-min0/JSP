<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = "홍길동";
int age = 24;
String birth = "09/03/12";

String json = "{\"name\":\"" + name + "\",\"age\":" + age
	+ ",\"birth\":\"" + birth + "\"}";
System.out.println(json);
out.println(json);
%>