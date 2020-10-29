<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<style>
body {
	background-image: 
	url("https://wallpapercave.com/wp/EL4ErXX.jpg");
	background-repeat:no-repeat;
/* 	background-size:cover; */
} 

</style>
</head>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="5">
<tr>
	<td colspan="2" align="right"><jsp:include page="../template/top.jsp" /></td>
</tr>

<tr>
	<jsp:include page="../template/left.jsp" />
	<td align="right"><jsp:include page="${display}" /></td>
</tr>
	
<tr>
	<td colspan="2"><jsp:include page="../template/bottom.jsp" /></td>
</tr>

</table>

</body>
</html>