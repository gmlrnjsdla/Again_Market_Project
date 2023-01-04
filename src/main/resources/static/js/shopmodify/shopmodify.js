
 function shopmodify() {
	
	if(document.shopmodify_frm.title.value.length == 0) {
		alert("제목은 필수입니다!!");
		return;
	}
	if(document.shopmodify_frm.content.value.length == 0) {
		alert("내용은 필수입니다!!");
		return;
	}
	if(document.shopmodify_frm.spoint.value.length == 0) {
		alert("포인트는 필수입니다!!");
		return;
	}
	
	
	
	
	document.shopmodify_frm.submit();
	
}

