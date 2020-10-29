<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board 글목록</title>
<style type="text/css">
.subjectA:link {
	color: black;
	text-decoration: none;
}

.subjectA:visited {
	color: black;
	text-decoration: none;
}

.subjectA:hover {
	color: green;
	text-decoration: underline;
}

.subjectA:active {
	color: black;
	text-decoration: none;
}

#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<br>
	<br>
			<input type="hidden" id="pg" value=${pg}>
			
	<table id="table" name="table" border="1" width=800px cellspacing=0
		cellpadding=3 style="table-layout: fixed" frame="hsides" rules="rows">
		<tr border=1>
			<th align=center width='100'>글번호</th>
			<th align=center width='300'>제목</th>
			<th align=center width='100'>작성자</th>
			<th align=center width='100'>작성일</th>
			<th align=center width='100'>조회수</th>
		</tr>


	</table>

	<form id="searchInfo">
		<input type="hidden" name="pg" value="1"> <select
			name="searchOption" id="searchOption" style="width: 50px">
			<option value="subject">제목</option>
			<option value="name">작성자</option>
		</select>&nbsp; <input type="search" name="keyword" id="keyword" size="20"
			value="${requestScope.keyword}"> <input type="button"
			id="searchBtn" value="검색">
	</form>
	<div id="boardPagingDiv" style="width: 650px; text-align: center;"></div>
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'post',
			url : '/springProject/board/getBoardList',
			data : 'pg='+$('#pg').val(),
			dataType : 'json',
			success : function(data) {
				//			alert(JSON.stringify(data));
				$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})).append($('<td/>',{
					}).append($('<a/>',{
						id: 'subjectA',
						href: '#',
						align: 'center',
						text: items.subject,
						class: items.seq+''
					}))
				).append($('<td/>',{
					align: 'center',
					text: items.id
				})).append($('<td/>',{
					align: 'center',
					text: items.logtime
				})).append($('<td/>',{
					align: 'center',
					text: items.hit
				})).appendTo($('#table'));  
				
				//답글
				
				for(i=0; i<=items.lev;i++){
					$('.'+items.seq).before('&emsp;');
				}
				
				if(items.pseq!=0){ //prev는 내 앞 tag이고, before은 나 자신의 바로 앞
					$('.'+items.seq).before($('<img/>',{
						src: '../image/reply.gif'
					}));
				}
				
			}); //each

				//페이징 처리
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				//로그인 여부 & 작성한 글 확인
				$('#table').on('click', '#subjectA', function(){
//					alert($(this).prop('tagName'));
//					alert($(this).parent().prev.text());
					if(data.memId==null){
						alert('먼저 로그인 하세요')
					}else{				//클래스 속성을 가져와라
						let seq = $(this).attr('class');
						let pg = data.pg;
						location.href = '/springProject/board/boardView?seq='+seq+'&pg='+pg;
						
					}
				});
			}
		});

	});

	$('#searchBtn').click(function() {
		$('#boardPagingDiv').empty();

		$.ajax({
			type : 'post',
			url : '/springProject/board/searchList',
			data : $('#searchInfo').serialize(),
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				$('#table tr:gt(0)').remove();

				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.seq
					})).append($('<td/>',{
						align: 'center',
						text: items.subject
					})).append($('<td/>',{
						align: 'center',
						text: items.id
					})).append($('<td/>',{
						align: 'center',
						text: items.logtime
					})).append($('<td/>',{
						align: 'center',
						text: items.hit
					})).appendTo($('#boardListTable'));         
				}); //each
				
				$('#boardPagingDiv').html(data.boardPaging.pagingHTML);

			},
			error : function(err) {
				cosole.log(err);
			}
		});

	});

function checkLogin(memId, seq, pg) {
		if ('${memId}' == '') {
			alert("먼저 로그인하세요.");
		} else {
			location.href = "boardView.do?seq=" + seq + "&pg=" + pg;
		}
}

	function boardPaging(pg) {
		var keyword = document.getElementById("keyword").value;
		if (keyword=="") {
			location.href = "boardList?pg="+pg;
		} else {
			$('input[name=pg]').val(pg);
			$('#searchBtn').trigger('click','continue');
		}

	}
</script>