/**
 * 
 */
 
 function joinCheck() {
	
	if(document.join_frm.id.value.length == 0) {
		alert("아이디는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.join_frm.id.value.length < 4) {
		alert("아이디가 너무 짧습니다. 아이디는 4자 이상이어야 합니다.");
		return;
	}
	
	if(document.join_frm.pwd.value.length == 0) {
		alert("비밀번호는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	
	if(document.join_frm.name.value.length == 0) {
		alert("이름은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	if(document.join_frm.birth.value.length == 0) {
		alert("생년월일은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.join_frm.mail.value.length == 0) {
		alert("이메일은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.join_frm.phone.value.length == 0) {
		alert("핸드폰번호는 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	if(document.join_frm.nick.value.length == 0) {
		alert("닉네임은 필수 입력사항입니다. 다시 확인해주세요!");
		return;
	}
	
	
	
	
	document.join_frm.submit();
	
}


