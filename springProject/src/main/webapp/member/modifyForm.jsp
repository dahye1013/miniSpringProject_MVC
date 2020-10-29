<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h3>회원정보수정</h3>
<form id="modifyForm" name="modifyForm" method="post" action="/springProject/member/modify">
<table border="1" cellspacing="0" cellpadding="3">
 <tr>
  <td width="70" align="center">이름</td>
  <td><input type="text" name="name" id="name" value="${memDTO.name }" placeholder="이름 입력">
   <div id="nameCheck" class="check" style="font-size:8pt; color:red;"></div>
  </td>
 
				 </tr>

 <tr>
  <td width="70" align="center" >아이디</td>
  <td>
   <input type="text" name="id" id="id" value="${memDTO.id }" size="30" readonly>
  </td>
 </tr> 
 
 <tr>
  <td width="70" align="center">비밀번호</td>
  <td><input type="password" name="pwd" id="pwd" size="35">
  <div id="pwdCheck" class="check" style="font-size:8pt; color:red;"></div>
  </td>
  
 </tr>
 
 <tr>
  <td width="70" align="center">재확인</td>
  <td><input type="password" name="repwd" size="35">
  <div id="pwdReCheck" class="check" style="font-size:8pt; color:red;">
  </td>
 </tr>
 
 <tr>
  <td width="70" align="center">성별</td>
  <td>
   <input type="radio" name="gender" value="0">남 &emsp;
   <input type="radio" name="gender" value="1">여
  </td>
 </tr>
 
 <tr>
  <td align="center">이메일</td>
  <td>
   <input type="text" name="email1" value="${memDTO.email1 }" size="15" >
   @
   <input type="email" name="email2" id="email2" list="defaultEmails" placeholder="직접입력">
   <datalist id="defaultEmails">
    <option value="naver.com">
	<option value="hanmail.net">
	<option value="gmail.com">
   </datalist>
  </td>	
 </tr>
 
 <tr>
  <td align="center">핸드폰</td>
  <td>
   <select name="tel1" id="tel1" style="width: 60px;">
    <option value="010">010</option>
	<option value="02">02</option>
   </select>
   -
   <input type="text" name="tel2" value="${memDTO.tel2 }" size="5">
   -
   <input type="text" name="tel3" value="${memDTO.tel3 }" size="5">
  </td>
 </tr>
 
 <tr>
  <td align="center">주소</td>
  <td>
   <input type="text" name="zipcode" id="zipcode" value="${memDTO.zipcode }" size="7" readonly>
   <input type="button" value="우편번호검색" id="zipBtn"><br>
   
   <input type="text" name="addr1" id="addr1" value="${memDTO.addr1 }" placeholder="주소" size="50" readonly><br>
   
   
   
   <input type="text" name="addr2" id="addr2" value="${memDTO.addr2}"  size="50">
  </td>
 </tr>
 
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="회원정보수정" id="modifyBtn" onclick="checkModifyForm()">
   <input type="reset" value="다시작성" >
  </td>
 </tr>
</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script type="text/javascript" src="../js/member.js"></script> -->
<script type="text/javascript">

window.onload=function(){
 	document.modifyForm.gender['${memDTO.gender }'].checked = true;
	
	document.modifyForm.email2.value = '${memDTO.email2 }';
	//document.getElementById('email2').value = '${memDTO.email2 }';
	
	document.modifyForm.tel1.value = '${memDTO.tel1 }';
	//document.getElementById('tel1').value = '${memDTO.tel1 }'; 
}

$('#modifyBtn').click(function(){
	if($('#name').val() == "")
		$('#nameCheck').text('이름을 입력하세요');
	else if ($('#pwd').val() == "")
		$('#pwdCheck').text('비밀번호 입력하세요');
	else if ($('#repwd').val() == "")
		$('#pwdReCheck').text('비밀번호를 재입력하세요');
	else if ($('#repwd').val() != $('#repwd').val())
		$('#pwdReCheck').text('비밀번호가 일치하지 않습니다.');
	else{
		$.ajax({
			type:'post',
			url:'/springProject/member/modify',
			data: $('#modifyForm').serialize(),
			success: function(){
				alert('회원 정보 수정 완료');
				location.href='/springProject/main/index';
			},
			error: function(err){
				cosole.log(err);
			}
		});
	}
		

	
});

$('#zipBtn').click(function(){
	window.open("checkPost","","width=600 height=500 scrollbars=yes");	
	
});


</script>



























