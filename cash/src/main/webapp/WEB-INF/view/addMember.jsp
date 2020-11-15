<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>addMember</title>
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
		
		<!-- jQuery를 이용하여 아이디, 비밀번호 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$('#id').focus();	// 시작 시 폼 커서를 아이디쪽으로 이동

				$('#id').blur(function(){
					// 비동기 요청으로 #id를 서버에 보내고 아이디가 중복인지 아닌지 확인한다.
					
					// 공백 확인
					if($('#id').val() == '') {
						$('#id').focus();
						return;
					}
					
					$.ajax({
						url:'${pageContext.request.contextPath}/admin/idCheck',
						type:'POST',
						data:{id:$('#id').val()},
						success: function(data) {	// "YES" : 사용가능, "NO" : 사용불가
							if(data == 'YES') {
								alert('[' + $('#id').val() + '] 은(는) 사용 가능한 아이디입니다.');
								$('#pw').focus();
							} else {
								alert('[' + $('#id').val() + '] 은(는) 이미 사용 중인 아이디입니다.');
								$('#id').select();
								$('#id').focus();
							}
						}
					});
				});
				
				$("#btn").click(function() {	// 버튼 클릭시 폼 내용의 유효성 검사를 수행
					if ($("#id").val() == '') {	// 아이디가 공백인 경우 수행
						$("#idMsg").html('');	// 메시지 초기화
						$('#idMsg').append('<div style="margin-top: 10px;">아이디를 입력하세요<div>');
						$('#id').focus();
					
						return;
					} else {
						$("#idMsg").text('');	// 메시지 초기화
					}
					
					if ($("#pw").val() == '') { // 비밀번호가 공백인 경우 수행
						$("#pwMsg").html('');	// 메시지 초기화
						$('#pwMsg').append('<div style="margin-top: 10px;">비밀번호를 입력하세요<div>');
						$('#pw').focus();
					
						return;
					} else {
						$("#pwMsg").html('');	// 메시지 초기화
					}
					$("#memberForm").submit();
				});
			});
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
						<li>AddMember</li>
					</ol>
					<h2>회원 추가</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<!-- 회원 추가 -->
					<div>
						<form method="post" action="${pageContext.request.contextPath}/admin/addMember" id="memberForm">
							<table class="table">
								<tr>
									<td width="20%">ID</td>
									<td width="80%">
										<input type="text" class="form-control" name="id" id="id">
										<div class="msgDiv" id="idMsg"></div>
									</td>
								</tr>
								<tr>
									<td>PW</td>
									<td>
										<input type="password" class="form-control" name="pw" id="pw">
										<div class="msgDiv" id="pwMsg"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-success btn-block" id="btn">회원 추가</button>
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