<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
		
		<style>
			.table {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<h1>login</h1>
		
		<!-- 공지 -->
		<h3>공지사항</h3>
		<div>
			<table border="1" width="100%">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
						<th>notice_date</th>
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
		
		<!-- 로그인 -->
		<h3>로그인</h3>
		<form action="/login" method="post">
			<table border="1" class="table">
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="id">
					</td>
				</tr>
				<tr>
					<td>PW</td>
					<td>
						<input type="password" name="pw">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>