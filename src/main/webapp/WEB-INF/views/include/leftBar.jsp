<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sidebar/sidebar.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">

<style>
	a{
		color:black
	}
</style>

<title>Insert title here</title>
</head>
<body>

	<%
		String sid = (String) session.getAttribute("sessionId");
		
	%>


	<div class="sidebar">
	<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 270px; height:800px; border:1px solid #dddddd; border-radius:15px;">
	
    <a href="index"><span class="title"><img src="${pageContext.request.contextPath}/resources/img/logo.png" 
    	width="200"  align="center" style="margin:10px 0 5px 0;"></span></a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
    	
      <li class="nav-item">
        <a href="index" class="nav-link link-dark" aria-current="page"> <!-- nav-link active 파랑칠 -->
          <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-house-door-fill" viewBox="0 0 16 16"><path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"/></svg>
          <span style="font-size:20px; font-weight:bold;">&nbsp;홈</span>
        </a>
      </li>
      <br>
      
      <!--##################################### 검색 #####################################-->
      <li class="nav-item">
     	<div class="dropend">
	     <a href="#offcanvasExample1" class="d-flex align-items-center link-dark text-decoration-none" data-bs-toggle="offcanvas" role="button" aria-controls="offcanvasExample">
			  <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg>
	            <span style="font-size:20px; font-weight:bold;">&nbsp;회원 목록</span>
	 	 </a>
	 	</div>
 	 </li>

 	<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample1" aria-labelledby="offcanvasExampleLabel">
  		<div class="offcanvas-header">
    		<h5 class="offcanvas-title" id="offcanvasExampleLabel">
    		<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16"><path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/></svg>
    		회원 목록 
    		</h5>
    		<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  		</div>
  	<div class="offcanvas-body">
  		<ul class="text-small flex-column" style="overflow: auto">
    	
    	<br>
  		<c:forEach items="${memberList}" var="mList">
	       
	        <div class="dropdouwn">
		      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		        <span style="font-size:20px; font-weight:bold;">
		        	<img src="${pageContext.request.contextPath }/resources/uploadfiles/${mList.profileName}" alt="" width="23" height="23" class="rounded-circle me-2">${mList.nick}
		        </span>
		      </a>
		      <ul class="dropdown-menu text-small shadow">
		        <li><a class="dropdown-item" href="sell_List?id=${mList.id}">프로필 가기</a></li>
		        <li><a class="dropdown-item" href="send?nick=${mList.nick }">메시지 보내기</a></li>
		        
		      </ul>
		    </div>
    	</c:forEach>
    	</ul>
  	</div>
	</div>
      <!--##################################### 검색 끝 ##################################### -->
      
      <br>
      <li class="nav-item">
        <a href="sell_List?id=<%=sid %>" class="nav-link link-dark">
          <img src="${pageContext.request.contextPath}/resources/img/person.png" alt="" width="23" height="23" class="rounded-circle me-2">
          <span style="font-size:20px; font-weight:bold;">프로필</span>
          
         <!--##################################### 구매요청 뱃지 ##################################### -->

          <c:if test="${buyrequestCount > 0 }">
			<span class="col-2 ">
				<span class="badge bg-danger">구매요청(${buyrequestCount })</span>
			</span>
		  </c:if>  

        <!--##################################### 구매요청 뱃지 끝##################################### --> 
        </a>
      </li>
      <br>

   		
   
      
      
      
      <!--##################################### 메시지 #####################################-->
     <li class="nav-item">
        <a href="message" class="nav-link link-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg>
		  <span style="font-size:20px; font-weight:bold;">&nbsp;메시지</span>
		  <c:if test="${count > 0 }">
			<span class="col-2 ">
				<span class="badge bg-danger">${count }</span>
			</span>
		  </c:if>
        </a>
     </li>
      
      <!--##################################### 메시지 끝 #####################################-->
      
      
      
      <br>
      <li class="nav-item">
        <a href="content_write" class="nav-link link-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
  			<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  			<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
		  </svg>
          <span style="font-size:20px; font-weight:bold;">&nbsp;물품등록</span>
        </a>
      </li>
      <br>
      <li class="nav-item">
        <a href="scheduler" class="nav-link link-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-calendar-heart" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
			</svg>
			  <path d="M6 13c0 1.105-1.12 2-2.5 2S1 14.105 1 13c0-1.104 1.12-2 2.5-2s2.5.896 2.5 2zm9-2c0 1.105-1.12 2-2.5 2s-2.5-.895-2.5-2 1.12-2 2.5-2 2.5.895 2.5 2z"/>
			  <path fill-rule="evenodd" d="M14 11V2h1v9h-1zM6 3v10H5V3h1z"/>
			  <path d="M5 2.905a1 1 0 0 1 .9-.995l8-.8a1 1 0 0 1 1.1.995V3L5 4V2.905z"/>
		  </svg>
          <span style="font-size:20px; font-weight:bold;">&nbsp;내 스케줄</span>
        </a>
      </li>
      <br>
      <li class="nav-item">
        <a href="pointshop?id=<%=sid %>" class="nav-link link-dark">
          <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-bag-fill" viewBox="0 0 16 16"><path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5z"/></svg>
          <span style="font-size:20px; font-weight:bold;">&nbsp;포인트샵</span>
        </a>
      </li>
      <br>
    </ul>
    <hr>
   
    
    <div class="dropup">
      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
        <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
		  <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
		  <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
		</svg>
        <span style="font-size:20px; font-weight:bold;">&nbsp;더보기</span>
      </a>
      <ul class="dropdown-menu text-small shadow">
        <li><a class="dropdown-item" href="memberModify">정보 수정</a></li>
        <li><a class="dropdown-item" href="help">서비스가이드</a></li>
        <li><a class="dropdown-item" href="memberDelete" onclick="return confirm('정말 탈퇴하시겠습니까?')">회원탈퇴</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="logout">로그아웃</a></li>
      </ul>
    </div>
    
    
  </div>
  
  </div>
</body>
</html>