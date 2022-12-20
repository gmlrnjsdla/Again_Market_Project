<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sidebar/sidebar.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<style>
	
	form{
		padding:20px;
		padding-top:30px;
	}
	input{
		width:100px;
	}
	
	
</style>


<title>Insert title here</title>
</head>
<body>
<%@ include file="../include/leftBar.jsp" %>


<div class="card" style="margin-top:200px; margin-bottom:300px; margin-left:680px; width: 520px; height:300px; border:1px solid #dddddd; border-radius:5px;">
<form action="/message_send">
  <div class="row mb-3">
  	<input type="hidden" name="room" value=0>
    <label for="inputEmail3" class="col-sm-2 col-form-label">닉네임</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" name="othernick" value="${rnick}" readonly="readonly" >
    </div>
  </div>
  <div class="row mb-3">
    <label for="inputPassword3" class="col-sm-2 col-form-label">내용</label>
    <div class="col-sm-10">
      <textarea class="form-control" id="inputPassword3" cols="10" rows="5" name="content"></textarea>
    </div>
  </div>
  
  
  <button type="submit" class="btn btn-primary">보내기</button>
</form>
</div>



<%@ include file="../include/footer.jsp" %>
</body>
</html>