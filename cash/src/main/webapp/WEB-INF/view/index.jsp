<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
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
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>HOME</h1>
				<p>사용자의 가계부를 관리할 수 있는 홈 페이지입니다</p>
			</div>
		</div>
		
		<div class="container">
			<!-- 공지 -->
			<h3>공지사항
				<button type="button" class="btn btn-sm btn-secondary" style="float: right;" onclick="location.href='/admin/noticeList'">더 보기</button>	
			</h3>
			<div>
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
			
			<br>
			
			<!-- 수입/지출/총계 -->
			<h3>최근 수입/지출 내역 요약</h3>
			<div>
				<table class="table ioTable">
					<thead>
						<tr>
							<th>날짜</th>
							<th>수입</th>
							<th>지출</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="io" items="${inOutList}">
							<tr>
								<td>${io["날짜"]}</td>
								<td>${io["수입"]}</td>
								<td>${io["지출"]}</td>
								<td>${io["합계"]}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<br><br>
		</div>
	</body>
</html>