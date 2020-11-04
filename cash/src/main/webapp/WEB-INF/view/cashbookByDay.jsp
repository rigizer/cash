<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cashbookByDay</title>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>cashbookByDay</h1>
		
		<div>
			<a href="#">◀◀</a>
			<h3>${param.currentYear}.${param.currentMonth}.${param.currentDay}</h3>
			<a href="#">▶▶</a>
		</div>
		
		<a href="/addCashbook?currentYear=${param.currentYear}&currentMonth=${param.currentMonth}&currentDay=${param.currentDay}">수입/지출 입력</a>
		
		<table border="1">
			<thead>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
			</thead>
			<body>
				<c:if test="${!empty cashbookList}">
					<c:forEach var="c" items="${cashbookList}">
						<tr>
							<td>${c.cashbookId}</td>
							<td>${c.cashbookKind}</td>
							<td>${c.categoryName}</td>
							<td>${c.cashbookPrice}</td>
							<td>${c.cashbookContent}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty cashbookList}">
					<tr>
						<td colspan="5">데이터가 없습니다</td>
					</tr>
				</c:if>
			</body>
		</table>
	</body>
</html>