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


<div class="content_write_form01">
<div  class="card" style="width: 400px; height:700px; border:1px solid #dddddd; border-radius:5px; background-color:#FBFBFB ">
  	
  	<div class="card-body">
  	<img src="${pageContext.request.contextPath }/resources/img/profile01.jpg" width="50" height="50" alt="...">게시자 ID
	
	
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
	<div>
	가을이 깊어가면서 온산의 나뭇잎들이 울긋불긋 물들어가고 있다. 2010년 전국 단풍 홍보대사를 뽑는 날, 단풍잎들은 서로 자기가 더 예쁘다며 
	자신을 홍보대사로 추천하는데···. 단풍잎 : 가을을 대표하는 절세미인 하면 푸른 잎을 붉게 물들인 나 단풍잎이지! 아름다운 여자의 얼굴을 묘사할 
	때 쓰이는 ‘녹빈홍안(綠鬢紅顔)’이라는 사자성어 들어봤지?윤이 나는 검은 머리와 고운 얼굴이라는 뜻인데, 오죽하면 고운 얼굴을 붉을 ‘홍’자로 표현했을까~ 
	은행잎 : 흥, 노랗게 물들인 내 잎들을 보고도 그
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
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	<div class="content_font01" >ShinDongHun:
	<span class="content_font02" >여자가 참이쁘네요</span></div>
	<div class="content_font01" >Hwang:
	<span class="content_font02">이쁘긴요 제여자친구 인데요</span></div>
	
	
	
	</div>
	</div>
	

  	<div class="input-group mb-3">
 		 <input type="text" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="댓글을 입력해 주세요" aria-describedby="button-addon2">
  		 <button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글입력</button>
	</div>
	
 
  

	</div>
  </div>
</div>	

<%@ include file="include/footer.jsp" %>

</body>
</html>