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
<title>log in</title>
<style type="text/css">

.card-header{
	height: 4rem;
	padding-bottom: 0;
	position: relative;
	background-color: #b3e6ff;
}
.text01{
	margin-top: 7px;
	color: #3366ff;
}
.text02{
	color: #3366ff;
	text-align: right;
	margin: 0;
	padding: 0;
	position: absolute;
	right: 5px;
	bottom: 0;
}

.card-body{	height: 20rem;}

.input-group{	margin-top: 15px;}

.input{
	width: 45px;
	border: 1px solid lightgray;
	border-right: none;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	background-color: lightgray;
	text-align: center;
}

.icon{
	width: 20px;
	height: auto;
	margin-top: 6px;
}

.key{
	width: 14px;
	height: auto;
	margin-top: 4px;
}

.card-text{
	color: rgb(172, 172, 172);
	margin-left: 12%;
}

.checkbox{	color:rgb(172, 172, 172);}

.btngroup{	text-align: center;}

</style>
</head>
<body>

<form action="member?param=loginAF" id="frm" method="post">
<div class="container">
	<div class="card mb-5" style="max-width: 30rem; margin: 15% auto;">
		<div class="card-header">
			<div class="text01"><h4>Sign in</h4></div>
			<div class="text02">
				<a href="#">Forgot password?</a>
			</div> 
		</div>
		
		<div class="card-body">		
			<div class="input-group">
				<span class="input" id="basic-addon1">
					<img class="icon" alt="" src="./icon.png">
				</span>
  				<input type="text" class="form-control" aria-describedby="basic-addon1" id="id" name="id">
			</div>
			
			<p class="card-text">username or email</p>

			<div class="input-group">
				<span class="input" id="basic-addon1">
					<img class="key" alt="" src="./key.png">
				</span>
  				<input type="password" class="form-control" aria-describedby="basic-addon1" id="pw" name="pwd">
			</div>
			
			<p class="card-text">password</p>

			<div class="checkbox">
				<label>
					<input type="checkbox" id="checkboxError" value="option3" >
					Remember me
				</label>
			</div>

			
			<div class="btngroup">
			<button class="btn btn-success btn-lg" type="button" id="btn" style="width: 40%; margin-right: 10px;">Login</button>
			<button class="btn btn-info btn-lg" type="button" onclick="account()" style="width: 40%;">Sign up</button>
			</div>
			
			<hr>
			
		</div>		

	</div>
</div>
</form>

<script type="text/javascript">
function account() {
	location.href = "member?param=regi";
}

let user_id = $.cookie("user_id");
if(user_id != null){ //저장된  id가 있음
	//alert("쿠키있음")
	$("#id").val(user_id);
	$("#checkboxError").attr("checked","checked");
}

$("#checkboxError").click(function() {
	if($("#checkboxError").is(":checked")){
		//alert('체크됨');
		if($("#id").val().trim() == "" ){
			alert('id 입력바람');
			$("#checkboxError").prop("checked", false);
			$("#id").val("");
		}else{//쿠키저장
			$.cookie("user_id", $("#id").val().trim(), {
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

$(function () {
	$("#btn").click(function() {
		if($("#id").val()==""){
			alert("아이디를 입력해주세요");
			return;
		}else if($("#pw").val()==""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		$("#frm").submit();
	})
})

</script>

</body>
</html>