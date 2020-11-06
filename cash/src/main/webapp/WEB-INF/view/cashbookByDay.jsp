<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cashbookByDay</title>
		
		<style>
			table {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>cashbookByDay</h1>
		
		<div>
			<h3>
				<a href="/admin/cashbookByDay?target=pre&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">◀◀</a>
				${currentYear}.${currentMonth}.${currentDay}
				<a href="/admin/cashbookByDay?target=next&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">▶▶</a>
			</h3>
		</div>
		
		<a href="/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">수입/지출 입력</a>
		
		<table border="1">
			<thead>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>수정</th>
				<th>삭제</th>
			</thead>
			<tbody>
				<c:if test="${!empty cashbookList}">
					<c:forEach var="c" items="${cashbookList}">
						<tr>
							<td>${c.cashbookId}</td>
							<td>${c.cashbookKind}</td>
							<td>${c.categoryName}</td>
							<td>${c.cashbookPrice}</td>
							<td>${c.cashbookContent}</td>
							<td>
								<button onclick="location.href='/admin/modifyCashbookByDay?cashbookId=${c.cashbookId}'">수정</button>
							</td>
							<td>
								<button onclick="location.href='/admin/removeCashbookByDay?cashbookId=${c.cashbookId}'">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty cashbookList}">
					<tr>
						<td colspan="7">데이터가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</body>
</html>