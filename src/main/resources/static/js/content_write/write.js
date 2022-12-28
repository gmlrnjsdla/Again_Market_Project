
 function writeCheck() {
	
	if(document.write_frm.files.value.length == 0) {
		alert("제품 사진은 필수입니다!!");
		return;
	}
	
	if(document.write_frm.title.value.length == 0) {
		alert("제목은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.write_frm.type.value.length == 0) {
		alert("물품종류는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.write_frm.price.value.length == 0) {
		alert("가격은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.write_frm.tradeplace.value.length == 0) {
		alert("거래희망장소는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.write_frm.content.value.length == 0) {
		alert("내용은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	
	document.write_frm.submit();
	
}

