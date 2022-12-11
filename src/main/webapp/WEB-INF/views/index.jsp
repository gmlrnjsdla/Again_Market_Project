<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<div class="content">


<!--  상단 친구프로필 --> 
<div class="card" style="width: 500px; height:150px; border:1px solid #dddddd; border-radius:5px;">
  <div class="card-body"> 
   	<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="70" height="70" alt="..."><br>
   		<span style="font-size:16px; font-weight:bold;">guestID</span>
  </div>
	
</div>

<!--컨텐츠 사진 -->
<div class="card" style="width: 500px;">
<div class="card-body">
<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">게시자 ID<br>
<hr>
  <img src="${pageContext.request.contextPath }/resources/img/content.jpg" class="card-img-top" alt="...">
  
  
  <div class="card-body">
   content :오늘하루 참힘들었다.
  <hr>
  <p class="fs-6"></p>
  <!--댓글표시 -->
    
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    
  </div>
  <div class="hstack gap-3">
	  <input class="form-control me-auto" type="text" placeholder="댓글 입력 ..." aria-label="">
	  <button type="button" class="btn btn-light">edit</button>
	  
</div>
</div>
</div>

</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>