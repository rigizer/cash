<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noticeOne</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>noticeOne</h1>
		
		<!-- 공지사항 내용 -->
		<h3>공지사항 내용</h3>
		<div>
			<table border="1" width="100%">
				<tr>
					<td width="20%">notice_id</td>
					<td width="80%">${notice.noticeId}</td>
				</tr>
				<tr>
					<td>notice_title</td>
					<td>${notice.noticeTitle}</td>
				</tr>
				<tr>
					<td>notice_date</td>
					<td>${notice.noticeDate}</td>
				</tr>
				<tr>
					<td>notice_content</td>
					<td>${notice.noticeContent}</td>
				</tr>
			</table>
		</div>
		<div>
			<a href="/admin/noticeList">[목록]</a>
			<a href="/admin/modifyNotice?noticeId=${notice.noticeId}">[수정]</a>
			<a href="/admin/removeNotice?noticeId=${notice.noticeId}">[삭제]</a>
		</div>
	</body>
</html>