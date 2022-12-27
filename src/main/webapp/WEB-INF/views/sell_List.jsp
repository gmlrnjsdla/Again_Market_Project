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

<div class="card" style="width: 650px; height:750px; border:1px solid #dddddd; border-radius:15px;">
  <div class="card-body" style="height:150px; ">
 	<!-- 컨텐츠 헤더 -->
 		<table border="0" cellpadding= "0" cellspacing="0" width="600" height="50" style="margin-bottom:0px; position:relative;">
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
		  	<tr height="10%" rowspan="3">
		  		<td>
		  		
		  		<div class="btn-group" role="group" >
				  
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked onclick="script:window.location='sell_List?id=<%=id%>'">
				  <label class="btn btn-outline-secondary" for="btnradio1" style="font-size: 12px;">판매중(${post})</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onclick="script:window.location='buy_List?id=<%=id%>'">
				  <label class="btn btn-outline-secondary" for="btnradio2" style="font-size: 12px;">구매중 (${follow})</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" onclick="script:window.location='choice_List?id=<%=id%>'">
				  <label class="btn btn-outline-secondary" for="btnradio3" style="font-size: 12px;">찜 (${follower})</label>
				  
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" onclick="script:window.location='transaction_List?id=<%=id%>'">
				  <label class="btn btn-outline-secondary" for="btnradio4" style="font-size: 12px;">거래완료()</label>
				</div>

		  		</td>
		  	</tr>
	   </table>
	   
	   
  </div>
  	<hr style="margin:30px;">
  
  	<div class="overflow-auto" style="height:600px">
  		
   	<!-- 판매중 리스트 -->	
   		
   		
 	<div class="row" style="margin:5px; --bs-gap: .25rem 1rem;">
 		

		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		<div class="col-md-4"style="padding-bottom:  20px;"><a href="content_view"><img src="${pageContext.request.contextPath }/resources/img/content.jpg" width="100" height="150" class="card-img-top" alt="...">
		</a><div class="content_List_font01">냉장고 판매합니다</div></div>
		
		
	
			
	</div>
  </div>
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>