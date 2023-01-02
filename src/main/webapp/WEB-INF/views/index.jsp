<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">

<title>#### MAIN ####</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>


<c:forEach items="${postList }" var="pList" varStatus="status">

<div class="content" style="width: 630px;">
<div class="card" style="width: 630px;">
<div class="card-body" style="width: 630px; ">


<!-- 이미지	-->


<div id="carouselExampleDark" class="carousel carousel-dark slide"  data-bs-ride="true" style="height:400px; width:600px;overflow: auto;" >
  
  <center>
  <div  >
    <c:forEach items="${postUrlList }" var="pUrlList" >
		<c:if test="${pList.postidx == pUrlList.postidx}">
		    <div >
			<img src="/resources/uploadfiles/${pUrlList.fileName}" style="width:570px;" >
		    </div>
       	</c:if>
	</c:forEach>
  </div>
  </center>
  
</div>



<!--이미지 끝	-->	



<!--게시자 정보 -->
<div class="dropdouwn">
		      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		        <span style="font-size:20px; font-weight:bold;">
		        	<img class ="rounded-circle me-2"  src="/resources/uploadfiles/${pList.profileName}" width="40" height="40" alt="..." style="margin-top:13px;">${pList.nick}
		        </span>
		      </a>
		      <ul class="dropdown-menu text-small shadow">
		        <li><a class="dropdown-item" href="sell_List?id=${pList.id}">프로필 가기</a></li>

		      </ul>
</div>


<!--찜하기 버튼 -->   
   <span class="like_button">
   찜하기<a href="follow?followid=<%=sid%>&followcontent=${pList.postidx}">

   <button type="button" class="btn  position-relative">
    <img src="${pageContext.request.contextPath }/resources/img/hearts.png" width="20" height="20" alt="...">
     <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
     	${countList.get(status.index)}
   </span>
   </button>
   </a>
   </span>
   <hr>
   
	</div> 

   <!--제목표시 -->
   <div class="subject_font">
   ${pList.title}
   
   <!--판매중/판매완료 표시 -->
 
   
   <c:choose>
	   <c:when test="${pList.buyflag == 0 and pList.sellflag == 0}">
		   	<button type="button" class="btn btn-primary" disabled 
		   		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">판매중</button>
		</c:when>
		
		<c:when test="${pList.buyflag != 0 and pList.sellflag != 0}">
			<button type="button" class="btn btn-secondary" disabled
				style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">예약완료</button>
		</c:when>
		
		<c:when test="${pList.buyflag != 0 and pList.sellflag == 0}">
			<button type="button" class="btn btn-success" disabled
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">예약 확인중</button>
		</c:when> 
		
		<c:otherwise>

		</c:otherwise>
		
	</c:choose>
   <!--판매중/판매완료 표시 끝 -->
   </div>
   <div class="content_font_index01">
   ${pList.type} ∙ 
   <c:forEach items="${dList}" var="dList">
	   <c:if test="${dList.postidx == pList.postidx }">
	   	${dList.createdate}
	   </c:if>
   </c:forEach>일 전<br>
  
   <fmt:formatNumber value="${pList.price}" pattern="#,###,###,###"/>원

  
  
  

	</div>
	<div class="content_font_index02">
   거래장소: ${pList.tradeplace}
  </div>
  <hr>
  <div class="content_font_index" style="height:50px;">
  	${pList.content}
  </div>


<br>
<br>
<!--구매신청 버튼 --> 
<c:choose>
	<c:when test="${pList.id != sid and pList.buyflag == 0 and pList.sellflag == 0}">
		<a href="buy_tradeView?postidx=${pList.postidx }" >
	  		<button type="button" class="btn btn-outline-danger"
	        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 628px; ">
	  			예약신청
			</button>
		</a>
	</c:when>

	<c:when test="${pList.id == sid and pList.buyflag != 0 and pList.sellflag == 0}">
	
		<a href="sell_tradeView?postidx=${pList.postidx }" >
	  		<button type="button" class="btn btn-outline-success"
	        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 628px; ">
	  			예약확정
			</button>
		</a>
	</c:when>

	<c:when test="${pList.buyuser == sid and pList.buyflag != 0 and pList.sellflag == 0}">
		<a href="buy_cancel?postidx=${pList.postidx}" >
		<button type="button" class="btn btn-outline-primary"
	        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 628px; ">
	  			예약취소
		</button>
		</a>
	</c:when>
	
	<c:otherwise>
	</c:otherwise>
	
</c:choose>
  
  
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