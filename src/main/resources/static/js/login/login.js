/**
 * 
 */

 
 function loginCheck() {
	
 
		if(document.login_frm.id.value.length == 0) {
			alert("아이디는 필수 입력사항입니다. 다시 확인해주세요!");
			return;
		}
		
		if(document.login_frm.pwd.value.length == 0) {
			alert("비밀번호는 필수 입력사항입니다. 다시 확인해주세요!");
			return;
		}
		
		
		document.login_frm.submit();
	
}

