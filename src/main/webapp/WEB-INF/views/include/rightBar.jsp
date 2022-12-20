<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/rightBar/rightBar.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String ssid = (String)session.getAttribute("sessionId");
%>
<div class="recommend">
<div class="card" style="width: 300px; height:600px; border:1px solid #dddddd; border-radius:5px;">

<div class="card-body"> 
   	<img src="${pageContext.request.contextPath }/resources/img/${minfo.profile }" width="30" height="30" alt="...">
   		<span style="font-size:16px; font-weight:bold;"><%=ssid %></span><br>
		<hr><span style="font-size:16px; font-weight:bold; text-align: center;">회원님을 위한 추천</span><br><br>
		
  	<c:forEach items="${memberList}" var="mList">
  		<img src="${pageContext.request.contextPath }/resources/img/${mList.profile }" width="30" height="30" alt="...">
   		<span style="font-size:16px; font-weight:bold;">${mList.nick}</span>
   		<a class="follow" href="#"  type="submit">팔로우 </a>
   		<br>
   		
   		</c:forEach>
  	<br>
  </div>
  
  	
  
</div>
</div>
</body>
</html>