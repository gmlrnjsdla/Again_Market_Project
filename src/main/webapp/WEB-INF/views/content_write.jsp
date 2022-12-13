<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_write/content_write.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>


<div class="content_write_form01">
<div class="card" style="width: 400px; height:700px; border:1px solid #dddddd; border-radius:5px;">
  <div class="card-body"> 
 	<!-- 컨텐츠 헤더 -->
  	<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/img/content.jpg" alt="..." width="120" height="120" ></td>
  		 <button type="button" class="btn btn-outline-secondary" 
          style="--bs-btn-padding-y: .10rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
  		 프로필편집
		</button>
   		
  
  		
   		<!-- 컨텐츠 리스트 -->
   		<hr>
   		
  			
  			
		</div>
  </div>
</div>	



<div class="content_write_form02">
<div class="card" style="width: 350px; height:700px; border:1px solid #dddddd; border-radius:5px;">
  <div class="card-body"> 
 	<!-- 컨텐츠 헤더 -->
  	<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/img/content.jpg" alt="..." width="120" height="120" ></td>
  		 <button type="button" class="btn btn-outline-secondary" 
          style="--bs-btn-padding-y: .10rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
  		 프로필편집
		</button>
   		
  
  		
   		<!-- 컨텐츠 리스트 -->
   		<hr>
   		
  			
  			
		</div>
  </div>
</div>	

<%@ include file="include/footer.jsp" %>

</body>
</html>