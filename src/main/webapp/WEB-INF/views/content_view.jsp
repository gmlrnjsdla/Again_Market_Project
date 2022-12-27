<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_write/content_write.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_view/content_view.css">


<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">

	

<div class="content_write_form01">
<div  class="card" style="width: 400px; height:700px; border:1px solid #dddddd; border-radius:5px; background-color:#FBFBFB ">
  	
  	<div class="card-body">
  	<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">${postView.postDto.nick}
	
	
	<!-- 컨텐츠 수정 삭제 드롭다운-->


<span class="setting" >
  <img class="setting" src="${pageContext.request.contextPath }/resources/img/Settings.svg"  type="button" data-bs-toggle="dropdown" aria-expanded="false">

  
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">수정</a></li>
    <li><a class="dropdown-item" href="#">삭제</a></li>
  </ul>
  
</span>


	
	
	<hr>
	</div>
 	<div class="overflow-auto" >
   
 	<!-- 컨텐츠 사진출력 -->
 	<div class="content_img" >
	<img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="365" height="250"  alt="..." >
	<img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="365" height="250"  alt="..." >
 	</div >
 	<hr>


<!--좋아요 버튼 -->   
  <div class="subject_font01">
   <span class="like_button01">
   찜하기<a href="#">
   <button type="button" class="btn  position-relative">
    <img src="${pageContext.request.contextPath }/resources/img/hearts.png" width="20" height="20" alt="...">
     <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+
   </span>
   </button>
   </a>
   </span>
   
   
	 

   <!--내용표시 -->
   
   컴퓨터 판매 합니다
   </div>
   <div class="content_font_index01">
   컴퓨터 ∙ 4일 전<br>
   750000

  
  
  

	</div>
	<div class="content_font_index02">
   거래장소: 인천시 구월동
  </div>
  <hr>
  <div class="content_font_index">
  	6개월 사용하였습니다.
  </div>
  

<br>
<br>
<!--구매신청 버튼 --> 
	<a href="buy_tradeView" >
  <button type="button" class="btn btn-outline-danger"
        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 380px; ">
  구매확인
</button>
	</a>
	<a href="sell_tradeView" >
  <button type="button" class="btn btn-outline-danger"
        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 380px; ">
  판매확인
</button>
	</a>
<!--구매신청 버튼 끝 -->   
</div>
</div>
</div>
  </div>
</div>
<!-- 컨텐츠 댓글출력 -->

<div class="content_write_form02">
<div class="card" style="width: 350px; height:700px; border:1px solid #dddddd; border-radius:5px;">
  <div class="card-body"> 
	<div>댓글목록</div>

		<div class="card" style="width: 320px; height:600px; border:1px solid #dddddd; border-radius:5px; padding:10px;">
		
		<div class="overflow-auto" >
		
		
			   		<%
			   			String id = (String)request.getAttribute("id");
	   				%>
		
		
		
			<c:forEach items="${commentList }" var="commentList" varStatus="status">
				
				
				<c:set var="name" value="<%= id %>" />
					<c:if test="${name ne commentList.id}">
			    		<div class="content_font01" style="font-size: 18px; font-weight:bold; color:green;"> ${commentList.id }
					</c:if>
			    	<div class="content_font01" style="font-size: 18px; font-weight:bold; color:bule;"> ${commentList.id }
				
		         	
		    	 
					
		        
		   
				
			<div class="content_font01" style="font-size: 18px; font-weight:bold; "> ${commentList.id }
				<span class="content_font02" style="font-size: 15px; font-weight:bold;">${commentList.content }</span>
			</div>
			</c:forEach>	
		</div>
			
		</div>
	
	<form action="commentOk">
		<input type="hidden" name="postidx" value="${postView.postidx}">
  			<div class="input-group mb-3">
 		 		<input type="text" name="content" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="댓글을 입력해 주세요" aria-describedby="button-addon2">
  		 		<button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글입력</button>
		</div>
	</form>
 
  

	</div>
  </div>
</div>	

<%@ include file="include/footer.jsp" %>

</body>
</html>