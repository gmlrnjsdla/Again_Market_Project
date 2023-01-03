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
<%@ include file="include/rightBar.jsp" %>

<div class="pointshop_List" style="padding-top:50px;padding-left:550px;">

<div class="card" style="width: 800px; height:750px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:80px; ">
 	<!-- 컨텐츠 헤더 -->
 		<table border="0" cellpadding= "0" cellspacing="0" width="800" height="50" style="margin-bottom:0px; position:relative;">
		  	<tr colspan="2">
		  		<td width="20%" rowspan="4" align="center">
		  			<img class ="rounded-circle me-2" src="/resources/uploadfiles/${minfo.profileName} " alt="..." width="70" height="70" >
		  		
		  		</td>
		  		<td height="20%" colspan="3">
		  			<div id = "profile01">${minfo.nick}

			   				
								
					</div>
		   		</td>
		   		
		  	</tr>
		  	<tr>
		  		<td>
		  		
			   		<button type="button" class="btn btn-outline-secondary" 
			          style="--bs-btn-padding-y: .4rem; --bs-btn-padding-x: .9rem; --bs-btn-font-size: .95rem;">
			  		 보유포인트 : 10,000p
					</button>
				
				</td>	
		  	</tr>
	   </table>
	   
	   
  </div>
  	<hr style="margin:30px;">
  
  
  <!-- 판매중 리스트 -->
  	<div class="overflow-auto" style="height:600px">
  	<div class="row row-cols-3 row-cols-md-3 g-4" style="padding-left: 20px;padding-right: 10px;">	
   	<c:forEach items="${pList}" var="pList">	
	
	  <div class="col">
	    <div class="card h-100">
	     <a href="pointshop_view?postidx=${pList.postidx}" style="text-decoration: none; color:black;"> 
	      <c:forEach items="${uList }" var="uList">
	      	<c:if test="${uList.postDto.postidx == pList.postidx }">
				<img src="/resources/uploadfiles/${uList.fileName}" width="100" height="200" class="card-img-top" alt="...">
			</c:if>
	      </c:forEach>
		      <div class="card-body" style="height: 100px;padding:10px">
				<div>
					<button type="button" class="btn btn-danger" style="height: 30px; padding: 4px; font-size:14px; margin-left: 10px; ">
					<fmt:formatNumber value="-10000" pattern="#,###,###,###"/>p</button>
				
				</div>
		        <p class="shop_text01">${pList.title }</p>
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
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>