<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">
<title>#### 예약목록 ####</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>


<div class="content_List">

<div class="card" style="width: 650px; height:750px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:150px; ">
 	<!-- 컨텐츠 헤더 -->
 		<table border="0" cellpadding= "0" cellspacing="0" width="600" height="110" style="margin-bottom:0px; position:relative;">
		  	<tr>
		  		<td width="40%" rowspan="4" align="center">
		  			<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/uploadfiles/${minfo.profileName}" alt="..." width="120" height="120" >
		  		</td>
		  		<td height="20%" colspan="3">
		  			<div id = "profile01">${minfo.nick}
			   		
			   		<%
			   			String id = (String)request.getAttribute("id");
			   		
			   			if(id.equals(sid)){
	   				%>
			   				<a href="memberModify"> 
						   		<button type="button" class="btn btn-outline-secondary" 
						          style="--bs-btn-padding-y: .10rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="memberModify">
						  		 프로필편집
								</button>
							</a>
	   				<%
			   			}
			   		%>
			   		
			   		
					
					
			       	</div>
		   		</td>
		   		<td height="20%">
		   			<a href="send?nick=${minfo.nick}" class="dropdown-item" style="font-size:16px; text-decoration:none; padding-left: 0px; font-weight:bold;">
	         
			       <button type="button" class="btn btn-outline-secondary" 
						          style="--bs-btn-padding-y: .10rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="memberModify">
						  		 <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg>
			       	메세지 보내기
								</button></a>
		   		</td>
		  	</tr>
		  	<tr>
		  		<td class = "profile03" height="15%" colspan="3">${minfo.greet}</td>
		  	</tr>
		  	
		  	<tr height="10%" >
		  		<td colspan="4">
		  		
		  		<div class="btn-group" role="group" >
					  
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" onclick="script:window.location='sell_List?id=<%=id%>'">
					  <label class="btn btn-outline-secondary" for="btnradio1" style="font-size: 12px;">판매중(${post})</label>
					
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked onclick="script:window.location='buy_List?id=<%=id%>'">
					  <label class="btn btn-outline-secondary" for="btnradio2" style="font-size: 12px;">예약확인중 (${buy})</label>
					
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="script:window.location='choice_List?id=<%=id%>'">
					  <label class="btn btn-outline-secondary" for="btnradio3" style="font-size: 12px;">찜 (${follower})</label>
					  
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" onclick="script:window.location='transaction_List?id=<%=id%>'">
					  <label class="btn btn-outline-secondary" for="btnradio4" style="font-size: 12px;">예약완료(${trc})</label>
					</div>

		  		</td>
		  	</tr>

		  	
	   </table>
  </div>
  	<hr style="margin:30px;">
  	

  <!-- 판매중 리스트 -->
  	<div class="overflow-auto" style="height:600px">
  	<div class="row row-cols-3 row-cols-md-3 g-4" style="padding-left: 20px;padding-right: 10px;">	
   	<c:forEach items="${bList}" var="bList">	
	
	  <div class="col">
	    <div class="card h-100">
	     <a href="content_view?postidx=${bList.postidx}" style="text-decoration: none; color:black;"> 
	      <c:forEach items="${uList }" var="uList">
	      	<c:if test="${uList.postDto.postidx == bList.postidx }">
				<img src="${pageContext.request.contextPath }/resources/uploadfiles/${uList.fileName}" width="100" height="150" class="card-img-top" alt="...">
			</c:if>
	      </c:forEach>
		      <div class="card-body" style="height: 150px;padding:10px;">
		        <span style="font-size: 12px; margin: top">&nbsp;${bList.nick}</span>
				<hr style="margin:2px; ">
		        <p class="card-text">&nbsp;${bList.title }</p>
		      </div>
		      <div class="card-footer" style="height: 30px; padding: 0px; padding-left: 20px;">
		      <small class="content_List_font03" >
		      <c:forEach items="${dList}" var="dList">
		      
	   			<c:if test="${dList.postidx == bList.postidx }">
	   				${dList.createdate}
	   			</c:if>
      		  
      		  </c:forEach>일 전
      		  
      		  </small>
      		  </div>
        </a>
      </div>
    </div>
  </c:forEach>
  </div>
  
  </div>
  	

	<!-- 판매중 리스트 끝 -->	
  
  
  
  
  
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>