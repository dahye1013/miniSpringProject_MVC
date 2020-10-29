<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	
	<form name="writeForm" method="post" action="/springProject/member/write">
		<h3 align="right">[ 회원가입 ]&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</h3>
		<table border="1" cellspacing="0" cellpadding="5" align="right">

			<tr>
				<!--1행-->
				<td width="70" align="center">이름</td>
				<td><input type="text" name="name" id="name" placeholder="이름 입력" >
				<div id="nameCheck" class="check" style="font-size:8pt; color:red;"></div>
				</td>
			</tr>
			<tr>
				<!--2행-->
				<td width="70" align="center">아이디</td>
				<td><input type="text" name="id" id="id" placeholder="아이디 입력" size="30" >
				<input type="hidden" name="check" id="check" value="">
				<div id="idCheck" class="check" style="font-size:8pt; color:red;"></div>
				
				</td>
			</tr>
			<tr>
				<!--3행-->
				<td width="70" align="center">비밀번호</td>
				<td><input type="password" name="pwd" id="pwd" size="30">
				<div id="pwdCheck" class="check" style="font-size:8pt; color:red;"></div>
				</td>
			</tr>
			<tr>
				<!--4행-->
				<td width="70" align="center">재확인</td>
				<td><input type="password" name="repwd" id="repwd" size="30">
				<div id="pwdReCheck" class="check" style="font-size:8pt; color:red;"></div>
				</td>
			</tr>
			<tr>
				<!--5행-->
				<td align="center">성별</td>
				<td><label/><input type='radio' name='gender' value='0' />남성 &emsp;
					<label/><input type='radio' name='gender' value='1' checked />여성</td>
			</tr>
			<tr>
				<td align="center">이 메 일</td>
				<td><input type="text" name="email1" size="10">@ 
				<input type="email" name="email2" list="defaultEmails"> 
				<datalist id="defaultEmails">
						<option value="naver.com">
						<option value="gmail.com">
						<option value="hanmail.net">
					</datalist></td>
			</tr>
			<tr>
				<!--7행-->
				<td align="center">핸드폰</td>
				<td><select name="tel1" style="width: 50px">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
				</select>
				&nbsp;-&nbsp; 
				<input type="text" name="tel2" size="3">
				&nbsp;-&nbsp; 
				<input type="text" name="tel3" size="3"></td>
			</tr>
			<tr>
				<!--8행-->
				<td width="70" align="center">주소</td>
				<td><input type="text" name="zipcode" id="zipcode" readonly size="7"> 
				<input type="button" id="zipBtn" value="우편번호검색" ><br> 
				<input type="text" name="addr1" id="addr1" placeholder="주소" size="50" readonly><br> 
				<input type="text" name="addr2" id="addr2" placeholder="상세 주소" size="50" ></td>
			</tr>
			<tr>
				<!--9행-->
				<td colspan="2" align="center">
				<input type="button" id="signUp" value="회원가입"  >&emsp;
			    <input type="reset" value="다시작성">&emsp;
				</td>
			</tr>
		</table>

	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
 <!-- <script type="text/javascript" src="../js/member.js"></script>  -->
<script type="text/javascript">

$('#signUp').click(function(){
	$('.check').empty();
	if($('#name').val() == "")
		$('#nameCheck').text('이름을 입력하세요');

	else if ($('#id').val() == "")
		$('#idCheck').text('아이디를 입력하세요');
	else if ($('#pwd').val() == "")
		$('#pwdCheck').text('비밀번호 입력하세요');
	else if ($('#repwd').val() == "")
		$('#pwdReCheck').text('비밀번호를 재입력하세요');
	else if ($('#repwd').val() != $('#repwd').val())
		$('#pwdReCheck').text('비밀번호가 일치하지 않습니다.');
	else if($('#check').val() != $('#id').val())
		$('#idCheck').text('중복체크 해주십시오.');
	else
		$('form[name=writeForm]').submit();

	
});

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


$('#zipBtn').click(function(){
	window.open("checkPost","","width=600 height=500 scrollbars=yes");	
	
});



</script> 


