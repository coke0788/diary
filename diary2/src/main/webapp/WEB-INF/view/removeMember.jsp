<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeMember</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			console.log('delete!');
			$('#delete').submit();
		});
		$('#back').click(function(){
			history.back();
		});
	});
</script>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/auth/removeMember" id="delete">
	<input value="${memberNo}" name="memberNo" hidden="hidden">
		<div>
			memberPw :
			<input type="password" name="memberPw">
		</div>
		<div>
			<button type="button" id="btn">탈퇴</button>
			<button type="button" id="back">취소</button>
		</div>
		
	</form>
</body>
</html>