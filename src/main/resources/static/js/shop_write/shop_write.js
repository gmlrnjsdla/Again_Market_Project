
 function shopwriteCheck() {
	
	if(document.shopwrite_frm.files.value.length == 0) {
		alert("제품 사진은 필수입니다!!");
		return;
	}
	
	if(document.shopwrite_frm.title.value.length == 0) {
		alert("제목은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.shopwrite_frm.spoint.value.length == 0) {
		alert("물품종류는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.shopwrite_frm.content.value.length == 0) {
		alert("가격은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	
	document.shopwrite_frm.submit();
	
}

