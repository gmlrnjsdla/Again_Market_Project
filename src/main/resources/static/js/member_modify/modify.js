
 function modifyCheck() {
	
	if(document.modify_frm.name.value.length == 0) {
		alert("이름은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.modify_frm.nick.value.length == 0) {
		alert("닉네임은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.modify_frm.greet.value.length == 0) {
		alert("소개는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.modify_frm.mail.value.length == 0) {
		alert("이메일은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.modify_frm.phone.value.length == 0) {
		alert("전화번호는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	
	
	document.modify_frm.submit();
	
}

