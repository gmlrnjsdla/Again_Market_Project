<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>



<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rightBar/rightBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/tradeView/tradeView.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/timePicker/jquery.datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/timePicker/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/address/address.js"></script>

<title>#### 포인트 구매신청 ####</title>
</head>
<body>


<form name="address_frm" action="pointshop_completed">

<div class="content" style="width: 630px; ">
<div class="card" style="width: 630px;margin-top:130px;">
<div class="card-body" style="width: 630px;">

<span class="list_index02">구매자정보</span>
<hr class="garo1">
   
    <span class="input-group">
      <div class="input-group-text">아이디</div>
       <label class="form-control" for="autoSizingInputGroup">${minfo.id}</label>
    <div class="input-group-text">닉네임</div>
       <label class="form-control" for="autoSizingInputGroup">${minfo.nick}</label>
    </span>
    <br>
    
    <span class="input-group">
      <div class="input-group-text">상품명</div>
      <input type="hidden" value="${sDto.title}" name="title">
       <label class="form-control" for="autoSizingInputGroup">${sDto.title}</label>
    <div class="input-group-text">차감포인트</div>
       <label class="form-control" for="autoSizingInputGroup">-${sDto.spoint}</label>
    </span>
    <br>
   
     <div class="input-group">
      <div class="input-group-text">전화번호</div>
       <label class="form-control" for="autoSizingInputGroup">${minfo.phone}</label>
    </div>
    <br>
    
     <div class="input-group">
      <div class="input-group-text">이메일</div>
       <label class="form-control" for="autoSizingInputGroup">${minfo.mail}</label>
    </div>
    <br>
    
    
    <div class="input-group">
      <div class="input-group-text">배송 주소</div>
       <input type="text" class="form-control" for="autoSizingInputGroup" placeholder="배송주소입력" name="address">
    </div>

	<input type="hidden" name="point" value="${sDto.spoint}">

    <br><br>
    <span><input type="button" onclick="addressCheck()" class="btn btn-outline-primary" value = "구매확인"style=" width: 30%; font-size: 15px; height: 40px;float: left;margin-left: 80px;"></span>
    
    <a href="pointshop?id=<%=sid %>" class="nav-link link-dark">
    <span><button type="button" class="btn btn-outline-primary" style=" width: 30%; font-size: 15px; height: 40px;float: right;margin-right: 80px;" onclick="script:window.location='/index'">구매 취소</button></span>
  	</a>


</div>
</div>
</div>
</form>
<br>
<br>
<br>

<%@ include file="include/footer.jsp" %>
</body>
</html>