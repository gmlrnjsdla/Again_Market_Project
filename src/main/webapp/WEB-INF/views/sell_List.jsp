<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content_List/content_List.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>


<div class="content_List">

<div class="card" style="width: 650px; height:700px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:100px; ">
 	<!-- 컨텐츠 헤더 -->
 		<table border="0" cellpadding= "0" cellspacing="0" width="600" height="110" style="margin-bottom:645px; position:relative;">
		  	<tr colspan="3">
		  		<td width="40%" rowspan="4" align="center">
		  			<img class ="rounded-circle me-2" src="${pageContext.request.contextPath }/resources/img/content.jpg" alt="..." width="120" height="120" >
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
		  	</tr>
		  	<tr>
		  		<td class = "profile03" height="15%" colspan="3">${minfo.greet}</td>
		  	</tr>
		  	<tr height="10%">
		  		<td class = "profile02"><a href="/sell_List?id=<%=sid %>"><button type="button" class="btn btn-secondary">판매중 ${post}</button></a></td>
		  		
		  		<td class = "profile02"><a href="/buy_List?id=<%=sid %>">구매중 ${follow}</a></td>
		  		
		  		<td class = "profile02"><a href="/choice_List?id=<%=sid %>">찜 ${follower}</a></td>
		  		
		  	</tr>

		  	
	   </table>
  </div>
  	<hr style="margin:20px;">
  
  	<div class="overflow-auto" style="height:500px">
  		
   	<!-- 판매중 리스트 -->	
   		
   		
 	<div class="row" style="margin:5px; --bs-gap: .25rem 1rem;">
 		
 		
		<c:forEach items="${pList }" var="pList">
			<div class="col-md-4">
				<a href="index" style="text-decoration: none; color:black;">
					<img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
				<div style="font-size: 12px;">${pList.id}</div>
				<div style="font-weight: bold; font-size: 15px; text-align: center;">${pList.title }</div>
				</a>
			</div>
		</c:forEach>
		
		
			
			
	</div>
  </div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>