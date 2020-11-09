<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>cashbookByMonth</title>
		<meta content="" name="descriptison">
		<meta content="" name="keywords">
		
		<!-- Favicons -->
		<link href="/assets/img/favicon.png" rel="icon">
		<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
		
		<!-- Google Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700"
			rel="stylesheet">
		
		<!-- Vendor CSS Files -->
		<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">
		<link href="/assets/vendor/font-awesome/css/font-awesome.min.css"
			rel="stylesheet">
		<link href="/assets/vendor/ionicons/css/ionicons.min.css"
			rel="stylesheet">
		<link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
		<link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
			rel="stylesheet">
		<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
		
		<!-- Template Main CSS File -->
		<link href="/assets/css/style.css" rel="stylesheet">
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<style type="text/css">
			.sunday a {
				color: #FF0000;
			}
			.saturday a {
				color: #0000FF;
			}
			.weekday a {
				color: #000000;
			}
			
			.sunday {
				color: #FF0000;
			}
			.saturday {
				color: #0000FF;
			}
			.weekday {
				color: #000000;
			}
			
			.cashbookTableMenu {
				width: 100%;
				text-align: center;
			}
			
			.cashbookTableMenu td {
				vertical-align: middle;
			}
			
			th {
				width: ${100/7}%;
				text-align: center;
				background-color: #F9F9FB;
			}
			td {
				height: 120px;
				vertical-align: top;
			}
			.diaryTable td {
				height: 130px;
				vertical-align: top;
			}
		</style>
		
		<script>
			// 금액 숫자에 콤마 찍는 함수
			function addComma(num) {
				let regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
		</script>
	</head>
	
	<body>
	
		<!-- ======= Top Bar ======= -->
		<div id="topbar" class="d-none d-lg-flex align-items-end fixed-top ">
		    <div class="container d-flex justify-content-end">
		      	&nbsp;
		    </div>
	    </div>
	
		<!-- ======= Header ======= -->
		<header id="header" class="fixed-top">
			<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		</header>
		<!-- End Header -->
	
		<main id="main">
	
			<!-- ======= Breadcrumbs ======= -->
			<section id="breadcrumbs" class="breadcrumbs">
				<div class="container">
	
					<ol>
						<li><a href="/admin/index">Home</a></li>
						<li>CashbookByMonth</li>
					</ol>
					<h2>월별 가계부</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<!-- 이번 달 총 수입/지출 -->
					<table class="cashbookTableMenu">
						<tr>
							<td width="20%">
								<div class="card">
								  	<div class="card-header bg-primary"><font size="3em" color="white">수입 합계</font></div>
								  	<div class="card-body">
								  		<font size="5.5em"><script>document.write(addComma(${sumIn}));</script></font>
								  	</div>
								</div>
							</td>
							<td width="15%" style="text-align: right;">
								<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByMonth/${currentYear}/${currentMonth - 1}'">
									<i class='fas fa-angle-double-left' style='font-size:36px'></i>
								</button>
		
							</td>
							<td width="30%">
								<h3>${currentYear}년 ${currentMonth}월</h3>
							</td>
							<td width="15%" style="text-align: left;">
								<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByMonth/${currentYear}/${currentMonth + 1}'">
									<i class='fas fa-angle-double-right' style='font-size:36px'></i>
								</button>
							</td>
							<td width="20%">
								<div class="card">
								  	<div class="card-header bg-danger"><font size="3em" color="white">지출 합계</font></div>
								  	<div class="card-body">
								  		<font size="5.5em"><script>document.write(addComma(${sumOut}));</script></font>
								  	</div>
								</div>
							</td>
						</tr>
					</table>
					
					<br>
					
					<!-- 다이어리 -->
					<table class="table table-bordered diaryTable">
						<thead>
							<tr>
								<th class="sunday">일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th class="saturday">토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="i" begin="1" end="${lastDay + (firstDayOfWeek - 1)}" step="1">
									<c:if test="${i - (firstDayOfWeek - 1) < 1}">
										<td>&nbsp;</td>
									</c:if>
									
									<c:if test="${i - (firstDayOfWeek - 1) > 0}">
										<td>
											<!-- 일요일 -->
											<c:if test="${i % 7 == 1}">
												<div class="sunday">
													<a href="/admin/cashbookByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
												</div>
											</c:if>
											
											<!-- 토요일 -->
											<c:if test="${i % 7 == 0}">
												<div class="saturday">
													<a href="/admin/cashbookByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
												</div>
											</c:if>
											
											<!-- 평일 (월요일 ~ 금요일) -->
											<c:if test="${i % 7 != 1 && i % 7 != 0}">
												<div class="weekday">
													<a href="/admin/cashbookByDay/default/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
												</div>
											</c:if>
											
											<!-- 수입/지출 목록이 있는 날짜를 cashList에서 검색 -->
											<c:forEach var="c" items="${cashList}">
												<c:if test="${i - (firstDayOfWeek - 1) == c.dDay}">
													<c:if test="${c.cashbookKind == '수입'}">
														<div><font color="blue"><b>수입</b></font> : <script>document.write(addComma(${c.cashbookPrice}));</script></div>
													</c:if>
													<c:if test="${c.cashbookKind == '지출'}">
														<div><font color="red"><b>지출</b></font> : <script>document.write(addComma(${c.cashbookPrice}));</script></div>
													</c:if>
												</c:if>
											</c:forEach>
										</td>
									</c:if>
									
									<c:if test="${i != (lastDay + (firstDayOfWeek - 1))}">
										<c:if test="${i % 7 == 0}">
											</tr><tr>
										</c:if>
									</c:if>
								</c:forEach>
								
								<c:if test="${(lastDay + (firstDayOfWeek - 1)) % 7 != 0}">	
									<c:forEach begin="1" end="${7 - ((lastDay + (firstDayOfWeek - 1)) % 7)}" step="1">	
										<td>&nbsp;</td>	
									</c:forEach>	
								</c:if>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
	
		</main>
		<!-- End #main -->
	
		<!-- ======= Footer ======= -->
		<footer id="footer" class="section-bg">
			<div class="container">
				<div class="copyright">
					&copy; Copyright <strong>Jaeyong Han</strong>. All Rights Reserved
				</div>
			</div>
		</footer>
		<!-- End  Footer -->
	
		<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	
		<!-- Vendor JS Files -->
		<script src="/assets/vendor/jquery/jquery.min.js"></script>
		<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="/assets/vendor/php-email-form/validate.js"></script>
		<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="/assets/vendor/counterup/counterup.min.js"></script>
		<script src="/assets/vendor/venobox/venobox.min.js"></script>
		<script src="/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
		<script src="/assets/vendor/aos/aos.js"></script>
	
		<!-- Template Main JS File -->
		<script src="/assets/js/main.js"></script>
	
	</body>
</html>