
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>

</head>
<body>
<form method="post" action="checkId.jsp"> 

[ ${id } ]은 사용 가능합니다.
<br><br>
<input type="button" value="사용하기" onclick="checkIdClose('${id }')">



</form>
</body>
<script type="text/javascript" src="../js/member.js">
</script>

</html>