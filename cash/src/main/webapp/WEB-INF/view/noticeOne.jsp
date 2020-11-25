<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>noticeOne</title>
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
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.table a {
				color: #000000;
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
						<li><a href="${pageContext.request.contextPath}/admin/index">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/noticeList/1">NoticeList</a></li>
						<li>NoticeOne</li>
					</ol>
					<h2>공지사항 내용</h2>
	
				</div>
			</section>
			<!-- End Breadcrumbs -->
	
			<section class="inner-page pt-4">
				<div class="container">
					<!-- 공지사항 내용 -->
					<div>
						<button type="button" class="btn btn-sm btn-dark" style="float: left;" onclick="location.href='${pageContext.request.contextPath}/admin/noticeList/1'">목록</button>
						
						<table style="float: right;">
							<tr>
								<td>
									<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/modifyNotice/${notice[0].noticeId}'">수정</button>
								</td>
								<td>&nbsp;</td>
								<td>
									<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/removeNotice/${notice[0].noticeId}'">삭제</button>
								</td>
							</tr>
						</table>
						
						<br><br>
					
						<table class="table">
							<tr>
								<td width="20%">번호</td>
								<td width="80%">${notice[0].noticeId}</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>${notice[0].noticeTitle}</td>
							</tr>
							<tr>
								<td>날짜</td>
								<td>${notice[0].noticeDate}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>${notice[0].noticeContent}</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td>
									<c:forEach var="nf" items="${notice[0].noticefileList}">
										<c:if test="${null ne notice[0].noticefileList[0].noticefileName}">
											<div>
												<a href="${pageContext.request.contextPath}/admin/upload/${nf.noticefileName}">
													${nf.noticefileName}
												</a>
											</div>
										</c:if>
										<c:if test="${null eq notice[0].noticefileList[0].noticefileName}">
											(첨부파일이 없습니다)
									    </c:if>
									</c:forEach>
								</td>
							</tr>
						</table>
					</div>
					
					<br>
					
					<!-- 공지사항 댓글 -->
					<div>
						<table class="table center tb-fixed">
							<thead>
								<th width="10%">번호</th>
								<th width="15%">작성자</th>
								<th width="35%">내용</th>
								<th width="20%">작성일</th>
								<th width="10%">삭제</th>
							</thead>
							<tbody>
								<c:forEach var="c" items="${notice[0].commentList}">
									<c:if test="${!empty c.commentContent}">
										<tr>
											<td>${c.commentId}</td>
											<td>${c.commentWriter}</td>
											<td>${c.commentContent}</td>
											<td>${c.commentDate}</td>
											<td>
												<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/removeComment/${c.commentId}/${c.noticeId}'">삭제</button>
											</td>
										</tr>
									</c:if>
									
									<c:if test="${empty c.commentContent}">
										<tr>
											<td colspan="5">(댓글이 없습니다)</td>
										</tr>
									</c:if>
								</c:forEach>
								
								<tr>
									<form action="${pageContext.request.contextPath}/admin/addComment" method="post">
										<td>
											<div>
												<input type="text" class="form-control" name="commentWriter" value="${loginId}" readonly="readonly">
											</div>
										</td>
										<td colspan="4">
											<input type="hidden" name="noticeId" value="${notice[0].noticeId}">
											<div class="input-group">
												<input type="text" class="form-control" name="commentContent"></input>
												<div class="input-group-append">
													<button type="submit" class="btn btn-sm btn-dark">댓글 입력</button>
												</div>
											</div>
										</td>
									</form>
								</tr>
							</tbody>
						</table>
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