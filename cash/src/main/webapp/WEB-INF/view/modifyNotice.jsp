<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>modifyNotice</title>
		<meta content="" name="descriptison">
		<meta content="" name="keywords">
		
		<!-- Favicons -->
		<link href="/assets/img/favicon.png" rel="icon">
		<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
		
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
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<style>
			textarea {
				min-height: 300px;
			}
		
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
			
			.msgDiv {
				color: #FF0000;
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
						<li><a href="/admin/noticeList/1">NoticeList</a></li>
						<li>ModifyNotice</li>
					</ol>
					<h2>공지사항 수정</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<!-- 공지사항 수정 -->
					<div>
						<form method="post" action="/admin/modifyNotice" id="noticeForm">
							<table class="table">
								<tr>
									<td width="20%">번호</td>
									<td width="80%"><input type="text" class="form-control" name="noticeId" id="noticeId" value="${notice.noticeId}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>날짜</td>
									<td><input type="text" class="form-control" name="noticeDate" id="noticeDate" value="${notice.noticeDate}" readonly="readonly"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" class="form-control" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea class="form-control" name="noticeContent" id="noticeContent">${notice.noticeContent}</textarea></td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-primary btn-block" id="btn">수정</button>
									</td>
								</tr>
							</table>
						</form>
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