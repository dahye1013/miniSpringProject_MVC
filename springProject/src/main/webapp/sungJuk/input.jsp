<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="sungjukForm" id="sungjukForm">

이름: <input type="text" id="name" name="name">  <br>
국어 : <input type="text" id="kor" name="kor"><br>
영어 : <input type="text" id="eng" name="eng"><br>
수학 : <input type="text" id="math" name="math"><br>
<input type="button" id="insertBtn" value="입력">
<input type="reset"  value="취소">
<input type="button" id="outputBtn" value="출력">

 <br>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$('#insertBtn').click(function(){
	if($('#name').val() == "")
		alert('이름을 입력하세요');
	else if ($('#kor').val() == "")
		alert('국어 점수를 입력하세요');
	else if ($('#eng').val() == "")
		alert('영어 점수를 입력하세요');
	else if ($('#math').val() == "")
		alert('수학 점수를 입력하세요');	
	else{
		$.ajax({
			type:'post',
			url: '/springProject/sungjuk/write',
			data: $('#sungjukForm').serialize(),
			success: function(data){
				alert('회원정보 추가 성공');
			},
			error: function(e){
				console.log(e);
				
			}
		});
		
	}
	
});

$('#outputBtn').click(function(){
			location.href="/springProject/sungjuk/list"
});


</script>
</body>
</html>