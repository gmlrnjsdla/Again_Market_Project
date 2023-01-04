
 function profileCheck() {
	
	if(document.profile_frm.files.value.length == 0) {
		alert("사진을 첨부해주세요!");
		return;
	}
	
	
	document.profile_frm.submit();
	
}

