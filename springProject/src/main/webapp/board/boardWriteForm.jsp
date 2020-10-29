<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<h1>글쓰기</h1>
<form name="boardWriteForm" method="post" action="/springProject/board/boardWrite">

<table border="1" cellspacing="0" cellpadding="5">
<td>*제목</td>
<td><input type="text" name="subject" id="subject" placeholder="제목 입력">
<div id="subjectDiv"></div></td>
</tr>
<tr>
<td>*내용</td>
<td><textarea name="content" id="content" cols="40" rows="20" style="resize:none;" placeholder="내용 입력"></textarea>
<div id="contentDiv"></div>
</td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" id="boardWriteBtn" value="글작성" onclick="checkBoardWriteForm()">
&nbsp;<input type="reset" value="다시작성">
</tr>

</table>

</form>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" > 

$('#boardWriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() ==''){
		$('#subjectDiv').text('제목을 입력하세요');
        $('#subjectDiv').css('color', 'red');
        $('#subjectDiv').css('font-size', '8pt');
        $('#subjectDiv').css('font-weight', 'bold');
        
	}else if($('#content').val() ==''){
		$('#contentDiv').text('내용을 입력하세요');
        $('#contentDiv').css('color', 'red');
        $('#contentDiv').css('font-size', '8pt');
        $('#contentDiv').css('font-weight', 'bold');
        
	}else{
		$.ajax({
			type: 'post',
			url: '/springProject/board/boardWrite',
			data: {'subject': $('#subject').val(),
				   'content': $('#content').val()},
			success: function(){
				alert('글쓰기 완료');
				location.href='/springProject/board/boardList';
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

</script>

</html>