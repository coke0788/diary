<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoOne</title>
</head>
<body>
	<h1>${todo.todoDate} 일정</h1>
	<div>title : </div>
	<div>${todo.todoTitle}</div>
	<div>content: </div>
	<div>${todo.todoContent}</div>
	<div>addDate: </div>
	<div>${todo.todoAddDate}</div>
	<a href="${pageContext.request.contextPath}/auth/modifyTodo?todoNo=${todoNo}&memberNo=${memberNo}"><button type="button">수정</button></a>
	<a href="${pageContext.request.contextPath}/auth/deleteTodo?todoNo=${todoNo}&memberNo=${memberNo}"><button type="button">삭제</button></a>
	<a href="${pageContext.request.contextPath}/auth/diary?memberNo=${memberNo}"><button type="button">달력</button></a>
</body>
</html>