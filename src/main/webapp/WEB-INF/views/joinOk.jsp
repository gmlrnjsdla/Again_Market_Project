<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login/join.css">

</head>
<body>
<center>
	<div class="login_outbox">
		<div class="login_no1">
				<img id="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"
				 width="350" height="180" align="center" border="0">
			 	<div class="join_write">
					회원가입을 성공하셨습니다.<br>
					<br>
					감사합니다.
	
				</div>
			 <div class="d-grid gap-2">
	  			<input class="btn" type="button" value="가입"/>
			</div>
		</div>
		<div class="btn_member_jion">
			계정이 있으신가요?<a href="/login">&nbsp;&nbsp;로그인</a>
		</div>
		<div class="wqb_write">
			앱을 다운로드하세요.	
		</div>
	
		<div class="wqb_box">
			<a href="https://play.google.com/store/apps"><img src="https://static.cdninstagram.com/rsrc.php/v3/ye/r/UtJtFmFLCiD.png"
			 width="180" height="50" align="center" border="0"></a>
			<a href="ms-windows-store://pdp/"><img src="https://static.cdninstagram.com/rsrc.php/v3/yw/r/LBxTdceDfgS.png"
			 width="180" height="50" align="center" border="0"></a>	
		</div>
	</div>
	</center>
</body>
</html>