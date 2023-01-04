
 function addressCheck() {
	
	if(document.address_frm.address.value.length == 0) {
		alert("배송 주소는 필수입니다!!");
		return;
	}
	
	
	
	
	document.address_frm.submit();
	
}

