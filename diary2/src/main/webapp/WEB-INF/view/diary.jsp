<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
 	<html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>diary</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="FreeHTML5.co" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="../css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="../css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="../css/style.css">

	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
	</head>
	<body>
	<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
			<jsp:include page="/WEB-INF/view/inc.jsp"></jsp:include>
		<div id="fh5co-main">
			<aside id="fh5co-hero" class="js-fullheight">
				<div class="fh5co-narrow-content">
					<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">D-DAY LIST</h2>
					<div class="row">
						<div class="col-md-6">
							<table class="table table-borderless fh5co-feature animate-box"" data-animate-effect="fadeInLeft">
								<thead>
								 <tr>
								 	<th>DATE</th>
								 	<th>TITLE</th>
								 	<th>D-DAY</th>
								 </tr>
								</thead>
								<tbody>
								<c:forEach var="d" items="${ddayList}">
								<tr>
									<td>${d.todoDate}</td>
									<td><a href="${pageContext.request.contextPath}/auth/todoOne?todoNo=${d.todoNo}&memberNo=${memberNo}"><i class="icon-calender"></i> ${d.todoTitle}</a></td>
									<c:if test="${d.dDay<6}">
										<td class="text-danger"><i class="icon-bell2"></i> D-${d.dDay}</td>
									</c:if>
									<c:if test="${d.dDay>=6}">
										<td><i class="icon-pin"></i> D-${d.dDay}</td>
									</c:if>
								</tr>
								</c:forEach>
								</tbody>
							</table>
								<hr>
							</div>
							<br>
							<div class="col-md-12">
								<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">SCHEDULER</h2>
							</div>
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-text">
								<!-- 전체 셀 몇개인지 구하기(앞의 빈칸 + 해당 월의 전체 날짜 + 뒤의 빈칸) -->
								<c:set var="totalCell" value="${diaryMap.startBlank + diaryMap.endDay + diaryMap.endBlank}"></c:set>
								<h2 class="fh5co-heading" data-animate-effect="fadeInLeft">
									<a href="${pageContext.request.contextPath}/auth/diary?targetYear=${diaryMap.targetYear}&targetMonth=${diaryMap.targetMonth-1}&memberNo=${memberNo}"><i class="icon-arrow-left-outline"></i></a>
									<!-- 보여줄 때는 month 값에 +1을 한다. 0값이 1월이기 때문. -->
									${diaryMap.targetYear}년 ${diaryMap.targetMonth+1}월
									<a href="${pageContext.request.contextPath}/auth/diary?targetYear=${diaryMap.targetYear}&targetMonth=${diaryMap.targetMonth+1}&memberNo=${memberNo}"><i class="icon-arrow-right-outline"></i></a>
								</h2>
								</div>
								<table class="table table-light">
									<thead>
									<tr>
										<!-- 전체 셀 개수만큼 테이블을 생성하고 그 안에 숫자를 출력 시킨다. -->
									<c:forEach var="i" begin="1" end="${totalCell}" step="1">
										<!-- 1일의 첫째 요일 앞의 숫자를 다 0이하로 만들것임.-->
										<c:set var="num" value="${i-diaryMap.startBlank}"></c:set>
										<td width="13%">
												<!-- 음수가 아니면서 마지막 날짜 값과 같거나 작은 숫자들만 출력 시킬 것. 해당하지 않으면 공백으로 출력 시킬 것.-->
										<c:if test="${num > 0 && num <= diaryMap.endDay}">
											<div><a href="${pageContext.request.contextPath}/auth/addTodo?year=${diaryMap.targetYear}&month=${diaryMap.targetMonth+1}&day=${num}&memberNo=${memberNo}">
											${num}
											</a></div>
											<div>
												<c:forEach var="todo" items="${todoList}">
												<c:if test="${todo.todoDate==num}">
													<div>
														<a href="${pageContext.request.contextPath}/auth/todoOne?todoNo=${todo.todoNo}&memberNo=${memberNo}" style="color:${todo.todoFontColor}">
														<i class="icon-calender"></i> ${todo.todoTitle}</a>
													</div>
												</c:if>
											</c:forEach>
											</div>
										</c:if>
										<c:if test="${num <= 0 || num > diaryMap.endDay}">
											&nbsp;
										</c:if>
										</td>
											<!-- 7일 단위로 한 칸 씩 띄우기 -->
										<c:if test="${i%7==0}">
											<tr></tr>
										</c:if>
									</c:forEach>
										</tr>
								</table>
						</div>
					</div>
				</div>
			</aside>
			</div>
	</div>

	
		<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="../js/jquery.flexslider-min.js"></script>
	<!-- MAIN JS -->
	<script src="../js/main.js"></script>
</body>
</html>