<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.productImage{
	width:200px;
	height:200px;
}
</style>
<table  border="1" width=450px cellspacing=0 cellpadding=3 style=table-layout:fixed
			frame="hsides" rules="rows">

<tr>
<td rowspan="5">
<img src="../image/wider.png" width="15" height="15" style="cursor: pointer;" onclick='bigImage()'>
<img src="../image/wider.png" width="15" height="15" id="bigImage" style="cursor: pointer;" >
	<img class="productImage" id="imageView" src="../storage/${imageboardDTO.image1}" ></td>
<td  align="left"><span style = "font-size:1.5em; ">${imageboardDTO.imageName}</span></td>
</tr>

</tr>
<td  align="left">가격: <fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imagePrice}"></fmt:formatNumber></td>
<tr>

<tr>
<td   align="left">개수: ${imageboardDTO.imageQty}</td>
</tr>
<tr>
<td align="left">합계:<fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imageQty*imageboardDTO.imagePrice}"></fmt:formatNumber></td>
</tr>
<tr>
<td colspan="2" align="center" height=150><pre>
${imageboardDTO.imageContent }</pre>
</td>
</tr>
</table>

<br>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function bigImage(){
	let newWindow = window.open("","","width=500 height=500");
	let img = newWindow.document.createElement("img");
	img.setAttribute("src","http://localhost:8080/miniProject/storage/${imageboardDTO.image1}");
	img.setAttribute("width","500");
	img.setAttribute("height","500");
	newWindow.document.body.appendChild(img);
}

$('#bigImage').click(function(){
//	let newWindow = window.open("",'',"width=500 height=500");
	cosole.log("뷰의 확대 이미지 추가");
	let url = $('#imageView').attr('src');
	window.open(url,'','width=500 height=500');		
});




</script>





