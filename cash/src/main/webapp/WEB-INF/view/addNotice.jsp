<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addNotice</title>
		
		<!-- jQuery Google CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
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
		
		<style>
			table {
				text-align: center;
			}
		</style>
		
		<style>
			.msgDiv {
				color: #FF0000;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>addNotice</h1>
		
		<!-- 공지사항 작성 -->
		<h3>공지사항 작성</h3>
		<div>
			<form method="post" action="/admin/addNotice" id="noticeForm">
				<table border="1" width="100%">
					<tr>
						<td>notice_title</td>
						<td>
							<input type="text" name="noticeTitle" id="noticeTitle">
							<div class="msgDiv" id="noticeTitleMsg"></div>
						</td>
					</tr>
					<tr>
						<td>notice_content</td>
						<td>
							<textarea name="noticeContent" id="noticeContent"></textarea>
							<div class="msgDiv" id="noticeContentMsg"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" id="btn">입력</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>