
 function dateCheck() {
	
	
	
	if(document.date_frm.selectedDate.value.length == 0) {
		alert("거래희망날짜는 필수 입력사항입니다!");
		return;
	}
	
	document.date_frm.submit();
	
}

