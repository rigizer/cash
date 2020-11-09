<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>modifyCashbookByDay</title>
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
			td {
				width: 50%;
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
		</style>
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
						<li>ModifyCashbook</li>
					</ol>
					<h2>가계부 수정</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<form method="post" action="/admin/modifyCashbookByDay">
						<table class="table">
							<tr>
								<td>번호</td>
								<td>
									<input type="text" class="form-control" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>날짜</td>
								<td>
									<input type="text" class="form-control" name="cashbookDate" value="${cashbook.cashbookDate}" readonly="readonly">
								</td>
							</tr>			
							<tr>
								<td>수입/지출</td>
								<td>
									<c:if test="${cashbook.cashbookKind == '수입'}">
										<input type="radio" name="cashbookKind" value="수입" checked="checked">&nbsp;수입
										&nbsp;&nbsp;&nbsp;
										<input type="radio" name="cashbookKind" value="지출">&nbsp;지출
									</c:if>
									<c:if test="${cashbook.cashbookKind == '지출'}">
										<input type="radio" name="cashbookKind" value="수입">&nbsp;수입
										&nbsp;&nbsp;&nbsp;
										<input type="radio" name="cashbookKind" value="지출" checked="checked">&nbsp;지출
									</c:if>
								</td>
							</tr>
							<tr>
								<td>카테고리</td>
								<td>
									<select class="form-control" name="categoryName">
										<c:forEach var="c" items="${categoryList}">
											<c:if test="${c.categoryName == cashbook.categoryName}">
												<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
											</c:if>
											<c:if test="${c.categoryName != cashbook.categoryName}">
												<option value="${c.categoryName}">${c.categoryName}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>금액</td>
								<td>
									<input type="text" class="form-control" name="cashbookPrice" value="${cashbook.cashbookPrice}">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<input type="text" class="form-control" name="cashbookContent" value="${cashbook.cashbookContent}">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="submit" class="btn btn-primary btn-block">수정</button>
								</td>
							</tr>
						</table>
					</form>
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