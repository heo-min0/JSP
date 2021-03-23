<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String is = request.getParameter("is");%>
<%String ok = request.getParameter("ok");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
</head>
<body>

<%if(is!=null && is.equals("true")){%>
	<script type="text/javascript">
		alert("성공적 가입")
		location.href = "member?param=login";
	</script>
<%}else if(is!=null && is.equals("false")){%>
	<script type="text/javascript">
		alert("다시 기입");
		location.href = "member?param=regi";
	</script>
<%}%>

<%if(ok!=null && ok.equals("YES")){%>
	<script type="text/javascript">
		alert("로그인 성공")
		location.href = "member?param=bbslist";
	</script>
<%}else if((ok!=null && ok.equals("NO"))){%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않습니다.");
		location.href = "member?param=login";
	</script>
<%}%>

<%String w = request.getParameter("w");%>
<%if(w!=null && w.equals("true")){%>
	<script type="text/javascript">
		alert("글쓰기 성공")
		location.href = "bbs?param=bbs";
	</script>
<%}else if((w!=null && w.equals("false"))){%>
	<script type="text/javascript">
		alert("글쓰기 실패");
		location.href = "bbs?param=bbs";
	</script>
<%}%>

<%String d = request.getParameter("d");%>
<%if(d!=null && d.equals("true")){%>
	<script type="text/javascript">
		alert("삭제 성공")
		location.href = "bbs?param=bbs";
	</script>
<%}else if((d!=null && d.equals("false"))){%>
	<script type="text/javascript">
		alert("삭제 실패");
		location.href = "bbs?param=bbs";
	</script>
<%}%>

</body>
</html>




