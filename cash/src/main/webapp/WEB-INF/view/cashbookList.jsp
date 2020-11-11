<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>cashbookList</title>
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
						<li><a href="${pageContext.request.contextPath}/admin/index">Home</a></li>
						<li>CashbookList</a></li>
					</ol>
					<h2>가계부 수입/지출 전체 목록</h2>
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<h3>&nbsp;
						<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='/admin/cashbookListExcel'">전체 가계부 리스트 Excel 다운로드</button>	
					</h3>
				
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>수입/지출</th>
								<th>카테고리</th>
								<th>금액</th>
								<th>내용</th>
								<th>날짜</th>
								<th>데이터 생성일시</th>
								<th>최종 수정일시</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${cashbookList}">
								<tr>
									<td>${c.cashbookId}</td>
									<td>${c.cashbookKind}</td>
									<td>${c.categoryName}</td>
									<td>${c.cashbookPrice}</td>
									<td>${c.cashbookContent}</td>
									<td>${c.cashbookDate}</td>
									<td>${c.createDate}</td>
									<td>${c.updateDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<br>
					
					<!-- 페이지 네비게이션 -->
					<ul class="pagination justify-content-center">
						<!-- 처음으로 버튼 -->
						<c:choose>
							<c:when test="${currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/1">
										<i class='fas fa-angle-double-left'></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link" href="#">
										<i class='fas fa-angle-double-left'></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<!-- 이전 버튼 -->
						<c:choose>
							<c:when test="${currentPage > 1}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage - 1}">
										<i class='fas fa-angle-left'></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link" href="#">
										<i class='fas fa-angle-left'></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<!-- 현재 페이지 표시 -->
						<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
							<c:if test="${i <= lastPage}">
								<c:choose>
									<%-- 현재 페이지 --%>
									<c:when test="${i == currentPage}">
										<li class="page-item active">
											<a class="page-link" href="#">${i}</a>
										</li>
									</c:when>
									<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						
						<!-- 다음 버튼 -->
						<c:choose>
							<c:when test="${currentPage < lastPage}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage + 1}">
										<i class='fas fa-angle-right'></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link" href="#">
										<i class='fas fa-angle-right'></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<!-- 마지막으로 버튼 -->
						<c:choose>
							<c:when test="${currentPage < lastPage}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/cashbookList/${lastPage}">
										<i class='fas fa-angle-double-right'></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link" href="#">
										<i class='fas fa-angle-double-right'></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
					
					<!-- 총 페이지 수 출력 -->
					<table style="margin: auto;">
						<tr>
							<td>
								<button type="button" class="btn btn-outline-dark btn-sm">
									${currentPage} / ${lastPage} 페이지
								</button>
							</td>
						</tr>
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
	
	</body>
</html>