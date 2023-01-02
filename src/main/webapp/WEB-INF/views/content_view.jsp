<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
<div  class="card" style="width: 600px; height:800px; border:1px solid #dddddd; border-radius:5px; background-color:#FBFBFB ">
  	
  	<div class="card-body" style="height: 100px;">
  	<img class ="rounded-circle me-2"  src="${pageContext.request.contextPath }/resources/uploadfiles/${post.profileName}" width="50" height="50" alt="..."><span style='font-weight: bold'>${post.nick}</span>

	
	
	<!-- 컨텐츠 수정 삭제 드롭다운-->


	<span class="setting" >
	  <%
	  	String id = (String)request.getAttribute("id");
	  	
	  	if(id.equals(sid)){
	  %>
  		<img class="setting" src="${pageContext.request.contextPath }/resources/img/Settings.svg"  type="button" data-bs-toggle="dropdown" aria-expanded="false">
  		<ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="content_modify?postidx=${post.postidx}">수정</a></li>
		    <li><a class="dropdown-item" href="delete_content?postidx=${post.postidx}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a></li>
	  	</ul>
	  <%
	  	}
	  %>
	</span>


	<hr>
	</div>
 	<div class="overflow-auto" style="height: 450px;">
   
 	<!-- 컨텐츠 사진출력 -->
 	<div class="content_img" >
 	<c:forEach items="${postUrlList}" var="pList">
 		<c:if test="${pList.postidx == post.postidx }">
			<img src="/resources/uploadfiles/${pList.fileName}" width="580" height="320"  alt="..." >
		</c:if>
	</c:forEach>
	
 	</div >

	</div>
<hr>
	<div class="overflow-auto" style="height: 450px;">

  	<div class="subject_font01">
	

	<!--찜하기 버튼 --> 
	 <span class="like_button01">
	 
	

	   		찜하기<a href="follow1?followid=<%=sid%>&followcontent=${post.postidx}">

   				<button type="button" class="btn  position-relative">
	    			<img src="${pageContext.request.contextPath }/resources/img/hearts.png" width="20" height="20" alt="...">
	     			<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
	     			${likeCount }
	   				</span>
   				</button>
   			</a>
	
   			
   		</span>
		
	<!--찜하기 버튼 끝 -->	
	
   <!--제목표시 -->
   
  &nbsp;&nbsp; ${post.title}
 
 
   
   <!--판매중/판매완료 표시 -->
 
   
   <c:choose>
	   <c:when test="${post.buyflag == 0 and post.sellflag == 0}">
		   	<button type="button" class="btn btn-primary" disabled 
		   		style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">판매중</button>
		</c:when>
		
		<c:when test="${post.buyflag != 0 and post.sellflag != 0}">
			<button type="button" class="btn btn-secondary" disabled
				style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">거래완료</button>
		</c:when>
		
		<c:when test="${post.buyflag != 0 and post.sellflag == 0}">
			<button type="button" class="btn btn-success" disabled
			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">예약중</button>
		</c:when> 
		
		<c:otherwise>

		</c:otherwise>
		
	</c:choose>
   <!--판매중/판매완료 표시 끝 -->
   
	<!--메세지 보내기 -->
	<c:choose>
	   <c:when test="${post.id != sid and  post.sellflag == 0}">
	
	<span class="" >
	<a href="/send?nick=${post.nick}">
	          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg>
			  
	</a>
	</span>
	
	</c:when>
	
	<c:otherwise>
		
	</c:otherwise>
	</c:choose>
	<!--메세지 보내기 끝 -->	



   <div class="content_font_index01">
	  	${post.type} .
	  	<c:forEach items="${dList}" var="dList">
		   <c:if test="${dList.postidx == post.postidx }">
		   	${dList.createdate}
		   </c:if>
   		</c:forEach>일 전<br>
	<fmt:formatNumber value="${post.price}" pattern="#,###,###,###"/>원
	
	</div>
	<div class="content_font_index02">
   		거래장소: ${post.tradeplace }
  	</div>
 <hr>
  	<div class="content_font_index" style="height:100px;">
  		${post.content}
  	</div>
