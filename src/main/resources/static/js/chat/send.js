
 function sendCheck() {
	
	if(document.send_frm.content.value.length == 0) {
		alert("메시지를 입력해주세요!!");
		return;
	}
	
	
	document.send_frm.submit();
	
}

