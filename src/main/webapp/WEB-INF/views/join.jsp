<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#### 회원가입 ####</title>

<link rel="stylesheet" href="	https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/join.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join/join.js"></script>

</head>
<body>
<center>
	<div class="login_outbox">
	<form action="joinOk" method="post" name="join_frm">
	<div class="login_no1">
			<img id="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"
			 width="320" height="160" align="center" border="0" style="margin:35px 0 20px 0;">
		<div class="wqb_write">
			친구들의 사진과 동영상을 보려면<br>
			가입하세요.
		</div>
		
		<div class="facebook">
  			<a href="https://ko-kr.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png"
		 	width="330" height="35" align="center" border="0"></a>
		</div><br>
		
		<div class="hr_sect">또는</div>
		<div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="아이디" name="id">
	    </div>
		<div class="mb-3">
	      <input type="password" id="#" class="btn_login_no1" placeholder="비밀번호" name="pwd">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="이름" name="name">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="생일 (ex:20221215)" name="birth">
	    </div>
	    <div class="mb-3">
	      <input type="email" id="#" class="btn_login_no1" placeholder="이메일" name="mail">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="휴대폰" name="phone">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="닉네임" name="nick">
	    </div>
		<div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="소개글" name="greet">
	    </div>
	    
		<div class="wqb_write2">
		저희 서비스를 이용하는 사람이 회원님의 연락처<br>
		정보를 Instagram에 업로드했을 수도 있습니다.<span class="rr">더<br>
		알아보기</span>
		</div>
		 <div class="d-grid gap-2">
  			<input class="btn" type="button" value="가입" onclick="joinCheck()">
		</div>
	</form>
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