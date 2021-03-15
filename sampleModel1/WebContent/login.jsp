<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<style type="text/css">
.center{
	margin: auto;
	width:  60%;
	border: 3px solid #0000ff;
	padding: 10px;
}
</style>
</head>
<body>

<h2>login page</h2>

<div class="center">
<form action="loginAF.jsp" method="post">
<table border="1">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" id="_id" name="id" size="20"><br>
		<input type="checkbox" id="chk_save_id">save id
	</td>
</tr>
<tr>
	<th>패스워드</th>
	<td>
		<input type="password" id="_pwd" name="pwd" size="20"><br>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="로그인" id="login">
		<button type="button" onclick="account()">회원가입</button>
	</td>
</tr>
</table>

</form>

</div>


<script type="text/javascript">
function account() {
	location.href = "regi.jsp";
}

let user_id = $.cookie("user_id");
if(user_id != null){ //저장된  id가 있음
	//alert("쿠키있음")
	$("#_id").val(user_id);
	$("#chk_save_id").attr("checked","checked");
}

$("#chk_save_id").click(function() {
	if($("#chk_save_id").is(":checked")){
		//alert('체크됨');
		if($("#_id").val().trim() == "" ){
			alert('id 입력바람');
			$("#chk_save_id").prop("checked", false);
			$("#_id").val("");
		}else{//쿠키저장
			$.cookie("user_id", $("#_id").val().trim(), {
				expires:7, path:'./'
			});
		}
	}
	else{
		$.removeCookie("user_id", {
			path:'./'
		});	
	}
});

</script>


</body>
</html>






