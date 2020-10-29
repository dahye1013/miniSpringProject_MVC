<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<meta charset="UTF-8">

<h1>Spring MVC 미니 프로젝트
<a href="/springProject/main/index">
<img src="../image/pngwing.png" width="100" style="cursor:pointer;">
</a></h1>
<%-- <jsp:include page="../template/left.jsp" /> --%>

<c:if test="${sessionScope.memId != null}">
<a href="../member/modifyForm">회원정보수정</a>&emsp;
<a href="../board/boardWriteForm">글쓰기</a>&emsp;
<a href="../board/boardList?pg=1">목록</a>&emsp;
<a href="../member/logout">로그아웃</a>&emsp;
	<c:if test="${memId == 'admin'}">
		<a href="../imageboard/imageboardWriteForm">상품등록</a> &emsp;
	</c:if>
</c:if>

<c:if test="${sessionScope.memId == null}">
<a href="../member/writeForm">회원가입</a>&emsp;
<!-- <a href="../member/loginForm.do">로그인</a>&emsp; -->
<a href="../board/boardList">목록</a>&emsp;
</c:if>
<a href="../imageboard/imageboardList.do?pg=1">이미지목록</a>&emsp;
