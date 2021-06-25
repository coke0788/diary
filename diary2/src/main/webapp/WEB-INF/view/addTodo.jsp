<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTodo</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			console.log('insert!');
			$('#insert').submit();
		});
		$('#back').click(function(){
			history.back();
		});
	});
</script>
</head>
<body>
	<h1>todo 입력</h1>
	<form action="${pageContext.request.contextPath}/auth/addTodo" method="post" id="insert">
	<input value="${memberNo}" name="memberNo" hidden="hidden">
		<div>todoDate: </div>
		<div><input type="text" name="todoDate" value="${todoDate}" readonly="readonly"></div>
		<div>todoTitle: </div>
		<div><input type="text" name="todoTitle"></div>
		<div>todoContent: </div>
		<div><textarea name="todoContent" cols="80" rows="5"></textarea></div>
		<div>todoFontColor: </div>
		<div><input type="color" name="todoFontColor"></div>
		<div>
			<button type="button" id="btn">등록</button>
			<button type="button" id="back">취소</button>
		</div>
		
	</form>
</body>
</html>