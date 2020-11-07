<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>index</title>
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
		
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.table a {
				color: #000000;
			}
			
			.ioTable td {
				width: 25%;
			}
		</style>
		
		<script>
			function addComma(num) {
				let regexp = /\B(?=(\d{3})+(?!\d))/g;
				return num.toString().replace(regexp, ',');
			}
		</script>
	</head>
	
	<body>
		
		<!-- ======= Top Bar ======= -->
	  	<div id="topbar" class="d-none d-lg-flex align-items-end fixed-top topbar-transparent">
	    	<div class="container d-flex justify-content-end">
	      		&nbsp;
	    	</div>
	  	</div>
	
		<!-- ======= Header ======= -->
		<header id="header" class="fixed-top header-transparent">
			<div class="container d-flex align-items-center">				
				<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
			</div>
		</header>
		<!-- End Header -->
	
		<!-- ======= Hero Section ======= -->
		<!-- 수입/지출/총계 -->
		<section id="hero" class="clearfix">
			<div class="container d-flex h-100">
				<div class="row justify-content-center align-self-center" data-aos="fade-up" style="width: 100%; text-align: center;">
			        <div style="display: inline-block;" class="col-md-12 intro-img order-md-last order-first" data-aos="zoom-out" data-aos-delay="0">
			        	<h1>최근 수입/지출 내역</h1>
			        	<br><br>
			        </div>
			        <br>
			        <input type="hidden" value="${i = 0}">
			        <c:forEach var="io" items="${inOutList}">
			        	<input type="hidden" value="${i = i + 200}">
				        <div style="display: inline-block;" class="col-md-4 intro-img order-md-last order-first" data-aos="zoom-out" data-aos-delay="${i}">
				          	<div class="card">
				          		<div class="card-header">
				          			<font size="5em"><b>${io["날짜"]}</b></font>
				          		</div>
							  	<div class="card-body">
							  		<br>
									<table class="table" style="margin: auto; text-align: center; width: 80%;">
										<tr>
											<td width="40%">
												<font size="4em">수입</font>
											</td>
											<td width="60%">
												<script>document.write(addComma(${io["수입"]}));</script>
											</td>
										</tr>
										<tr style="border-collapse: separate; border-spacing: 0 10px;">
											<td>
												<font size="4em">지출</font>
											</td>
											<td>
												<script>document.write(addComma(${io["지출"]}));</script>
											</td>
										</tr>
										<tr style="border-collapse: separate; border-spacing: 0 10px;">
											<td>
												<font size="4em">합계</font>
											</td>
											<td>
												<script>document.write(addComma(${io["합계"]}));</script>
											</td>
										</tr>
									</table>
									<br>
								</div>
							</div>
				    	</div>
				    </c:forEach>
				</div>
			</div>
		</section>
	
		<main id="main">
	
			<!-- ======= About Section ======= -->
			<section id="about" class="about">
	
				<div class="container" data-aos="fade-up">
					<!-- 공지 -->
					<h3>공지사항
						<button type="button" class="btn btn-sm btn-secondary" style="float: right;" onclick="location.href='/admin/noticeList'">더 보기</button>	
					</h3>
					<table class="table">
						<thead>
							<tr>
								<th width="15%">번호</th>
								<th width="60%">제목</th>
								<th width="25%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${noticeList}">
								<tr>
									<td>${n.noticeId}</td>
									<td><a href="/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeTitle}</a></td>
									<td>${n.noticeDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
	
			</section>
			<!-- End About Section -->
	
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