<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addNotice</title>
		
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
		
		<!-- jQuery를 이용하여 제목, 내용 검사 -->
		<script>
			$(document).ready(function() {	// 문서가 로드되면 이 스크립트를 제일 마지막에 실행해주세요
				$('#noticeTitle').focus();	// 시작 시 폼 커서를 noticeTitle쪽으로 이동
				
				$("#btn").click(function() {	// 버튼 클릭시 폼 내용의 유효성 검사를 수행
					if ($("#noticeTitle").val() == "") {	// noticeTitle이 공백인 경우 수행
						$("#noticeTitleMsg").text('');	// 메시지 초기화
						$('#noticeTitleMsg').text('제목을 입력하세요');
						$('#noticeTitle').focus();
					
						return;
					} else {
						$("#noticeTitleMsg").text('');	// 메시지 초기화
					}
					
					if ($("#noticeContent").val() == "") { // noticeContent가 공백인 경우 수행
						$("#noticeContentMsg").text('');	// 메시지 초기화
						$('#noticeContentMsg').text('내용을 입력하세요');
						$('#noticeContent').focus();
					
						return;
					} else {
						$("#noticeContentMsg").text('');	// 메시지 초기화
					}
					$("#noticeForm").submit();
				});
			});
		</script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>공지사항 작성</h1>
				<p>공지사항 게시판에 글을 작성할 수 있는 페이지입니다</p>
			</div>
		</div>
		
		<div class="container">
			<!-- 공지사항 작성 -->
			<div>
				<form method="post" action="/admin/addNotice" id="noticeForm">
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
							<td colspan="2">
								<button type="button" class="btn btn-success btn-block" id="btn">글쓰기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<br><br>
		</div>
	</body>
</html>