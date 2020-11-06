<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
		
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
		</style>
	</head>
	<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="navbar-brand" href="#">Cashbook</a>
					</li>
				</ul>
			</div>
		</nav>
		
		<div class="jumbotron">
			<div class="container">
				<h1>Log-in</h1>
				<p>사용자 아이디와 비밀번호를 입력해주세요</p>
			</div>
		</div>
		
		<div class="container">
			<!-- 로그인 -->
			<h3>로그인</h3>
			<form action="/login" method="post">
				<table class="table loginTable">
					<tr>
						<td width="25%">ID</td>
						<td width="70%">
							<input type="text" class="form-control" name="id">
						</td>
					</tr>
					<tr>
						<td>PW</td>
						<td>
							<input type="password" class="form-control" name="pw">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</td>
					</tr>
				</table>
			</form>
			
			<br>
			
			<!-- 공지 -->
			<h3>공지사항</h3>
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
								<td>${n.noticeTitle}</td>
								<td>${n.noticeDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<br><br>
		</div>
	</body>
</html>