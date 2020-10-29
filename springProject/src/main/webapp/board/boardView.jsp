<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br>

<form name="boardViewForm">
<input type="hidden" name="seq" id="seq" value="${seq}"><!-- controller에서 받은 seq랑 pg값을 받는다. -->
<input type="hidden" name="pg" value="${pg}">

<table  border="1" width=580px cellspacing=0 cellpadding=3 style=table-layout:fixed
			frame="hsides" rules="rows">
<tr><td colspan="3"><h3><span id="subjectSpan"></span></h3></td>
</tr>
<tr>
<td width="150" align="center">글번호: <span id="seqSpan"></span>
</td>
<td width="150" align="center">작성자: <span id="idSpan"></span>
</td>
<td width="150" align="center">조회수: <span id="hitSpan"></span>
</td>
</tr>
<tr >
<td colspan="3" height=150 valign="top" ><pre>
<span id="contentSpan"></span></pre>
<br>
<br>
</td>
</tr>
</table>
</form>

<br>

<input type = "button" value ="목록" onclick="location.href='boardList?pg='${pg}">
<input type = "button" value ="답글" onclick="mode(3)">

<span id="boardViewSpan">
 <input type = "button" value ="글수정" onclick="mode(1)">
 <input type = "button" value ="글삭제" onclick="mode(2)">
</span>


<br><br>

<script type="text/javascript">
function mode(num){
	if(num==1){//글수정
		document.boardViewForm.method='post';
		document.boardViewForm.action='boardModifyForm';
		document.boardViewForm.submit(); //submit으로 유효한 네임들의 value값들을 보낸다
	}else if(num==2){//글삭제
		if(confirm('삭제하시겠습니까?')){
		document.boardViewForm.method='post';
		document.boardViewForm.action='boardDelete';
		document.boardViewForm.submit(); 
		}
	}else if(num==3){//답글
		document.boardViewForm.method='post';
		document.boardViewForm.action='boardReplyForm';
		document.boardViewForm.submit(); 			
	}
	
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url:'/springProject/board/getBoardView',
		data: 'seq='+$('#seq').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
 			$('#subjectSpan').text(data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#idSpan').text(data.boardDTO.id);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#contentSpan').text(data.boardDTO.content); 
		
			if(data.memId==data.boardDTO.id){
				$('#boardViewSpan').show();
			}else{
				$('#boardViewSpan').hide();
			}
				
		},
		error: function(err){
			console.log(err);
		}
		
	});
	
});
</script>



