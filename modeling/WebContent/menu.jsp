<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.logo{
	margin-top: 5px;
	width:300px; 
	float: left; 
}


a.menu{
 text-decoration: none;
 color:black;
 margin-left: 15px;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm header">
	<div class="container">
		 <!-- 로고 -->
		 <a class="navbar-brand brandcol" href="main.jsp?content=home" ><img src="">BAVABOOK</a>
		<!-- 네비게이션 -->
			<ul class="navbar-nav justify-content-end">
				<li class="nav-item">
					<a class="linkcol nav-link" href="main.jsp?content=home">HOME</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=book">책추천</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=community">커뮤니티</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=mypage">마이페이지</a>
				</li>
				<li class="nav-item dropdown">
					<a href="#dropdownmenu" class="nav-link dropdown-toggle linkcol dropdown-toggle" id="navbardrop"
					 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
					<!-- <button class="nav-link dropdown-toggle linkcol" type="button"
				 			id="navbardrop" data-toggle="dropdown"
				 			aria-expanded="false">
      						로그인
    				</button> -->
				      <div class="dropdown-menu" id="dropdownmenu" >
				        <a class="dropdown-item" href="#">로그인</a>
				        <a class="dropdown-item" href="#">마이페이지</a>
				        <a class="dropdown-item" href="#">일정관리</a>
				      </div>
   				</li>
			</ul>	
	</div>
</nav>

</body>
</html>