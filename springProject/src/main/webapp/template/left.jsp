<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


	<c:if test="${memId==null}">
		<td width="250" valign="middle"><jsp:include page="../member/loginForm.jsp" /></td>
	</c:if>
	
	<c:if test="${memId!=null}">
		<td width="250" valign="middle"><jsp:include page="../member/loginOk.jsp" /></td>
	</c:if>

	<!-- 로그인실패 -->
	<c:if test="${memId==null && loginFail == 'fail'}">
		<td width="250" valign="middle"><jsp:include page="../member/loginFail.jsp" /></td>
	</c:if>



