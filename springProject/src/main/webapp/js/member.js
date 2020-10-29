$('#signUp').click(function(){
	
		$('.check').empty();
	/*	$('#nameCheck').empty();
		$('#idCheck').empty();
		$('#pwdCheck').empty();*/
	
		if($('#name').val() == "")
			$('#nameCheck').text('이름을 입력하세요');
		//$('#nameCheck').css('color','red');
		//$('#nameCheck').css('font-size','8pt');
		//$('#nameCheck').css('font-weight','bold');
		//$('#nameCheck').focus();
		else if ($('#id').val() == "")
			$('#idCheck').text('아이디를 입력하세요');
		else if ($('#pwd').val() == "")
			$('#pwdCheck').text('비밀번호 입력하세요');
		else if ($('#repwd').val() == "")
			$('#pwdReCheck').text('비밀번호를 재입력하세요');
		else if ($('#repwd').val() != $('#repwd').val())
			$('#pwdReCheck').text('비밀번호가 일치하지 않습니다.');
		else if($('#idDuplication').val() == "idUncheck")
			$('#idCheck').text('중복체크 해주십시오.');
		else
			$('form[name=writeForm]').submit();
//			document.writeForm.submit();
		
		
/*	if(document.getElementById("name").value == ""){ 
		alert("이름을 입력하세요");
		document.writeForm.name.focus();
	}else if (document.writeForm.id.value == ""){
		alert("아이디를 입력하세요");
		document.writeForm.id.focus();
	}else if (document.writeForm.pwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.writeForm.pwd.focus();
	}else if (document.writeForm.repwd.value == ""){
		alert("비밀번호 재입력하세요");
		document.writeForm.repwd.focus();
	}else if (document.writeForm.pwd.value != document.writeForm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
	}else if(document.writeForm.idDuplication.value == "idUncheck"){
		alert("중복체크하십시오.");
	}else{
		document.writeForm.submit();
	}*/
		
});



$('#login').click(function(){
	if ($('#idL').val() == "")
		$('#loginIdCheck').text('아이디를 입력하세요');
	else if ($('#pwdL').val() == "")
		$('#loginPwdCheck').text('비밀번호 입력하세요');
	else		
		$('form[name=loginForm]').submit();
	
});

function checkLoginForm() {
	if (document.loginForm.id.value == ""){
		alert("아이디를 입력하세요");
		document.loginForm.id.focus();
	}else if (document.loginForm.pwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.loginForm.pwd.focus();
	}else
		document.loginForm.submit();
}


$('#id').focusout(function(){
	let id = $('#id').val();
	if(id == ""){
		$('#idCheck').text('아이디를 입력하세요');
		$('#idCheck').css('color','magenta');
		$('#idCheck').css('font-size','8pt');
		$('#id').focus();
	}else{
		$.ajax({
			type:'post',
			url: '/springProject/member/checkId',
			data: 'id='+ $('#id').val(),
			dataType: 'text',
			success: function(data){
				if(data=='exist'){
					$('#idCheck').text('사용 불가능한 아이디');					
					$('#idCheck').css('color','red');
				}else{
					$('#idCheck').text('사용 가능한 아이디');					
					$('#idCheck').css('color','blue');
				}
			},
			error: function(e){
				console.log(e);
				
			}
		});

	}
});


function checkIdClose(id) {
	
		opener.writeForm.id.value = id;
		// 열려있는 창들 중에 WirteForm에서 id.value 값을 쥐어준다.
		opener.writeForm.idDuplication.value = "idCheck";
		window.close();
		onpener.$('form[name=writeForm]').$('.check').empty();
		opener.wrtieForm.pwd.focus();

	}		




function checkPost(){
	window.open("checkPost.do","","width=500 height=500 scrollbars=yes");
}

function checkPostClose(zipcode, address){
	   
	   opener.document.forms[0].zipcode.value=zipcode;
	   opener.document.forms[0].addr1.value = address;
	   //opener.writeForm.idDuplication.value = id;      
	   //opener는 열려있는 창
	   window.close();
	   opener.document.forms[0].addr2.focus();
	   
	   
	   /*
	   opener.document.getElementById("zipcode").value = zipcode;
	   opener.document.getElementById("addr1").value = address;
	   window.close();
	   opener.document.getElementById("addr2").focus();
	   */
	}




function writeInfo(id){
	document.writeForm.id.value = id;
	document.writeForm.pwd.value = pwd;
	document.writeForm.name.value = name;
	
}

//회원정보 수정
function checkModifyForm() {
	if(document.getElementById("name").value == ""){ 
		alert("이름을 입력하세요");
		document.modifyForm.name.focus();
	}else if (document.modifyForm.id.value == ""){
		alert("아이디를 입력하세요");
		document.modifyForm.id.focus();
	}else if (document.modifyForm.pwd.value == ""){
		alert("비밀번호를 입력하세요");
		document.modifyForm.pwd.focus();
	}else
		document.modifyForm.submit();
	
}

function checkLogin(memId, seq, pg){
 	  	if(memId=='null'){
  		alert("먼저 로그인하세요.");
  	}else{
		location.href="boardView.do?seq="+seq+"&pg="+pg;
  	} 
}











