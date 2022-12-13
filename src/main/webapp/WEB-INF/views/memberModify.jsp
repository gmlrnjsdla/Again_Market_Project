<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/memberJoin/memberModify.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
	<div class="recommend">
	<div class="card" style="width: 700px; height:820px; border:1px solid #dddddd; border-radius:5px;">

		<div class="card-body" style="margin-left: 5%;"> 
			<div style="display:inline-block;vertical-align:top;">
				<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">
			</div>
			<div style="display:inline-block; ">
				&nbsp;&nbsp;&nbsp;본인아이디 ID<br>&nbsp;&nbsp;
			<a href="profil">프로필 사진변경</a>
			</div>
	  		<br>
	  	</div>
	  	<!-- 이름 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">이름</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" placeholder="ex)홍길동" style="width:480px;">
  		</div>
		</div>
	  	<div class="col-auto">
	    	<div class="form-text" style="margin-left: 20%; margin-right: 15%;">
	      		사람들이 이름, 별명 또는 비지니스 이름 등 회원님의 알려진 이름을 사용하여 회원
	      		계정을 찾을 수 있도록 도와주세요. 이름은 14일 안에 두 번만 변경할 수 있습니다.<br><br><br>
	    	</div>
	  	</div>
	  	<!--  이름끝 -->
	  	
	  	<!-- 사용자 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">사용자 이름</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" placeholder="GilDong85" style="width:480px;">
  		</div>
		</div>
	  	<div class="col-auto">
	    	<div class="form-text" style="margin-left: 20%; margin-right: 15%;">
	      		대부분의 겨우 이후 14일 동안 사용자 이름을 다시 <!-- ${id} -->(으)로 변경할 수 있습니다.<br><br><br>
	    	</div>
	  	</div>
	  	<!--  사용자끝 -->
	  	
	  	<!-- 소개 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">소개</label>
 		<div class="col-sm-10">
    		<textarea class="form-control" aria-label="With textarea" style="width:480px;"></textarea> 
  		</div>
		</div>
	  	<!--  소개 끝 -->
	  	
	  	<div class="form-text" style="margin-left: 17%; margin-right: 15%;">
	      		<br>
	      		<h5>개인정보</h5>
	      		비즈니스나 반려동물 등에 사용된 계정인 경우에도 회원님의 개인 정보를 입력하세요. 
	      		공개 프로필에는 포함되지 않습니다. <br><br>
	    	</div>
		
		<!-- 이메일 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">이메일</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" placeholder="hong@naver.com" style="width:480px;">
  		</div>
		</div>
	  	<!--  이메일끝 -->
  		
  		<!-- 전화번호 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">전화번호</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" placeholder="010-7777-7777" style="width:480px;">
  		</div>
		</div>
	  	<!--  전화번호끝 -->
  		
  		<!-- 성별 -->
		<div class="row mb-3">
  			<label for="colFormLabel" class="col-sm-2 col-form-label">성별</label>
 		<div class="col-sm-10">
    		<input type="text" class="form-control" id="colFormLabel" placeholder="ex) 남(자) or 여(자)" style="width:480px;">
  		</div>
		</div>
	  	<!--  성별끝 -->
	  	<center>
		<input type="submit" class="btn btn-primary" disabled style="width:100px;margin-bottom: 20px;" value="수정"></button>
		<button type="reset" class="btn btn-secondary" disabled style="margin-bottom: 20px;"> 취소</button>
		</center>
	</div>
	</div>
	</div>
</body>
</html>