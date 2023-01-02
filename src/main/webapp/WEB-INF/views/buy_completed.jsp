<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#### 거래완료 ####</title>
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rightBar/rightBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/tradeView/tradeView.css">

</head>
<body>
<div class="content" style="width: 630px;">
<div class="card" style="width: 630px;">
<div class="card-body" style="width: 630px;">

<center>
<br><br><br><br>
<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
</svg>
<br><br><br><br>
<h3> ${nick } 님과의 예약신청이 <br><br>정상적으로 완료되었습니다.</h3>
<br><br>
<h4>예약날짜 : ${date }</h4>
<br><br><br><br><br><br>

<button type="button" class="btn btn-outline-secondary" style=" width: 310px;" onclick="script:window.location='send?nick=${nick}'">판매자 연결</button>
<br><br>
<button type="button" class="btn btn-outline-secondary" style=" width: 310px;" onclick="script:window.location='index'">다른 물품 보러가기</button>

</center>
</div>
</div>
</div>

<br>
<br>
<br>

<%@ include file="include/footer.jsp" %>



</body>
</html>