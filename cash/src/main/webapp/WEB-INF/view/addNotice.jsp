<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>addNotice</title>
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
		
		<!-- jQuery를 이용하여 제목, 내용 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$('#noticeTitle').focus();	// 시작 시 폼 커서를 noticeTitle쪽으로 이동
				
				// 파일 추가 버튼을 누를 때
				$('#addBtn').click(function() {
					html = '<div><input type="file" class="form-control noticefileList" name="noticefileList"></div>';
					$('#fileinput').append(html);
				});

				// 파일 삭제 버튼을 누르면 마지막에 append된 첨부파일이 삭제
				$('#delBtn').click(function() {
					$('#fileinput').children().last().remove();
				});

				$("#submitBtn").click(function() {	// 버튼 클릭시 폼 내용의 유효성 검사를 수행
					if ($("#noticeTitle").val() == "") {	// noticeTitle이 공백인 경우 수행
						$("#noticeTitleMsg").html('');	// 메시지 초기화
						$('#noticeTitleMsg').append('<div style="margin-top: 10px;">제목을 입력하세요<div>');
						$('#noticeTitle').focus();
					
						return;
					} else {
						$("#noticeTitleMsg").text('');	// 메시지 초기화
					}
					
					if ($("#noticeContent").val() == "") { // noticeContent가 공백인 경우 수행
						$("#noticeContentMsg").html('');	// 메시지 초기화
						$('#noticeContentMsg').append('<div style="margin-top: 10px;">내용을 입력하세요<div>');
						$('#noticeContent').focus();
					
						return;
					} else {
						$("#noticeContentMsg").html('');	// 메시지 초기화
					}
					
					// 비어있는 파일이 있는지 체크 (없으면 true, 하나라도 있으면 false)
					let ck = true;
					
					// 반복문을 돌리면서 각 첨부파일을 확인
					$('.noticefileList').each(function(index, item) {
						console.log($(item).val());
						
						// 비어있는 파일이 하나라도 있는 경우
						if($(item).val() == '') {
							ck = false;
						}
					});

					// ck가 true일 때만 폼 입력 가능
					if (ck == true) {
						$('#noticeForm').submit();
					} else {	// 아닌 경우 경고창 띄우기
						alert('선택하지 않은 파일이 있습니다.\n다시 한 번 확인해주세요.');
					}
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
						<li><a href="${pageContext.request.contextPath}/admin/noticeList/1">NoticeList</a></li>
						<li>AddNotice</li>
					</ol>
					<h2>공지사항 작성</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<!-- 공지사항 작성 -->
					<div>
						<form method="post" action="${pageContext.request.contextPath}/admin/addNotice" enctype="multipart/form-data" id="noticeForm">
							<table class="table">
								<tr>
									<td width="20%">제목</td>
									<td width="80%">
										<input type="text" class="form-control" name="noticeTitle" id="noticeTitle">
										<div class="msgDiv" id="noticeTitleMsg"></div>
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>
										<textarea class="form-control" name="noticeContent" id="noticeContent"></textarea>
										<div class="msgDiv" id="noticeContentMsg"></div>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<div>
											<button type="button" class="btn btn-sm btn-dark" id="addBtn">파일 추가</button>
											<button type="button" class="btn btn-sm btn-dark" id="delBtn">파일 삭제</button>
										</div>
										<div id="fileinput"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="button" class="btn btn-success btn-block" id="submitBtn">글쓰기</button>
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