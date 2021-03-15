<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<style type="text/css">
.center{
	margin: auto;
	width:  60%;
	border: 1px solid @gray-light;
	padding: 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div>
<h2>회원가입</h2>
<p>환영합니다. 홍길동 홈페이지입니다.</p>
</div>

<div class="center">
<form action="regiAF.jsp" method="post">

<table class="table table-hover  table-condensed"">
<tr>
	<td>아이디 </td>
	<td>
		<input type="text" class="form-control" name="id" id="_id" size="20">
		<!-- id확인 ajax p, button -->
		<p id="idcheck" style="font-size: 8px"></p>
		<div style="text-align: right;"><button type="button" id="btn" value="id확인" class="btn btn-info btn-sm" >중복확인</button></div>
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" class="form-control" name="pwd" id="_pwd" size="20">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" class="form-control" name="name" size="20">
	</td>
</tr>
<tr>
	<td><label class="control-label" for="inputSuccess1">이메일 주소</label></td>
	<td>
		<input type="text" class="form-control" name="email" size="20">
	</td>
</tr>
<tr>
	<td colspan="2" style="text-align: center;">
		<input type="submit" value="회원가입" class="btn btn-info btn-md">
	</td>
</tr>
</table>
</form>
</div>

 <script type="text/javascript">
 $(function() {
 	$("#btn").click(function() {
 		if($("#_id").val()==""){
 			alert("아이디를 입력해주세요");
 			return;
 		}
 		
 		
 		$.ajax({
 			url: "idchk.jsp",
 			type: "post",
 			datatype: "json",
 			data: {"id":$("#_id").val()},
 			success: function(data){
 				alert(data.trim());
 				if(data.trim() == "false"){
 					$("#idcheck").css("color", "#0000ff");
 					$("#idcheck").html("사용가능한 id입니다.");
 				}else{
 					$("#idcheck").css("color", "#ff0000");
 					$("#idcheck").html("사용하지 못하는 id입니다.");
 					$("#_id").val("");
 				}
 			},
 			error: function(){
 				alert("error");
 			}
 		})
 	})
 })
 
 </script>

</body>
</html>


