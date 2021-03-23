<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String str = "hello";
request.setAttribute("_str", str);
%>

<% String s = (String)request.getAttribute("_str"); %>
<% out.println("s= "+ s); %>
<br><br>

s=<%=s%>
<br><br>

s = ${ _str }
<br><br>

<%='값'%>
<br>
${ '값' }
<br>
${ 2+3 }
<br>
${3>2?100:200}
<br><br>
<% request.setAttribute("data", "안녕하세요"); %>
${data}
<br><br>
Object가 할당되어 있는지?
<% Object obj = new String("world");
if(obj != null){}%>
<% request.setAttribute("_obj", obj); %>
<%// obj=null; %>
<br>
obj = ${empty obj}
<br>
obj = ${not empty obj}
<br><br>
<%-- 판별식 true false  연산식  value   --%>
1<9:${1<9} <br>
1+9:${1+9}
<br><br>

<% Integer a,b; a=10; b=3;
   Boolean c = false;
   request.setAttribute("a", a);
   request.setAttribute("b", b);
   request.setAttribute("c", c);%>
   
a:${a}<br>
b:${b}<br>
c:${c}<br>
a+b:${a+b}<br>
a < b:${a<b}<br>
c:${!c }<br>
${a == 10 && !c }<br>
<br><br>

<% MemberDto dto = new MemberDto();
	dto.setMessage("Hello EL");%>
message : <%= dto.getMessage() %><br>
message : ${dto.getMessage() }<br>
<br><br>
<%request.setAttribute("_dto", dto);%>
message : ${_dto.message}<br>
<% String arr[] = {"hello", "world"};
request.setAttribute("_arr", arr);%>
<%= arr[0] %><br>
${_arr[1] }
<br><br>
<% List<String> list = new ArrayList<>(); 
list.add("world");
list.add("hello");
request.setAttribute("_list", list);
%>
<%= list.get(0) %><br>
${_list[1] }
<br><br>
<% List<MemberDto> mylist = new ArrayList<>();
MemberDto dto1 = new MemberDto();
MemberDto dto2 = new MemberDto();
dto1.setMessage("lunch");
mylist.add(dto1);
dto2.setMessage("dinner");
mylist.add(dto2);
request.setAttribute("mylist",mylist);
%>

${mylist[0].message}<br>
${mylist[1].message}<br>



</body>
</html>



