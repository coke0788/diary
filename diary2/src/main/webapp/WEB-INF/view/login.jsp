<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 	<html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		$('#logoutBtn').click(function(){
			console.log('logout!');
			$('#logout').submit();
		});
	});
	</script>
	</head>
	<body>
	<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
			<jsp:include page="/WEB-INF/view/inc.jsp"></jsp:include>
		<div id="fh5co-main">
			<aside id="fh5co-hero" class="js-fullheight">
				<div class="flexslider js-fullheight">
					<ul class="slides">
				   	<li style="background-image: url(images/slide-image01.jpg);">
				   		<div class="overlay"></div>
				   		<div class="container-fluid">
				   			<div class="row">
					   			<div class="col-md-8 col-md-offset-2 text-center js-fullheight slider-text">
					   				<div class="slider-text-inner">
						   				<c:if test="${sessionMember!=null}">
						   					<h1> ${sessionMember.memberId}님, 반갑습니다 !</h1>
						   					<form action="${pageContext.request.contextPath}/auth/logout" id="logout">
						   					<p>
						   						<button type="button" id="logoutBtn" class="btn btn-primary btn-demo popup-vimeo"> <i class="icon-user-delete"></i> LOGOUT</button> 
						   						<a href="${pageContext.request.contextPath}/auth/diary?memberNo=${sessionMember.memberNo}" class="btn btn-primary btn-learn">GO TO DIARY<i class="icon-arrow-right3"></i></a>
						   					</p>
						   					</form>
						   				</c:if>
					   					<c:if test="${sessionMember==null}">
					   						<h1> LOGIN HERE </h1>
					   					<form action="${pageContext.request.contextPath}/login" method="post">
						   					<div class="col-md-offset-3 col-md-6">
							   					<div class="form-group">
													<input type="text" class="form-control text-body" placeholder="Id" name="memberId" value="gd">
												</div>
												<div class="form-group">
													<input type="password" class="form-control text-body" placeholder="Password" name="memberPw" value="1234">
												</div>
											</div>
											<div>
											</div>
											<div class="col-md-offset-3 col-md-6">
												<div class="form-group">
													<button type="submit" class="btn btn-primary btn-lg" >LOGIN</button>
													<a href="${pageContext.request.contextPath}/insert"><button type="button" class="btn btn-primary btn-lg">SIGNUP</button></a>
												</div>
											</div>
										</form>
										</c:if>
					   				</div>
					   			</div>
					   		</div>
				   		</div>
				   	</li>
				  	</ul>
			  	</div>
			</aside>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="js/main.js"></script>

	</body>
</html>

