<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_write/content_write.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_view/content_view.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">

<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>


	

<div class="content_write_form01">
<div  class="card" style="width: 600px; height:800px; border:1px solid #dddddd; border-radius:5px; background-color:#FBFBFB ">
  	
 	<div class="overflow-auto" style="height: 950px;">
   
 	<!-- 컨텐츠 사진출력 -->
 	<div class="content_img" >
 	<c:forEach items="${postUrlList}" var="pList">
 		<c:if test="${pList.postidx == post.postidx }">
			<img src="${pageContext.request.contextPath }/resources/uploadfiles/${pList.fileName}" width="580" height="520"  alt="..." >
		</c:if>
	</c:forEach>
	
 	</div >

	</div>
<hr>
	<div class="overflow-auto" style="height: 450px;">

  	<div class="subject_font01">
	

	
   <!--제목표시 -->
   
  &nbsp;&nbsp; ${post.title}
 
 
   <!--판매중/판매완료 표시 -->


	<button type="button" class="btn btn-danger" style="height: 30px; padding: 4px; font-size:14px; margin-left: 15px; ">
	<fmt:formatNumber value="-10000" pattern="#,###,###,###"/>p</button>


   <!--판매중/판매완료 표시 끝 -->
   
 <hr>
  	<div class="content_font_index" style="height:100px;">
  		${post.content}
  	</div>
</div> 

<!--구매확인/판매확인 버튼 --> 

   <c:choose>
	   <c:when test="${post.id == sid}">
		   	<a href="pointshop_tradeView?postidx=${post.postidx}">
		  	<button type="button" class="btn btn-outline-danger"
		        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 598px; ">
		  		구 매
			</button></a>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
		
	</c:choose>

<!--구매확인/판매확인 버튼 끝 -->
  
</div>
</div>
</div>
 
<!-- 컨텐츠 댓글출력 -->


<%@ include file="include/footer.jsp" %>

</body>
</html>