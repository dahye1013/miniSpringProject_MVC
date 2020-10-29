<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.productImage{
	width:70px;
	height:70px;
}

.subjectA:link{color:black;text-decoration:none;}
.subjectA:visited{color:black; text-decoration:none;}
.subjectA:hover{color:green; text-decoration:underline;}
.subjectA:active{color:black; text-decoration:none;}
#currentPaging{color:red; text-decoration:underline; cursor:pointer;}
#paging{color:black; text-decoration:none; cursor:pointer;}

</style>
<title>이미지 목록</title>
<form  name="imgList" action="/miniProject/imageboard/imageboardDelete" method="">
<table id="imageboardListTable" border="1" width=800px cellspacing=0 cellpadding=3
	style="table-layout: fixed" frame="hsides" rules="rows">
	<tr>
		<th align=center width='100' >
			<input type="checkbox" name="check" id="all"  onclick="checkAll()">번호</th>
		<th align=center width='300'>이미지</th>
		<th align=center width='200'>상품명</th>
		<th align=center width='100'>단가</th>
		<th align=center width='100'>개수</th>
		<th align=center width='100'>합계</th>
	</tr>
	<c:if test="${list!=null}">
	<c:forEach var="imageBoardDTO" items="${list}">
	<tr>
	    <td align=center>
	    <input type="checkbox" name="checkSingle" id="checkSingle" class="input_check" value="${imageBoardDTO.seq}">${imageBoardDTO.seq}</td>
	    <td align=center><img class="productImage" src="../storage/${imageBoardDTO.image1}" ></td>
	    <td align=center>
		<a class= "subjectA" href="javascript:void(0)"  
			onclick="javascript:view('${imageBoardDTO.seq}')">${imageBoardDTO.imageName}</a></td>
	    	         
	    <td align=center>
	   		<fmt:formatNumber pattern="#,###원" value="${imageBoardDTO.imagePrice}"></fmt:formatNumber>
	    </td>
	    <td align=center>${imageBoardDTO.imageQty}</td>
	    <td align=center>
	    	<fmt:formatNumber pattern="#,###원" value="${imageBoardDTO.imageQty*imageBoardDTO.imagePrice}"></fmt:formatNumber>
	    </td>
	</c:forEach>
	</c:if>
	<tr>
	<c:if test="${memId == 'admin'}">
	<td colspan='6'><input style="float: left;" type="button" value="선택삭제" onclick="choiceDelete()">
	</c:if>
		
	</td>
	</tr>
</table>

</form>
		<form  method="post" action="imageboardSearch.do">
		<input type="hidden" name="pg" value="1">
			<select name="searchOption" id="searchOption" style="width: 100px">
					<option value="seq">상품명</option>
					<option value="imageName">품번</option>
			</select>&nbsp;
			<input type="search" name="keyword" id="keyword" size="20" value="${requestScope.keyword}">
			<input type="submit" value="검색">
		</form>
		

	<div style="width: 700px; text-align: center;">${imageboardPaging.pagingHTML}</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/springProject/imageboard/getImageboardList',
		data: 'pg=${pg}',
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data.list));
			
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
					align: 'center',
					}).append($('<img/>',{
						src: '../storage/'+items.image1,
						style: 'cursor: pointer; width: 70px; height: 70px;'
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.imageName
				})).append($('<td/>',{
					align: 'center',
					text: items.imagePrice.toLocaleString()
				})).append($('<td/>',{
					align: 'center',
					text: items.imageQty
				})).append($('<td/>',{
					align: 'center',
					text: (items.imagePrice*items.imageQty).toLocaleString()
				})).appendTo($('#imageboardListTable'));
			});
			
		}, error: function(err){
			console.log(err);
		}
	});
	
});

</script>

<script type="text/javascript">

function view(seq){
	  
			location.href="imageboardView.do?seq="+seq;
	  	
	}
	
	
function choiceDelete(){
	var check = false;
	var seq = ""; 
		for(i=0; i < imgList.checkSingle.length; i++) {
			if(imgList.checkSingle[i].checked == true){
				check = true;
				if(seq==""){
					seq = imgList.checkSingle[i].value;
				}else
				seq = seq +'-'+imgList.checkSingle[i].value; 
				
			}
		}
	 
		if(check==true){
			if(confirm("삭제하시겠습니까?")!=0){
//				location.href="../imageboard/imageboardDelete.do?seq="+seq;
				document.imgList.submit();
			}else{
				return;
			}
		}
		
		if(check==false){
			alert("선택된 상품이 없습니다.");
		}

	
}

function imageboardPaging(pg){
	location.href="imageboardList.do?pg="+pg;

}
function checkAll(){
	
  	 var check=document.imgList.check.checked; //name을 가져온다
	 if(check){
			for(i=0; i < imgList.checkSingle.length; i++) {
				imgList.checkSingle[i].checked = true;
			}
	 }else{
		 for(i=0; i < imgList.checkSingle.length; i++) {
				imgList.checkSingle[i].checked = false;
			}
	 }   
}

</script>








