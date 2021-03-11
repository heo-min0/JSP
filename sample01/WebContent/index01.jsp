<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	java : 제어문, collection, DB접근
	             EL, Core, jsp
	             
	     선언부, 코드부, value
 -->
<%!
//선언부(전역변수, class, function)
int glNumber = 0;

%>
<%
//코드부
glNumber++;
out.println("<h3>" + glNumber + "</h3>");
int number = 0;
number++;
out.println("<h3>" + number + "</h3>");
%>

<!-- value -->
glNumber:<%=glNumber %>
<br>
number:<%=number %>
<br><br>

<%!
class MyClass{
	private int number;
	MyClass(int number){
		this.number = number; 
	}
	public String toString(){
		return this.number + "";
	}
}

public String func(){
	return "func 호출";
}

%>
<%
MyClass cls = new MyClass(123);
System.out.println(cls.toString());
System.out.println(func());

YouClass ycls = new YouClass("홍길동");
System.out.println(ycls.toString());
%>


</body>
</html>










