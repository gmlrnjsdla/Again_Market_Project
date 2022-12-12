<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login/join.css">

</head>
<body>
<center>
	<div class="login_outbox">
	<form>
	<div class="login_no1">
			<img id="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"
			 width="350" height="180" align="center" border="0">
		<div class="wqb_write">
			친구들의 사진과 동영상을 보려면<br>
			가입하세요.
		</div>
		
		<div class="facebook">
  			<a href="https://ko-kr.facebook.com/"><img src="${pageContext.request.contextPath}/resources/img/facebook.png"
		 	width="330" height="35" align="center" border="0"></a>
		</div>
		
		<br>또는
	    <div class="mb-2">
	      <input type="text" id="#" class="btn_login_no1" placeholder="휴대폰 번호 또는 이메일 주소">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="성명">
	    </div>
		<div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="사용자 이름">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="비밀번호">
	    </div>
		<div class="wqb_write2">
		저희 서비스를 이용하는 사람이 회원님의 연락처<br>
		정보를 Instagram에 업로드했을 수도 있습니다.<span class="rr">더<br>
		알아보기</span>
		</div>
		 <div class="d-grid gap-2">
  			<input class="btn" type="button" value="가입"/>
		</div>
	</form>
	</div>
	<div class="btn_member_jion">
		계정이 있으신가요?<a href="/login">로그인</a>
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