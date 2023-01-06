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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/join.css">


</head>

<body>
<center>
	<div class="login_outbox">
	<form action="findIdOk" method="post">
	<div class="login_no1">
			<img id="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"
			 width="320" height="160" align="center" border="0" style="margin:35px 0 20px 0;">
		<div class="wqb_write">
			<br><h5>아이디 찾기</h5><br><br>
			아래 정보를 모두 입력해주세요.<br><br>
			
		</div>
		
		<br>
	
		<div class="hr_sect"> Information </div>
		
		<br>
		<br>
	    <div class="mb-3">
	      <input type="text" id="name" class="btn_login_no1" placeholder="이름" name="name">
	    </div>
	    
	    <div class="mb-3">
	      <input type="email" id="mail" class="btn_login_no1" placeholder="이메일" name="mail">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="phone" class="btn_login_no1" placeholder="휴대폰" name="phone">
	    </div>
	   	<br><br>
	    <div class="d-grid gap-2">
  			<input class="btn" type="submit" value="확인" id='findId'>
		</div>
	    <br><br>
	    

		
	
		<br>
		<div class="wqb_write2">
		저희 서비스를 이용하는 사람이 회원님의 연락처<br>
		정보를 Again Marcket에 업로드했을 수도 있습니다.<span class="rr"><br>
		더 알아보기</span>
		</div>
		
	</form>
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