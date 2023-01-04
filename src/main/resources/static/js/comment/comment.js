
 function commentCheck() {
	
	
	
	if(document.comment_frm.content.value.length == 0) {
		alert("댓글내용은 필수 입력사항입니다!");
		return;
	}
	
	document.comment_frm.submit();
	
}

