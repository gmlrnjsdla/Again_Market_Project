<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
<%@ include file="include/rightBar.jsp" %>
<div class="friend">


<!--  상단 친구프로필 --> 
<!-- 친구목록 가로정렬이 안됨
<div class="card" style="width: 630px; height:150px; border:1px solid #dddddd; border-radius:5px;">

	<c:forEach items="${memberList}" var="mList">
	  <span class="card-body"> 
	   		<img src="${pageContext.request.contextPath }/resources/img/${mList.profile}" width="35" height="35" alt="..."><br>
	   		<span style="font-size:16px; font-weight:bold;">${mList.nick }</span>
	  </span>
	</c:forEach>	
	
</div>
 -->
</div>
<c:forEach begin="1" end="3">
<!--게시자 정보 -->

<div class="content">
<div class="card" style="width: 630px;">
<div class="card-body">
<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">게시자 ID<br>
<hr>
  <img src="${pageContext.request.contextPath }/resources/img/content.jpg" class="card-img-top" alt="...">


  
   <!--제목표시 -->
   content(subject) :오늘하루 참힘들었다.
  <hr>
  <p class="fs-6"></p>
 
  <!--댓글표시 -->  
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    
 <!--댓글입력 -->
  	<div class="input-group mb-3">
 		 <input type="text" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="댓글을 입력해 주세요" aria-describedby="button-addon2">
  		 <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="#">댓글입력</button>
	</div>
</div>
</div>
</div>
</c:forEach>






<%@ include file="include/footer.jsp" %>
</body>
</html>