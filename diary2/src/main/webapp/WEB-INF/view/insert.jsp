<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<h1>회원가입</h1>
	<div>
		<form action="${pageContext.request.contextPath}/insert" method="post">
			<div>ID : <input type="text" name="memberId"></div>
			<div>PW : <input type="Password" name="memberPw"></div>
			<div><button type="submit">가입</button></div>
		</form>
	</div>
</body>
</html>