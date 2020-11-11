<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>chart1</title>
		<meta content="" name="descriptison">
		<meta content="" name="keywords">
		
		<!-- Favicons -->
		<link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
		<link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
		
		<!-- Google Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700"
			rel="stylesheet">
		
		<!-- Vendor CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css"
			rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/vendor/ionicons/css/ionicons.min.css"
			rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/vendor/venobox/venobox.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
			rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
		
		<!-- Template Main CSS File -->
		<link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
		
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
				width: ${100/6}%;
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
						<li><a href="${pageContext.request.contextPath}/admin/index">Home</a></li>
						<li>Statistics</li>
						<li>연간 월별 지출 내역</li>
					</ol>
					<h2>연간 월별 지출 내역</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<!-- Table -->
					<div>
						<div id="totalOfMonthByYearTableResult"></div>
					</div>
					
					<!-- Chart -->
					<div>
						<canvas id="totalOfMonthByYearChartResult"></canvas>
					</div>
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
	</body>
	
	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/counterup/counterup.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/venobox/venobox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
	<!-- jQuery Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Chart.js CDN -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	
	<script>
		<!-- Table -->
		$.ajax({
			url:${pageContext.request.contextPath}+'/admin/totalOfMonthByYear',
		    type:'GET',
		    success: function(data) {
				// console.log(data);
				
				let html = `
					<br>
					
					<!-- 1 ~ 6월 -->
					<table class="table">
						<thead>
							<tr>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data.january.toLocaleString()}</td>
								<td>\${data.february.toLocaleString()}</td>
								<td>\${data.march.toLocaleString()}</td>
								<td>\${data.april.toLocaleString()}</td>
								<td>\${data.may.toLocaleString()}</td>
								<td>\${data.june.toLocaleString()}</td>
							</tr>
						</tbody>
					</table>
					
					<br>
					
					<!-- 7 ~ 12월 -->
					<table class="table">
						<thead>
							<tr>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>\${data.july.toLocaleString()}</td>
								<td>\${data.august.toLocaleString()}</td>
								<td>\${data.september.toLocaleString()}</td>
								<td>\${data.october.toLocaleString()}</td>
								<td>\${data.november.toLocaleString()}</td>
								<td>\${data.december.toLocaleString()}</td>
							</tr>
						</tbody>
					</table>
				`;
				
				$('#totalOfMonthByYearTableResult').html(html);
			}
		});
	
		<!-- Chart -->
		$.ajax({
		     url:${pageContext.request.contextPath}+'/admin/totalOfMonthByYear',
		     type:'GET',
		     success: function(data) {
		        var ctx = document.getElementById('totalOfMonthByYearChartResult').getContext('2d');
		        var chart = new Chart(ctx, {
		           // The type of chart we want to create
		            type: 'bar',
		
		            // The data for our dataset
		            data: {
		               // 배열 형태로 작성
		                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		                datasets: [{
		                    label: '2019년 월별 지출 내역 차트',
		                    backgroundColor: [
		                       	'rgba(255, 99, 132, 0.2)',
		                        'rgba(54, 162, 235, 0.2)',
		                        'rgba(255, 206, 86, 0.2)',
		                        'rgba(75, 192, 192, 0.2)',
		                        'rgba(153, 102, 255, 0.2)',
		                        'rgba(255, 159, 64, 0.2)', 
		                        'rgba(255, 99, 132, 0.2)',
		                        'rgba(54, 162, 235, 0.2)',
		                        'rgba(255, 206, 86, 0.2)',
		                        'rgba(75, 192, 192, 0.2)',
		                        'rgba(153, 102, 255, 0.2)',
		                        'rgba(255, 159, 64, 0.2)'
		                    ],
		                    borderColor: [
		                       	'rgba(255, 99, 132, 1)',
		                        'rgba(54, 162, 235, 1)',
		                        'rgba(255, 206, 86, 1)',
		                        'rgba(75, 192, 192, 1)',
		                        'rgba(153, 102, 255, 1)',
		                        'rgba(255, 159, 64, 1)',
		                        'rgba(255, 99, 132, 1)',
		                        'rgba(54, 162, 235, 1)',
		                        'rgba(255, 206, 86, 1)',
		                        'rgba(75, 192, 192, 1)',
		                        'rgba(153, 102, 255, 1)',
		                        'rgba(255, 159, 64, 1)'
		                    ],
		                    data:[data.january, data.february, data.march, data.april, data.may, data.june, 
		                         data.july, data.august, data.september, data.october, data.november, data.december],
		                    borderWidth: 1
		                }]
		            },
		
		            // Configuration options go here
		        	options: {}
				});
			}
		});
	</script>
</html>