<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyTodo</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/auth/modifyTodo" method="post">
		<input type="text" name="todoNo" hidden="hidden" value="${todoNo}">
		<div>todoDate: </div>
		<div><input type="text" name="todoDate" value="${todo.todoDate}"></div>
		<div>todoTitle: </div>
		<div><input type="text" name="todoTitle" value="${todo.todoTitle}"></div>
		<div>todoContent: </div>
		<div><textarea name="todoContent" cols="80" rows="5" >${todo.todoContent}</textarea></div>
		<div>todoFontColor: </div>
		<div><input type="color" name="todoFontColor" value="${todo.todoFontColor}"></div>
		<div>todoAddDate: </div>
		<div><input type="text" name="todoAddDate" value="${todo.todoDate}" readonly="readonly"></div>
		<div>
			<button type="submit">수정</button>
			<a href="${pageContext.request.contextPath}/auth/todoOne?todoNo=${todoNo}"><button type="button">취소</button></a>
		</div>
	</form>
</body>
</html>