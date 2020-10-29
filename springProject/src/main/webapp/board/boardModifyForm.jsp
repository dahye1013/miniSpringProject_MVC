
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>글수정</h1>
<form id="boardModifyForm" method="post" action="boardModify.do?seq=${seq}&pg=${pg}">
<input type="hidden" name="seq" id="seq" value="${seq}"><!-- controller에서 받은 seq랑 pg값을 받는다. -->
<input type="hidden" name="pg" value="${pg}">
<table border="1" cellspacing="0" cellpadding="5">
<td>*제목</td>
<td><input type="text" name="subject" id="subject">
<div id="subjectDiv"></div>
</td>
</tr>
<tr>
<td >*내용</td>
<td ><textarea name="content" id="content" cols="40" rows="20" style="resize:none;" >
</textarea>
<div id="contentDiv"></div></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" value="수정" id="boardModifyBtn" >
&nbsp;<input type="reset" value="다시작성">

</tr>

</table>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" > 
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url:'/springProject/board/getBoardView',
		data: 'seq='+$('#seq').val(),
		dataType : 'json',
		success : function(data){
 			$('#subject').val(data.boardDTO.subject);
			$('#content').text(data.boardDTO.content); 
		},
		error: function(err){
			console.log(err);
		}
	});
	
});

$('#boardModifyBtn').click(function(){
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
			url:'/springProject/board/boardModify',
			data: $('#boardModifyForm').serialize(),
			success : function(){
				alert('글 수정 완료!');
				location.href='/springProject/board/boardList';
			},
			error: function(err){
				console.log(err);
			}
			
		});
	}
});


</script>
