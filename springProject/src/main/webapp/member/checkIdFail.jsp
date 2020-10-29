<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
</head>
<body>
<form method="post" action="/miniProject/member/checkId.do"> 

[ ${requestScope.id } ]은 사용 불가능한 아이디입니다.
<br><br>
<input type="text" name="id">
<input type="submit" value="검색">

</form>
</body>
<script type="text/javascript" src="../js/member.js">
</script>

</html>