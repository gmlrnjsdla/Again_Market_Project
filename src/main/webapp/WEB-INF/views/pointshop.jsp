<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">
<title>#### pointshop ####</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>


<div class="pointshop_List" style="padding-top:50px;padding-left:650px;position: relative;z-index: 1;">


<div class="" style="width: 800px; height:750px;">
  <div class="card-body" style="height:110px; ">
 	<!-- 컨텐츠 헤더 -->  
 		
 		<table border="0" cellpadding= "0" cellspacing="0" width="760"  style="margin-bottom:0px; position:relative;">

		  	<tr>
				<td width="50%"  align="center" rowspan="2">
				<img src="${pageContext.request.contextPath}/resources/img/pointmarket.png" alt="" width="200" class="rounded-circle me-2">
		  		</td>
		  		
		  		<td width="15%"  align="center" rowspan="2" >
		  			<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/uploadfiles/${minfo.profileName} " alt="..." width="70" height="70" >
		  		
		  		</td>
		  		
		  		<td height="20%" style="padding-top:20px;">
		  			<div id = "shop_profile01">
						${minfo.nick}
					</div>
		   		</td>
		   		
		  	</tr>
		  	
		  	<tr>
		  		<td style="padding-bottom:40px;">
			  		<a href="pointList">
				   		<button type="button" class="btn btn-outline-secondary" 
				          style="--bs-btn-padding-y: .4rem; --bs-btn-padding-x: .9rem; --bs-btn-font-size: .95rem;">
				  		 보유포인트 : <fmt:formatNumber value="${minfo.point}" pattern="#,###,###,###"/>p
						</button>
					</a>
					

	   				<%
	   					if(sid.equals("admin")){
					%>
						<br>
							<button type="button" class="btn btn-outline-primary" onclick="script:window.location='pointshop_write'"
					          style="--bs-btn-padding-y: .4rem; --bs-btn-padding-x: .9rem; --bs-btn-font-size: .95rem; margin-top: 5px;">
					  		 상품올리기
							</button>
							&nbsp;
							<button type="button" class="btn btn-outline-primary" onclick="script:window.location='admin_pointshop'"
					          style="--bs-btn-padding-y: .4rem; --bs-btn-padding-x: .9rem; --bs-btn-font-size: .95rem; margin-top: 5px;">
					  		 구매리스트
							</button>
 					<%
	   					}  
	   				%>
					 
					
					
				</td>	
		  	</tr>
	   </table>
	
	
  </div>
  <br>
  <span style="color:#bbbbbb; font-size: 12px;margin-left:140px;">※ 게시글 등록, 댓글 달기, 거래 예약 완료 등을 통해 포인트를 모아 물건을 구매해보세요. </span>
  	<hr style="margin:10px 0 30px 0  ;">
  
  
  <!-- 판매중 리스트 -->
  	<div class="row row-cols-3 row-cols-md-3 g-4" style="padding-left: 30px;padding-right: 0px; width:790px; padding-bottom:100px;">	
   	<c:forEach items="${sList}" var="sList">	
	
	  <div class="col" >
	    <div class="card">
				<img src="${pageContext.request.contextPath }/resources/uploadfiles/${sList.fileName}" width="100" height="230" class="card-img-top" alt="...">

		      
		      <div class="card-body" style=";padding:10px;">
				<div>
				<span class="shop_text01">${sList.title }</span>
					
				</div>
		        <div class="shop_text02">${sList.content }</div>
		        <div>
		        	<button type="button" class="btn btn-danger" style="height: 25px; padding: 2px; font-size:12px; margin-left: 10px; ">
					<fmt:formatNumber value="${sList.spoint}" pattern="#,###,###,###"/>p</button>
		        <a href="pointshop_tradeView?id=${sid}&shopidx=${sList.shopidx}">
			        <button type="button" class="btn btn-outline-primary"
	        			style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
	 					구매하기
					</button>
				</a>
				
				<%
   					if(sid.equals("admin")){
				%>
			 		<img class="shop_setting" src="${pageContext.request.contextPath }/resources/img/Settings.svg"  type="button" data-bs-toggle="dropdown" aria-expanded="false">
			 		<ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="pointshop_modify?shopidx=${sList.shopidx}">수정</a></li>
				    <li><a class="dropdown-item" href="pointshop_delete?shopidx=${sList.shopidx}" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a></li>
			  		</ul>					
					
				<%
  					}  
  				%>									
					
		        </div>
		      </div>
      </div>
    </div>
  </c:forEach>
  </div>
  
  	

	<!-- 판매중 리스트 끝 -->	


  </div>
 </div> 

<%@ include file="include/footer.jsp" %>
</body>
</html>