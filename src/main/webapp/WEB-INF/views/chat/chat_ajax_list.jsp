<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="tmp" items="${list}">
	<div class="chat_list_box${tmp.room } chat_list_box">
		<div type="button" class="chat_list" room="${tmp.room }" other-nick="${tmp.othernick }">
			<!-- active-chat -->
			<div class="chat_people">
				<div class="chat_img" >
					<a href="other_profile.do?othernick=${tmp.othernick }">
						<img src="${pageContext.request.contextPath }/resources/uploadfiles/${tmp.profileName }" alt="" width="23" height="23" class="rounded-circle me-2">
					</a>
				</div>
				<div class="chat_ib">
					<h5>${tmp.othernick }<span class="chat_date">${tmp.sendtime }</span>
					</h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.content }</p>
						</div>
						<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.room }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>