<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">
<title>help</title>
<style>
p{
font-size: 14px;
width: 480px;
color:#6a6a6b
}
</style>

</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>

<div class="pointshop_List" style="padding-top:50px;padding-left:520px;position: relative;z-index: 1;">

<div class="card" style="width: 831px; height:750px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:80px; ">

<!-- 가이드시작 -->

<div class="row">

  <div class="col-4" >
  
    <div id="list-example" class="list-group" style="margin-right: 50px;">
      <a class="list-group-item list-group-item-action" href="#list-item-1">가입하기</a>
      <a class="list-group-item list-group-item-action" href="#list-item-2">회원가입</a>
      <a class="list-group-item list-group-item-action" href="#list-item-3">회원탈퇴</a>
      <a class="list-group-item list-group-item-action" href="#list-item-4">이미 가입된회원</a>
      <a class="list-group-item list-group-item-action" href="#list-item-5">point</a>
    </div>
  </div>
  <div class="col-8" >
    <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0"  style=" overflow:auto;height: 720px;width:540px;">
       <h4 id="list-item-1" class="list">가입하기</h4><br>
      <p>
     	&nbsp;&nbsp;참고: Again mark의 계정을 만들려면 만 14세 이상이어야 합니다.<br>
		&nbsp;&nbsp;모바일 기기 또는 데스크톱에서 회원가입을 통하여 Again mark 계정을 만들 수 있습니다.<br>
		&nbsp;&nbsp;시작하기 전에
		회원가입으로 가입할 경우 회원님만 액세스할 수 있는 정보를 선택하여 올바르게 입력하세요.<br>
		회원님이 사용하는 정보가 개인 정보와 같이 장기간 액세스할 정보인지 확인하세요. &nbsp;&nbsp;이러한 확인이 필요한 이유는 로그아웃 후 비밀번호를 잊은 경우 Again mark 계정에 다시 로그인하려면 정보에 액세스할 수 있어야 하기 때문입니다.
		<br>&nbsp;&nbsp;이메일 주소 또는 휴대폰 번호가 없는 경우 Again mark 계정을 만들 수 없습니다.
		계정 만들기
		참고: 새로운 계정을 만들면 Again mark 사용자들이 회원님이 새로운 계정을 만들었음을 볼 수 있습니다.
 	</p><br><br><br>

      <h4 id="list-item-2" >회원가입</h4><br>
      <p class="list">
      	&nbsp;&nbsp;개인회원 또는 사업자회원으로 가입이 가능합니다.<br>
    	&nbsp;&nbsp;개인회원 또는 사업자회원 가입을 원하시면 이메일 인증을 완료 후 가입해주세요.<br>
		→<a href="join"> Again mark 회원가입 바로가기</a>
	</p><br><br><br>
      <h4 id="list-item-3" class="list">회원탈퇴</h4><br>
      <p class="list">
     	&nbsp;&nbsp;회원 탈퇴는 "Again mark의 HOME > 더보기 > [회원탈퇴]"를 통해 진행하실 수 있습니다.<br>
		&nbsp;&nbsp;* Again mark 어플등의 모바일 환경에서는 마이페이지내 프로필 이미지 수정 아이콘을 선택하시면
 		회원정보 수정 메뉴로 이동 됩니다. 감사합니다.
 	</p><br><br><br>
      
      <h4 id="list-item-4" class="list">이미 가입된 회원</h4><br>
      <p>    &nbsp;&nbsp; 회원님 본인인증정보로 회원가입이 되어있는 경우 '이미 가입되어 있는 정보입니다' 라고 안내 됩니다.<br>

     &nbsp;&nbsp;아이디 찾기에서 휴대폰인증/아이핀인증 및 이메일 인증을 통하여 회원님의 본인인증정보로 가입된 아이디를 확인하실 수 있습니다.
		<br>
     →<a href="findId"> Again mark 아이디 찾기 바로가기</a></p><br><br><br>
      <h4 id="list-item-5" class="list">Point</h4><br>
      <p>
      &nbsp;&nbsp;포인트는 회원님의 Again mark의 여러가지 활동으로 모으실 수 있습니다.<br>
      &nbsp;&nbsp; 포인트 지금은 첫회 회원가입시 200p 를 지급합니다. 또한 게시글 작성시 200p를 지급하며, 댓글은 5p,
      예약 확정시 판매자와 구매자 모두에게 500p 를 지급합니다.<br> 
       &nbsp;&nbsp;만약 예약 확정 전 게시글 삭제시 포인트는 회수하게 됩니다.<br>
       &nbsp;&nbsp;보유하신 포인트는 포인트샵에서 상품을 구매하실때 사용하실 수 있으며 상품구매시 해당 포인트는 구매하신 상품 만큼 차감됩니다.<br>
     	
 	</p><br><br>
    </div>
  </div>



<!-- 가이드끝 -->
</div>
</div>



</div>
</div>

<%@ include file="include/footer.jsp" %>
</body>
</html>