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
			<img src="/resources/uploadfiles/${pUrlList.fileName}" style="width:500px;" >
		    </div>
       	</c:if>
	</c:forEach>
  </div>
  </center>
  
</div>




<!--이미지 끝	-->	



<!--게시자 정보 -->
<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">${pList.nick}

<!--메세지 보내기 --> 
<a href="send?nick=${pList.nick}">
  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg>
</a>

<!--좋아요 버튼 -->   
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

   <!--내용표시 -->
   <div class="subject_font">
   ${pList.title}
   </div>
   <div class="content_font_index01">
   ${pList.type} ∙ 4일 전<br>
   ${pList.price} 원

  
  
  

	</div>
	<div class="content_font_index02">
   거래장소: ${pList.tradeplace}
  </div>
  <hr>
  <div class="content_font_index">
  	${pList.content}
  </div>
  <hr>

<br>
<br>
<!--구매신청 버튼 --> 
<c:choose>
	<c:when test="${pList.id ne sid }">
		<a href="tradeView?postidx=${pList.postidx }" >
	  		<button type="button" class="btn btn-outline-danger"
	        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 630px; ">
	  			구매신청
			</button>
		</a>
	</c:when>
	<c:otherwise>
		<a href="tradeView?postidx=${pList.postidx }" >
	  		<button type="button" class="btn btn-outline-danger"
	        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 630px; ">
	  			판매확정
			</button>
		</a>
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