<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyNotice</title>
		
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
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>공지사항 수정</h1>
				<p>공지사항 글을 수정할 수 있는 페이지입니다</p>
			</div>
		</div>
		
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
			<br><br>
		</div>
	</body>
</html>