</div> 

<!--구매확인/판매확인 버튼 --> 

   <c:choose>
	   <c:when test="${post.id == sid and post.buyflag != 0 and post.sellflag == 0}">
		   	<a href="sell_tradeView?postidx=${post.postidx}">
		  	<button type="button" class="btn btn-outline-danger"
		        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 598px; ">
		  		판매확인
			</button></a>
		</c:when>
		
		<c:when test="${post.id!= sid and post.buyflag == 0 and post.sellflag == 0}">
			<a href="buy_tradeView?postidx=${post.postidx}" >
		  	<button type="button" class="btn btn-outline-danger"
		        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 598px; ">
			  	구매신청
			</button></a>
		</c:when>
		
		<c:when test="${post.buyuser == sid and post.buyflag != 0 and post.sellflag == 0}">
		<a href="buy_cancel?postidx=${post.postidx}" >
		<button type="button" class="btn btn-outline-primary"
	        style="--bs-btn-padding-y: 3px; --bs-btn-padding-x: 3px; --bs-btn-font-size: 15px; width: 598px; ">
	  			구매취소
		</button>
		</a>
		</c:when>
		
		
		<c:otherwise>
		
		</c:otherwise>
		
	</c:choose>

<!--구매확인/판매확인 버튼 끝 -->
  
</div>
</div>
</div>
 
<!-- 컨텐츠 댓글출력 -->

<!-- 댓글 시작 -->
<div class="content_write_form02">
<div class="card" style="width: 350px; height:800px; border:1px solid #dddddd; border-radius:5px;">
  <div class="card-body"> 
	<div>댓글목록</div>

		<div class="card" style="width: 320px; height:700px; border:1px solid #dddddd; border-radius:5px; padding:10px;">
		
		<div class="overflow-auto" >
			<table>
				<c:forEach items="${commentList }" var="commentList" varStatus="status">
				
					
					<c:set var="name" value="<%= id %>" />
						<c:choose>
							<c:when test="${name ne commentList.id}">
					    		<div class="content_font01" style="font-size: 18px; font-weight:bold; color:green;"> ${commentList.id }
									<span class="content_font02" style="font-size: 15px; font-weight:bold;">${commentList.content }</span>
									<span class="content_font02" style="font-size: 15px; font-weight:bold; float:right;">${commentList.createdate.substring(0,10) }</span>
									
								</div>
							</c:when>
							<c:otherwise>
						
					    		
					    			
					    			<div class="" style="background-color:#dddddd;height:25px;margin-top: 0px;" >
					    			<span class="content_font01" style="font-size: 15px; font-weight:bold; color:bule;margin:0; "> 글쓴이:
									   <a href="commentlike?cidx=${commentList.commentidx}&postidx=${post.postidx}">
									    <img src="${pageContext.request.contextPath }/resources/img/hearts.png" width="15" height="15" alt="..." style="margin: 0;">
									     <span class="badge text-bg-secondary" style="font-size: 7px;" >
									     	5
									   </span>
									  
									   <span class="content_font02" style="font-size: 15px; font-weight:bold; float:right;">${commentList.createdate.substring(0,10) }</span>
					
									   </a>
									 </span>  
									</div>
								
					    			
									<div class="content_font02" style="font-size: 15px; font-weight:bold;">${commentList.content }</div>
										
							</c:otherwise>
							
						</c:choose>
				</c:forEach>
			</table>	
		</div>
		</div>
	<form action="commentOk">
		<input type="hidden" name="postidx" value="${post.postidx}">
  			<div class="input-group mb-3">
 		 		<input type="text" name="content" class="form-control" placeholder="댓글을 입력해 주세요" aria-label="댓글을 입력해 주세요" aria-describedby="button-addon2">
  		 		<button class="btn btn-outline-secondary" type="submit" id="button-addon2">댓글입력</button>
		</div>
	</form>
	</div>
  </div>
</div>	

<!-- 댓글 끝 -->

<%@ include file="include/footer.jsp" %>

</body>
</html>