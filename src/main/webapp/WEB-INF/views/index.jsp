<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">


<title>Insert title here</title>
</head>
<body>
<!-- 
<div class="friend" style="width: 630px;">
-->

<!--  상단 친구프로필 -->
<!--  
<div class="card" style="width: 630px; height:150px; border:1px solid #dddddd; border-radius:5px;">

	<c:forEach items="${memberList}" var="mList">
	  <span class="card-body" style="width:105px; display: inline-block;"> 
	   		<img src="${pageContext.request.contextPath }/resources/img/${mList.profile}" width="35" height="35" alt="..."><br>
	   		<span style="font-size:16px; font-weight:bold;">${mList.nick }</span>
	  </span>
	</c:forEach>	
	
</div>
 
</div>
 -->
<c:forEach begin="1" end="2">
<!--게시자 정보 -->

<div class="content" style="width: 630px;">
<div class="card" style="width: 630px;">
<div class="card-body" style="width: 630px;">
<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">게시자 ID<br>
<hr>



<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath }/resources/img/content.jpg" class="card-img-top" alt="...">
    </div>
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath }/resources/img/content.jpg" class="card-img-top" alt="...">
    </div>
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath }/resources/img/content.jpg" class="card-img-top" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>




  
   <!--제목표시 -->
   content:<br>
   오늘하루 참힘들었다.
   <a href="send?nick=${mList.nick }" class="nav-link link-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg>
	</a>
  <hr>
  
  <p class="fs-6"></p>
 	<div style="overflow:auto; width:600px; height:100px;">
  <!--댓글표시 -->  
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
    <p class="card-text">guestID : 참좋아요</p>
   	
    </div>
    <br>
 <!--댓글입력 -->
  	<div class="input-group mb-3">
 		 <input type="text" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="댓글을 입력해 주세요" aria-describedby="button-addon2">
  		 <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="#">댓글입력</button>
	</div>
</div>
</div>
</div>
</c:forEach>
<br>
<br>
<br>
<br>

<%@ include file="include/footer.jsp" %>
</body>
</html>