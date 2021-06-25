<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<body>
	<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary" class="border js-fullheight">

			<h1 id="fh5co-logo">Menu</h1>
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<c:if test="${sessionMember==null}">
						<li class="fh5co-active"><a href="${pageContext.request.contextPath}/login">INDEX</a></li>
						<li><a href="https://coke0788.github.io">ABOUT COKE0788</a></li>
					</c:if>
					<c:if test="${sessionMember!=null}">
						<li><a href="${pageContext.request.contextPath}/login">INDEX</a></li>
						<li><a href="${pageContext.request.contextPath}/auth/diary?memberNo=${sessionMember.memberNo}">DIARY</a></li>
						<li><a href="${pageContext.request.contextPath}/auth/modifyMember?memberNo=${sessionMember.memberNo}">MODIFY</a></li>
						<li><a href="${pageContext.request.contextPath}/auth/removeMember?memberNo=${sessionMember.memberNo}">DELETE</a></li>
						<li><a href="${pageContext.request.contextPath}/auth/logout">LOGOUT</a></li>
						<li><a href="https://github.com/coke0788">ABOUT COKE0788</a></li>
					</c:if>
				</ul>
			</nav>

			<div class="fh5co-footer">
				<p><small>&copy; coke0788 All Rights Reserved.</span> <span>Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> </span> <span>Demo Images: <a href="https://unsplash.com/" target="_blank">Unsplash</a></span></small></p>
			</div>

		</aside>
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
	</head>
	</body>
</html>

