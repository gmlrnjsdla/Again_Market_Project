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
<div class="card" style="width: 400px; height:700px; border:1px solid #dddddd; border-radius:5px; background-color:#FBFBFB ">
  <div class="card-body" > 
 	<!-- 컨텐츠 사진입력 -->
  	<img class="image_align" src="${pageContext.request.contextPath }/resources/img/add_image.png" alt="..." width="75" height="75" onclick=document.all.file.click();></td>
  	
 	<input type="file" name="file" id="file" style="display: none;"/>  
	</div>
  </div>
</div>	

<!-- 컨텐츠 내용입력 -->

<div class="content_write_form02">
<div class="card" style="width: 350px; height:700px; border:1px solid #dddddd; border-radius:5px;">
  <div class="card-body"> 

	<div class="form-floating">
  	<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height:600px" ></textarea>
  	<label for="floatingTextarea">내용입력</label><br>
  	<button type="button" class="btn btn-outline-secondary" style="float:right" onclick="#">입력</button>
	</div>
 
  

	</div>
  </div>
</div>	

<%@ include file="include/footer.jsp" %>

</body>
</html>