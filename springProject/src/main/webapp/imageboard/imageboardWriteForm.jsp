<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<title>이미지 등록</title>
<!-- <img src="../image/ff.PNG" width=150> -->
 <h3 align="right">[ 상품 등록 ]</h3>							<!-- 이미지를 업로드 하려면 반드시  enctype="multipart/form-data" 설정필수 -->
<form name="imageboardWriteForm" id="imageboardWriteForm" method="post" action="imageboardWrite" enctype="multipart/form-data">
	<table border="1" cellspacing="0" cellpadding="5" align="right">
		<tr>
			<!--1행-->
			<td width="70" align="center">상품코드</td>
			<td><input type="text" name="imageId" id="imageId" value="img_" >
				<div id="imageIdDiv" class="div"></div>
			</td>
		</tr>
		<tr>
			<!--2행-->
			<td width="70" align="center">상품명</td>
			<td><input type="text" name="imageName" id="imageName" size="35"
				placeholder="상품명 입력">
				<div id="imageNameDiv"  class="div"></div>
				</td>
		</tr>
		<tr>
			<!--3행-->
			<td width="70" align="center">단가</td>
			<td><input type="text" name="imagePrice" id="imagePrice" placeholder="단가 입력">
			<div id="imagePriceDiv"  class="div" ></div>
			</td>
		</tr>
		<tr>
			<!--4행-->
			<td width="70" align="center">갯수</td>
			<td><input type="text" name="imageQty" id="imageQty" placeholder="갯수 입력">
			<div id="imageQtyDiv"  class="div"></div>
			</td>
		</tr>
		<!--5행-->
		<tr>
			<td>내용</td>
			<td><textarea name="imageContent" id="imageContent" cols="40" rows="10"
					style="resize: none;" placeholder="내용 입력"></textarea>
			<div id="imageContentDiv"  class="div"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><!-- submit할때는 img를 데려가고, div체크할때는 iamge1을 사용할 수 있도록 한다. -->
			<input type="file" name="img" id="image1"><br/>
			<div id="image1Div"  class="div"></div>
			</td>

		</tr>
		<tr>
			<td colspan="2">
			<input type="file" name="img" id="image2"><br/>
			</td>

		</tr>
		<tr>
			<td colspan="2">
			<input type="file" name="img[]" id="image3" multiple><br/>
			</td>

		</tr>		
		<tr>
			<!--6행-->
			<td colspan="2" align="center"><input type="button" id="imageboardWriteBtn" value="이미지 등록" >&emsp; <input
				type="reset" value="다시작성">&emsp; 
			</td>
		</tr>
	</table>

</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$('#imageboardWriteBtn').click(function(){

	$('.div').empty();
	$('.div').css('color','red');
	$('.div').css('font-size','8pt');	
	$('.div').css('font-weight','bold');	
	
	if($('#imageId').val()=='img_'||$('#imageId').val()==''){
		$('#imageIdDiv').text('상품코드를 입력하세요');		
	}else if($('#imageName').val()==''){
		$('#imageNameDiv').text('상품 이름을 입력하세요');		
	}else if($('#imagePrice').val()==''){
		$('#imagePriceDiv').text('상품 가격을 입력하세요. (숫자만 기입)');		
	}else if($('#imageQty').val()==''){
		$('#imageQtyDiv').text('상품 수량을 입력하세요');		
	}else if($('#imageContent').val()==''){
		$('#imageContentDiv').text('상품 설명을 입력하세요');		
	}/* else if($('#image1').val()==''){
		$('#image1Div').text('상품 이미지를 업로드하세요.');		
	} */
	else{
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false, //문자열이 아닌것으로 가게 만든다
			contentType: false, //주소값이 아니라 업로드로 가게 하기 위해서는 이 둘을 꼭 false해야함
			url: '/springProject/imageboard/imageboardWrite',
			data: new FormData($('#imageboardWriteForm')[0]),
			success: function(data){
				alert("이미지 업로드 완료");	
				location.href='/springProject/imageboard/imageboardList';
			},
			error: function(err){
				console.log(err);
			}
		});
	
	}
});
</script>

