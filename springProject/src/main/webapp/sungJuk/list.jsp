<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>

</head>
<body>
	<br>
	<br>
	<input type="hidden" id="pg" value=${pg}>
			
	<table id="table" name="table" border="1" width=800px cellspacing=0
		cellpadding=3 style="table-layout: fixed" frame="hsides" rules="rows">
		<tr border=1>
			<th align=center width='30'>번호</th>
			<th align=center width='50'>이름</th>
			<th align=center width='30'>국어</th>
			<th align=center width='30'>영어</th>
			<th align=center width='30'>수학</th>
			<th align=center width='30'>총점</th>
			<th align=center width='30'>평균</th>
		</tr>
	</table>

</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$.ajax({
			type:'post',
			url : '/springProject/sungjuk/getList',
			dataType : 'json',
			success : function(data) {
				alert(JSON.stringify(data));
 				$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.no
				})).append($('<td/>',{
					align: 'center',
					text: items.name
				})).append($('<td/>',{
					align: 'center',
					text: items.kor
				})).append($('<td/>',{
					align: 'center',
					text: items.eng
				})).append($('<td/>',{
					align: 'center',
					text: items.math
				})).append($('<td/>',{
					align: 'center',
					text: items.tot
				})).append($('<td/>',{
					align: 'center',
					text: items.avg
				})).appendTo($('#table'));  
				
				
			}); //each 



			}
		});

	});

</script>