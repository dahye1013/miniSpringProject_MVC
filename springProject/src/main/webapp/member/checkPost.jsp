<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>

    
<title>우편번호</title>
<link rel="stylesheet" href="../css/member.css">
<body>
<form name="newzipcode" id="newzipcode" >
		<table border="1" id="postalTable" name="postalTable" width = "100%" cellspacing="0" cellpadding="3">
			<tr>
				<!--1행-->
				<th width="70" align="center">시도</th>
				<td><select name="sido" style="width: 100px">
						<option value="">시도선택</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="광주">광주</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="전남">전남</option>
						<option value="광주">전북</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>					
				</select></td>
				<th width="70" align="center">시,군,구</th>
				<div id="sidoDiv"></div>
				<td><input type="text" name="sigungu" id="sigungu" size="30">
				<div id="sigunguDiv"></div></td>
			</tr>
			<tr>
				<!--2행-->
				<th  align="center">도로명</th>
				<td colspan="3"><input type="text" name="roadname" id="roadname" size="30">
				<input type="button" id="checkPostBtn" value="검색" >
				<div id="roadnameDiv"></div>
				</td>
			</tr>
			 <tr>
				<!--2행-->
				<th  align="center">우편번호</th>
				<th align="center" colspan="4">주소</th>
				
			</tr>
		
</table>
</form>
</body>
<!-- <script type="text/javascript" src="../js/member.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" >
$('#checkPostBtn').click(function(){
	$('#sidoDiv').empty();
	$('#sigunguDiv').empty();
	$('#roadnameDiv').empty();
	
	if($('#sido').val()==''){
		$('#sidoDiv').text('시도 선택');		
	}else if($('#sigungu').val()==''){
		$('#sigunguDiv').text('시군구 선택');				
	}else{
 		$.ajax({
			type: 'post',
			url: '/springProject/member/zipcodeList',
			data: $('#newzipcode').serialize(),
			//contentType: 'application/json;charset=UTF-8',
			dataType: 'json',
			success: function(data){

 					$('#postalTable tr:gt(2)').remove(); 
 					$.each(data.list, function(index, items){
 						let address = items.sido+' '
 									+ items.sigungu+' '
 									+ items.yubmyundong+' '
 									+ items.ri+' '
 									+ items.roadname+' '
 									+ items.buildingname;
 					
 						address = address.replace(/null/g,'');
 						//address에 null이나오면 ''로 바꿔라
 						
 						$('<tr/>').append($('<td/>',{
 							align: 'center',
 							text: items.zipcode
 						})).append($('<td/>',{
 							colspan:'3',
 						}).append($('<a/>',{
 							href:'#',
 							id:'addressA',
 							text:address
 						}))).appendTo($('#postalTable'));    
 					});//each
 					
 					//에이 태그를 클릭했을때
 					$('a').click(function(){
 						//this는 a태그 object를 의미한다.
 						//tagName으로 위치를 호출해본다..
 						//a태그의 부모는 td이다.
 						//prev()는 이전의 것을 의미한다.
// 						alert($(this).parent().prop('tagName'));
 						alert($(this).parent().prev().text());
						$('#zipcode', opener.document).val($(this).parent().prev().text() );
						$('#addr1', opener.document).val($(this).parent().text() );
						$('#addr2', opener.document).focus();
						window.close();
 					});
			},
			error: function(err){
				console.log(err);
			}			
		}); 
	
	}
	
	
	
});


</script>