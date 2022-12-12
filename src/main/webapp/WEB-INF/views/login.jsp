<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login/login.css">

</head>
<body>
<center>
	<div class="login_outbox">
	<form>
	<div class="login_no1">
			<img id="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"
			 width="350" height="180" align="center" border="0">
	
	    <div class="mb-2">
	      <input type="text" id="#" class="btn_login_no1" placeholder="전화번호, 사용자 이름 또는 이메일">
	    </div>
	    <div class="mb-3">
	      <input type="text" id="#" class="btn_login_no1" placeholder="비밀번호">
	    </div>
	    
	    <div class="mb-3">
	      
	    </div>
		 <div class="d-grid gap-2">
  			<input class="btn" type="button" value="로그인"/>
		</div>
		<div>
			<input class="btn_searchId" type="button" value="아이디 찾기"/>
		</div>
		<div>
			<input class="btn_searchPw" type="button" value="비밀번호 찾기"/>
		</div>
	</form>
		
	</div>
	<div>
		<input class="btn_member_jion" type="button" value="회원가입 하기"/>
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