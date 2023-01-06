<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#### 아이디 찾기 ####</title>

<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/find.css">


</head>

<body>
<center>
	<div class="login_outbox">
	
	<div class="login_no1">
			<img id="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"
			 width="320" height="160" align="center" border="0" style="margin:35px 0 20px 0;">
		<div class="wqb_write">
			<br><h5>아이디 찾기 성공</h5>
			
			
		</div>
		
		<br>
	
		<div class="hr_sect"> Search ID </div>
		
		<br>
	    
		<div class="wqb_write">
			<br>
			고객님의 아이디는<br><br>  <h3 style="color: black; font-weight: bold;">${findId.id }</h3> <br>입니다.<br><br>
			
		</div>
		
		<br><br>	
		<br>
		<div class="wqb_write2">
		저희 서비스를 이용하는 사람이 회원님의 연락처<br>
		정보를 Again Marcket에 업로드했을 수도 있습니다.<span class="rr"><br>
		더 알아보기</span>
		</div>
		
	
	</div>
	<div class="btn_member_jion">
		계정이 있으신가요?<a href="login">&nbsp;&nbsp;로그인</a>
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