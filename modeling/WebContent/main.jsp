<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String content = request.getParameter("content");
	if(content == null){
		content = "home";	
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link href="css/main.css" rel="stylesheet" />

</head>
<body>

<header class="container">
<jsp:include page="menu.jsp" flush="false"/>
</header>

<main class="container"  style="border:1px solid">
		<jsp:include page='<%=content + ".jsp" %>' flush="false"/>
</main>

<footer class="container"  style="border:1px solid">
		<jsp:include page="bottom.jsp" flush="false"></jsp:include>
</footer>


</body>
</html>










