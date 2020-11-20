<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>chart3</title>
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

			//현재 페이지의 이름을 확인하는 함수
			function getPageName(){
			    let pageName = "";
			 
			    let tempPageName = window.location.href;
			    let strPageName = tempPageName.split("/");
			    pageName = strPageName[strPageName.length-1].split("?")[0];
			 
			    return pageName;
			}
			
			var thisPageName = getPageName();
			console.log(thisPageName);

			// url 에서 parameter 추출
			function getParam(sname) {
			    var params = location.search.substr(location.search.indexOf("?") + 1);
			    var sval = "";
			    params = params.split("&");
			    
			    for (var i = 0; i < params.length; i++) {
			        temp = params[i].split("=");
			        if ([temp[0]] == sname) { sval = temp[1]; }
			    }
			    return sval;
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
						<li>월간 카테고리별 수입 내역</li>
					</ol>
					<h2>월간 카테고리별 수입 내역</h2>
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<div class="input-group mb-3" style="width: 50%;">
						<div class="input-group-prepend">
					    	<span class="input-group-text">조회 연도/월</span>
					    </div>
					
						<select class="form-control" id="year">
						    <option>2018</option>
						    <option>2019</option>
						    <option>2020</option>
						    <option>2021</option>
					  	</select>
					  	
					  	<select class="form-control" id="month">
					  		<c:forEach var="i" begin="1" end="12" step="1">
					  			<option>${i}</option>
					  		</c:forEach>
					  	</select>
					  	
					  	<script>
							$('#year').val(getParam("year"));
							$('#month').val(getParam("month"));
						</script>
						
						<div class="input-group-append">
							<button type="submit" class="btn btn-sm btn-info" onclick="location.href='${pageContext.request.contextPath}/admin/chart/' + getPageName() + '?year=' + $('#year').val() + '&month=' + $('#month').val()">입력</button>
						</div>
					</div>
					
					<!-- Chart -->
					<div>
						<canvas id="categoryInByMonthChartResult"></canvas>
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
		<!-- Chart -->
		$.ajax({
			url:'${pageContext.request.contextPath}/admin/categoryInByMonth/' + getParam("year") + '/' +  getParam("month"),
            type:'GET',
            success: function(data) {
               let chartResult = $('#categoryInByMonthChartResult');
               let chart = new Chart(chartResult, {
                  type: 'polarArea',
                  data: {
                     datasets: [{
                   	 	data: [data.급여, data.용돈], 
                        label: getParam("year")+'년 '+getParam("month")+'월 카테고리별 수입 내역 차트',
                        backgroundColor: [
                           	  'rgba(54, 162, 235, 0.2)',
                              'rgba(255, 99, 132, 0.2)'
                           ], 
                           borderColor: [
                              'rgba(54, 162, 235, 1)', 
                              'rgba(255, 99, 132, 1)'
                           ]
                     }], 
                     labels: ['급여', '용돈']
                  },
                  options: {}
               });
            }
		});
	</script>
</html>