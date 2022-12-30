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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index/index.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rightBar/rightBar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/tradeView/tradeView.css">



<script type="text/javascript">


      <!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", rday );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yy-mm-dd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( rday ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", rday );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>



<title>Insert title here</title>
</head>
<body>


<form action="buy_completed">

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
    <!-- 판매자 거래확정 확인 -->
	
	<div class="input-group-text">판매자 확인</div>
       <label class="form-control" for="autoSizingInputGroup">	
     <span class="trade_font01">
     <img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/img/ok.png" alt="..." width="30" height="30" > 판매자 확인 완료
     </span>
     <span class="trade_font02">
     <img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/img/waiting.png" alt="..." width="30" height="30" > 판매자 확인 미완료
     </span>
     </label>	
     <br>
     
     <!-- 판매자 거래확정 확인 끝 -->

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
       		<input type="hidden" name="postidx=${pinfo.postDto.postidx }">
       		<input type="hidden" name="nick=${minfo.nick }">
       		<input type="hidden" name="id=${minfo.id }">
       		<input type="text" id="pickDate" name="selectedDate">
       </label>
      </div>
    <br><br>
    <span><input type="submit" class="btn btn-outline-primary" value = "구매 신청"style=" width: 30%; font-size: 15px; height: 40px;float: left;margin-left: 80px;"></span>
    <span><button type="button" class="btn btn-outline-primary" style=" width: 30%; font-size: 15px; height: 40px;float: right;margin-right: 80px;">구매 취소</button></span>
  </form>


</div>
</div>
</div>

<br>
<br>
<br>

<%@ include file="include/footer.jsp" %>
</body>
</html>