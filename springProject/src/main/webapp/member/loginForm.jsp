<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style> 
#loginBtn{
background-color: White;

}
#writeBtn{
background-color:White;

}

</style>

</head>
<body>
<!-- 	<h3 align="center">로그인</h3> -->
	<form name="loginForm" method="post" action="/member/login">
		<table bgcolor="#ffccff"  cellspacing="0" cellpadding="5"  align="center">
			<tr>
				<td width="30" align="center">ID</td>
				<td><input type="text" name="id" id="idL"  size="10">
				<div id="loginIdCheck" style="font-size:8pt; color:red;"></div>
				</td>
			</tr>
			<tr>
				<td  align="center">PW</td>
				<td><input type="password" name="pwd" id="pwdL" size="10">
				<div id="loginPwdCheck" style="font-size:8pt; color:red;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" id="loginBtn" value="Login"> 
				<input type="button" id="writeBtn" value="Sign-Up"  
				onclick="location.href='/springProject/member/writeForm'">
								<div id="loginResult"></div>
				</td>
			</tr>

		</table>
		
	</form>


</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">

  
	$('#loginBtn').click(function(){
		
		if (document.loginForm.id.value == "")
			$('#loginIdCheck').text('아이디를 입력하세요');
		else if (document.loginForm.pwd.value == "")
			$('#loginPwdCheck').text('비밀번호 입력하세요');
		else{
			$.ajax({
				type: 'post',
				url: '/springProject/member/login',
				data: JSON.stringify({
					'id': $('#idL').val(),
					'pwd': $('#pwdL').val()
				}),				
				contentType: 'application/json',
				dataType: 'text',
				success: function(data){
					if(data=='sucess'){
						location.href='/springProject/main/index';						
					}else{
						$('#loginResult').text('로그인 실패');
					}

				},
				error: function(err){
					console.log(err);
				}
			});
		}
		
	});



</script> 
</html>