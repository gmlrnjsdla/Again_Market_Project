<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<div class="content_List">

<div class="card" style="width: 650px; height:700px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:250px; ">
 	<!-- 컨텐츠 헤더 -->
 	
  <table border="0" cellpadding= "0" width="600" height="210">
  	<tr colspan="3">
  		<td width="40%" rowspan="4" align="center">
  			<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/img/content.jpg" alt="..." width="120" height="120" >
  		</td>
  		<td height="20%" colspan="3">
  			<div class = "profile01"><%=sid %>
	   		<a href="memberModify"> 
		   		<button type="button" class="btn btn-outline-secondary" 
		          style="--bs-btn-padding-y: .10rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="memberModify">
		  		 프로필편집
				</button>
			</a>
			</div>
   		</td>
  	</tr>
  	<tr height="10%">
  		<td class = "profile02">게시물 4</td>
  		<td class = "profile02">팔로워74</td>
  		<td class = "profile02">팔로우 100</td>
  	</tr>
  	<tr>
  		<td class = "profile02" height="15%" colspan="3">${nick}</td>
  	</tr>
  	<tr>
  		<td class = "profile03" height="15%" colspan="3">github.com/gmlrnjsdla</td>
  	</tr>
   </table>
   </div>
  	<hr width="630" align="center">
  
  	<div class="overflow-auto" >
  		
   		<!-- 컨텐츠 리스트 -->
   		
   		
 	<div class="row">
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
		<div class="col-md-4"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="60" height="150" class="card-img-top" alt="...">
		<div class = "content_font">오늘은 안녕</div></a></div>
			
			
	</div>
  </div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>