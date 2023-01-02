<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">
<title>help</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>


<div class="content_List">

<div class="card" style="width: 650px; height:750px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:150px; ">
<div class="row">
  <div class="col-4">
    <div id="list-example" class="list-group">
      <a class="list-group-item list-group-item-action" href="#list-item-1" style="">회원탈퇴</a>
      <a class="list-group-item list-group-item-action" href="#list-item-2">회원가입</a>
      <a class="list-group-item list-group-item-action" href="#list-item-3">이미 가입된회원</a>
      <a class="list-group-item list-group-item-action" href="#list-item-4">메세지</a>
    </div>
  </div>
  <div class="col-8">
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
      <h4 id="list-item-1">회원탈퇴</h4>
      <p>
     	회원 탈퇴는 "Again mark의 HOME > 더보기 > [회원탈퇴]"를 통해 진행하실 수 있습니다.
		* Again mark 어플등의 모바일 환경에서는 마이페이지내 프로필 이미지 수정 아이콘을 선택하시면
 		회원정보 수정 메뉴로 이동 됩니다. 감사합니다.
	 </p>
      <h4 id="list-item-2">회원가입</h4>
      <p>
      	개인회원 또는 사업자회원으로 가입이 가능합니다.
    	개인회원 또는 사업자회원 가입을 원하시면 이메일 인증을 완료 후 가입해주세요.<br>
		→<a href="join"> Again mark 회원가입 바로가기</a></p>
      <h4 id="list-item-3">이미 가입된 회원</h4>
      <p>     회원님 본인인증정보로 회원가입이 되어있는 경우 '이미 가입되어 있는 정보입니다'라고 안내 됩니다.

     아이디 찾기에서 휴대폰인증/아이핀인증 및 이메일 인증을 통하여 회원님의 본인인증정보로 가입된 아이디를 확인하실 수 있습니다.

 

      > 아이디 찾기 바로가기</p>
      <h4 id="list-item-4">메세지</h4>
      <p>...</p>
    </div>
  </div>
</div>

  

</div>


</div>
</div>


<%@ include file="include/footer.jsp" %>
</body>
</html>