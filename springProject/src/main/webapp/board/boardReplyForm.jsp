
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<h1>답글 쓰기</h1>
<form name= "boardReplyForm" method="post" action="/springProject/board/boardReply">

<table border="1" cellspacing="0" cellpadding="5">
<td>*제목</td>
<td><input type="text" name="subject" id="subject" value="">
<div id="subjectDiv"></div>
</td>
</tr>
<tr>
<td >*내용</td>
<td>
<textarea name="content" id="content" cols="40" rows="20" style="resize:none;" >${boardDTO.content}</textarea>
<div id="contentDiv"></div>
</td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="button" value="답글쓰기" id="boardWriteBtn">
&nbsp;<input type="reset" value="다시작성">
<input type="hidden" name="pseq" value="${pseq}" >
<input type="hidden" name="pg" value="${pg}" >

</td>
</tr>

</table>

</form>

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
		document.forms[0].submit();
	}
});

</script>
