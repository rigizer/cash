<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noticeOne</title>
		
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
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>공지사항</h1>
				<p>공지사항 내용을 확인할 수 있는 페이지입니다</p>
			</div>
		</div>
		
		<div class="container">
			<!-- 공지사항 내용 -->
			<div>
				<table class="table">
					<tr>
						<td width="20%">번호</td>
						<td width="80%">${notice.noticeId}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${notice.noticeTitle}</td>
					</tr>
					<tr>
						<td>날짜</td>
						<td>${notice.noticeDate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${notice.noticeContent}</td>
					</tr>
				</table>
			</div>
			
			<button type="button" class="btn btn-dark" style="float: left;" onclick="location.href='/admin/noticeList'">목록</button>
			
			<table style="float: right;">
				<tr>
					<td>
						<button type="button" class="btn btn-primary" onclick="location.href='/admin/modifyNotice?noticeId=${notice.noticeId}'">수정</button>
					</td>
					<td>&nbsp;</td>
					<td>
						<button type="button" class="btn btn-danger" onclick="location.href='/admin/removeNotice?noticeId=${notice.noticeId}'">삭제</button>
					</td>
				</tr>
			</table>
			<br><br>
		</div>
	</body>
</html>