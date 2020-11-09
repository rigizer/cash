<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>cashbookByDay</title>
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
		
		<style>
			table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.cashbookTableMenu {
				width: 100%;
				text-align: center;
			}
			
			.cashbookTableMenu td {
				vertical-align: middle;
				height: 120px;
			}
			th {
				text-align: center;
				background-color: #F9F9FB;
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
						<li><a href="/admin/cashbookByMonth/-1/-1">CashbookByMonth</a></li>
						<li>CashbookByDay</li>
					</ol>
					<h2>일일 가계부</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<table class="cashbookTableMenu">
						<tr>
							<td width="20%">&nbsp;</td>
							<td width="15%" style="text-align: right;">
								<!-- 이전 -->
								<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}'">
									&nbsp;<i class='fas fa-angle-left' style='font-size:36px'></i>&nbsp;
								</button>
							</td>
							<td width="30%">
								<h3>${currentYear}년 ${currentMonth}월 ${currentDay}일</h3>
							</td>
							<td width="15%" style="text-align: left;">
								<!-- 이후 -->
								<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}'">
									&nbsp;<i class='fas fa-angle-right' style='font-size:36px'></i>&nbsp;
								</button>
							</td>
							<td width="20%">&nbsp;</td>
						</tr>
					</table>
					
					<h3>&nbsp;
						<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}'">수입/지출 입력</button>	
					</h3>
					
					<table class="table">
						<thead>
							<th width="10%">번호</th>
							<th width="10%">수입/지출</th>
							<th width="15%">카테고리</th>
							<th width="20%">금액</th>
							<th width="25%">내용</th>
							<th width="10%">수정</th>
							<th width="10%">삭제</th>
						</thead>
						<tbody>
							<c:if test="${!empty cashbookList}">
								<c:forEach var="c" items="${cashbookList}">
									<tr>
										<td>${c.cashbookId}</td>
										<td>${c.cashbookKind}</td>
										<td>${c.categoryName}</td>
										<td><script>document.write(addComma(${c.cashbookPrice}));</script></td>
										<td>${c.cashbookContent}</td>
										<td>
											<button class="btn btn-sm btn-primary" onclick="location.href='/admin/modifyCashbookByDay/${c.cashbookId}'">수정</button>
										</td>
										<td>
											<button class="btn btn-sm btn-danger" onclick="location.href='/admin/removeCashbookByDay/${c.cashbookId}'">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty cashbookList}">
								<tr>
									<td colspan="7"><br>조회된 데이터가 없습니다<br></td>
								</tr>
							</c:if>
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