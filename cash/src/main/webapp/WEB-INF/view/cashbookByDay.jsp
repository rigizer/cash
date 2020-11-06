<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cashbookByDay</title>
		
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
			table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			.cashbookTableMenu {
				width: 100%;
				text-align: center;
			}
			
			.cashbookTableMenu td {
				vertical-align: middle;
				height: 120px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>일일 가계부</h1>
				<p>사용자의 일일 가계부 내역을 확인할 수 있는 페이지입니다</p>
			</div>
		</div>
		
		<div class="container">
			<table class="cashbookTableMenu">
				<tr>
					<td width="20%">&nbsp;</td>
					<td width="10%">
						<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByDay?target=pre&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}'">이전</button>
					</td>
					<td width="40%">
						<h3>${currentYear}년 ${currentMonth}월 ${currentDay}일</h3>
					</td>
					<td width="10%">
						<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByDay?target=next&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}'">다음</button>
					</td>
					<td width="20%">&nbsp;</td>
				</tr>
			</table>
			
			<br>
			
			<h3>&nbsp;
				<button type="button" class="btn btn-sm btn-success" style="float: right;" onclick="location.href='/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}'">수입/지출 입력</button>	
			</h3>
			
			<table class="table">
				<thead>
					<th width="10%">번호</th>
					<th width="10%">수입/지출</th>
					<th width="15%">카테고리</th>
					<th width="20%">금액</th>
					<th width="25%">내용</th>
					<th width="10%">수정</th>
					<th width="10%">삭제</th>
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
									<button class="btn btn-sm btn-primary" onclick="location.href='/admin/modifyCashbookByDay?cashbookId=${c.cashbookId}'">수정</button>
								</td>
								<td>
									<button class="btn btn-sm btn-danger" onclick="location.href='/admin/removeCashbookByDay?cashbookId=${c.cashbookId}'">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty cashbookList}">
						<tr>
							<td colspan="7"><br>조회된 데이터가 없습니다<br></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
			<br><br>
		</div>
	</body>
</html>