<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">




<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rightBar/rightBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/tradeView/tradeView.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/timePicker/jquery.datetimepicker.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/timePicker/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/date/date.js"></script>


<script type="text/javascript">


      <!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datetimepicker({
                 
                 dateFormat: "yy-mm-dd",
                 
                 onClose: function() {    
                     
                 }    
 
            });
            
            
               
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>



<title>#### 예약신청 ####</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>

<form action="buy_completed" name="date_frm">

<div class="content" style="width: 630px;">
<div class="card" style="width: 630px;">
<div class="card-body" style="width: 630px;">

<span class="list_index02">판매자정보</span>
<hr class="garo1">
   
    <span class="input-group">
      <div class="input-group-text">아이디</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.id}</label>
    <div class="input-group-text">닉네임</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.nick}</label>
    </span>
     <span class="input-group">
      <div class="input-group-text">전화번호</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.phone}</label>
    </span>
     <div class="input-group">
      <div class="input-group-text">이메일</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.mail}</label>
    </div>
  	<br><br>

   <span class="list_index02">거래정보</span>
<hr class="garo1">
   
    <span class="input-group">
      <div class="input-group-text">제목</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.postDto.title}</label>
    <div class="input-group-text">종류</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.postDto.type}</label>
    </span>
     <span class="input-group">
      <div class="input-group-text">가격</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.postDto.price}</label>
    </span>
     <div class="input-group">
      <div class="input-group-text">거래장소</div>
       <label class="form-control" for="autoSizingInputGroup">${pinfo.postDto.tradeplace}</label>
    </div>
   <br><br>
   
 <span class="list_index02">구매자정보</span>
<hr class="garo1">
   
    <span class="input-group">
      <div class="input-group-text">아이디</div>
       	<label class="form-control" for="autoSizingInputGroup">${minfo.id}</label>
      <div class="input-group-text">닉네임</div>
       	<label class="form-control" for="autoSizingInputGroup">${minfo.nick}</label>
    </span>
    <span class="input-group">
      <div class="input-group-text">전화번호</div>
       <label class="form-control" for="autoSizingInputGroup">${minfo.phone}</label>
    </span>
      <div class="input-group">
      <div class="input-group-text">이메일</div>   
       <label class="form-control" for="autoSizingInputGroup">${minfo.mail}</label>
      </div>
      <div class="input-group">
      <div class="input-group-text">거래희망날짜</div>   
       <label class="form-control" for="autoSizingInputGroup">
       		<input type="hidden" name="postidx" value="${pinfo.postDto.postidx }">
       		<input type="hidden" name="nick" value="${pinfo.nick }">
       		<input type="hidden" name="buyuser" value="${minfo.id }">
       		<input type="text" id="pickDate" autocomplete="off" name="selectedDate">
       </label>
       
      </div>
    <br><br>
    <span><input type="button" onclick="dateCheck()" class="btn btn-outline-primary" value = "예약 신청"style=" width: 30%; font-size: 15px; height: 40px;float: left;margin-left: 80px;"></span>
    <span><button type="button" class="btn btn-outline-primary" style=" width: 30%; font-size: 15px; height: 40px;float: right;margin-right: 80px;" onclick="script:window.location='index'">예약 신청 취소</button></span>
  


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