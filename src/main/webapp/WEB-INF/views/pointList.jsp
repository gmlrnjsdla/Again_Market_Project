<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">


<style type="text/css">
	
	
	.point1{
		padding:5px 30px 5px 30px;
	}
	.point2{
		border-top: 1px solid #cccccc;
	}
	.point3{
		border-top: 1px solid #cccccc;
		border-bottom: 1px solid #cccccc;
	}
</style>

<title>#### pointshop ####</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>

<div class="pointshop_List" style="padding-top:50px;padding-left:550px;position: relative;z-index: 1;">

<div class="card" style="width: 800px; height:750px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:80px; ">
 	<!-- 컨텐츠 헤더 -->
 		<table border="0" cellpadding= "0" cellspacing="0" width="800" height="50" style="margin-bottom:0px; position:relative;">
		  	<tr colspan="2">
		  		<td width="20%" rowspan="4" align="center">
		  			<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/uploadfiles/${minfo.profileName} " alt="..." width="70" height="70" >
		  		
		  		</td>
		  		<td height="20%" colspan="3">
		  			<div id = "profile01">${minfo.nick}

			   				
								
					</div>
		   		</td>
		   		
		  	</tr>
		  	<tr>
		  		<td>
			  		<a href="pointList">
				   		<button type="button" class="btn btn-outline-secondary" 
				          style="--bs-btn-padding-y: .4rem; --bs-btn-padding-x: .9rem; --bs-btn-font-size: .95rem;">
				  		 보유포인트 : ${minfo.point}p
						</button>
					</a>
				</td>	
		  	</tr>
	   </table>
	   
	   
  </div>
  	<hr style="margin:30px;">
  
  
  <!-- 판매중 리스트 -->
  <center>
  	<div style="height:600px">
  		<table class="pointTable" >
  			<tr class="point3" style="text-align: center;">
  				<th class="point1">번호</th>
  				<th class="point1">포인트 추가</th>
  				<th class="point1">포인트 차감</th>
  				<th class="point1">설 명</th>
  				<th class="point1">당시 잔액</th>
  			</tr>
  			<c:forEach items="${pointList }" var="pointList" varStatus="status">
	  			<tr class="point2" style="text-align: center;">
	  				<td class="point1">${pageMaker.total - (pageNum-1)*10 - status.index}</td>
	  				<td class="point1" style="color:#32a852">+${pointList.pluspoint }p</td>
	  				<td class="point1" style="color:red;">-${pointList.minuspoint }p</td>
	  				<td class="point1">${pointList.explain }</td>
	  				<td class="point1">${pointList.currentpoint }p</td>
	  			</tr>
  			</c:forEach>
  		</table>
            
            <!-- 페이징 -->
            <nav aria-label="Page navigation example" style="margin-top: 30px;">
			  <ul class="pagination" style="justify-content : center;">
			    <li class="page-item">
			    	<c:if test="${pageMaker.prev}">
			      		<a class="page-link" href="pointList?pageNum=${pageMaker.startPage - 5}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        </c:if>
			      </a>
			    </li>
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
						<c:choose>
							<c:when test="${num == pageNum }">
								<li class="page-item active"><a class="page-link" href="pointList?pageNum=${num}">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="pointList?pageNum=${num}">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			    <li class="page-item">
			    <c:if test="${pageMaker.next}">
			      <a class="page-link" href="pointList?pageNum=${pageMaker.startPage + 5}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        </c:if>
			      </a>
			    </li>
			  </ul>
			</nav>
			<!-- 페이징 -->
  	</div>
  </center>

	<!-- 판매중 리스트 끝 -->	


  </div>
  
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>