<%@page import="work01.memCls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<form id="frm">
<table>
<tr><td>아이디</td><td><input type="text" name="id" value="aaaa"></td></tr>
<tr><td>패스워드</td><td> <input type="password" name="pw" value="bbbb"></td></tr>
</table>

<br>
취미<br>
<input type="checkbox" name="hobby" value="sleep" checked>잠자기
<input type="checkbox" name="hobby" value="sing">노래하기
<input type="checkbox" name="hobby" value="play">게임기
<br><br>

연령대<br>
<input type="radio" name="age" value="10" checked>10대
<input type="radio" name="age" value="20">20대
<input type="radio" name="age" value="30">30대
<input type="radio" name="age" value="40">40대
<input type="radio" name="age" value="50">50대
<input type="radio" name="age" value="60">60대이상
<br><br>

기타하고싶은말<br>
<textarea rows="4" cols="50" name="text">안녕</textarea>
<br><br>
<button type="button" id="btn">전송</button>
<button type="button" id="cnl">취소</button>
<input type="reset" value="취소">
</form>

<script type="text/javascript">
$(document).ready(function() {
	$("#btn").on("click", function() {
		if($("#frm input").val() == ""){
			alert("필수입력"); return;
		}
		else{
			let action = "index03.jsp";
			$("#frm").attr({"method":"post","action":action}).submit();
		}
	});
	$("#cnl").on("click",function() {
		$("#frm *").val("").attr("checked", false);
	});
});
</script>

</body>
</html>





