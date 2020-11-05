<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyNotice</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>modifyNotice</h1>
		
		<!-- 공지사항 수정 -->
		<h3>공지사항 수정</h3>
		<div>
			<form method="post" action="/admin/modifyNotice" id="noticeForm">
				<table border="1" width="100%">
					<tr>
						<td width="20%">notice_id</td>
						<td width="80%"><input type="text" name="noticeId" id="noticeId" value="${notice.noticeId}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>notice_title</td>
						<td><input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}"></td>
					</tr>
					<tr>
						<td>notice_date</td>
						<td><input type="text" name="noticeDate" id="noticeDate" value="${notice.noticeDate}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>notice_content</td>
						<td><textarea name="noticeContent" id="noticeContent">${notice.noticeContent}</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>