<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 병원예약관리 프로젝트 **</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reservation.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />


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


</head>
<body>

   <center>
   <table width="75%" border="0" cellspacing="0" cellpadding="20">
      <tr>
         <td class="titlebox">
            <span class="title01">예약 페이지</span>
         </td>
      </tr>
      <tr>
         <td>
            <center>
            <table width="80%" border="0" cellspacing="0" cellpadding="10">
               <tr class="contentbox">
                  <td class="content">
                     <center>
                     <table border="0" cellspacing="0" cellpadding="10">
                        <form action="reservationOk" method="post" name="reservation_frm">
                        <input type="hidden" value="${view.qnum }" name="qnum">
                           <tr>
                              <td><span class="content_text01">MEMBER ID</span></td>
                              <td><input class="input_type01" type="text" name="rid" value="${memberId}"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">NAME</span></td>
                              <td><input class="input_type01" type="text" name="rname" value="${member.mname}"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">PHONE</span></td>
                              <td><input class="input_type01" type="text" name="rphone">&nbsp;- 제외 입력</td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">DATE</span></td>
                              <td>
                                 
                                 <select class="select_type01" name="selectOption">
                                        <option value="09:30">09:30</option>
                                        <option value="10:20">10:20</option>
                                        <option value="11:10">11:10</option>
                                        <option value="12:00">12:00</option>
                                        <option value="14:10">14:10</option>
                                        <option value="15:00">15:00</option>
                                        <option value="15:50">15:50</option>
                                        <option value="16:40">16:40</option>
                                        <option value="17:30">17:30</option>
                                    </select>
                                 </td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">ANIMAL</span></td>
                              <td><input class="input_type01" type="text" name="ranimal"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">LIST</span></td>
                              <td><input class="input_type01" type="text" name="rlist" value="${check }"></td>
                           </tr>
                           <tr>
                              <td><span class="content_text01">CONTENT</span></td>
                              <td colspan="2"><textarea class="textarea_text01" rows="5" cols="30" name="rcontent"></textarea></td>
                           </tr>
                           <tr>
                              <td colspan="3" align="center">
                                 <input class="button_type01" type="button" value="예약완료" onclick="reservationCheck()">&nbsp;&nbsp;
                                 <input class="button_type01" type="button" value="예약취소" onclick="script:window.location='index'">
                              </td>
                           </tr>
                        </form>
                     </table>
                     </center>
                  </td>
               </tr>
            </table>
            </center>
         </td>
      </tr>
   </table>
   </center>
<input class="input_type01" id="pickDate" type="text" name="rday">&nbsp;
</body>
</html>