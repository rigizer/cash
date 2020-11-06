<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cashbookByMonth</title>
		
		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<style type="text/css">
			.sunday a {
				color: #FF0000;
			}
			.saturday a {
				color: #0000FF;
			}
			.weekday a {
				color: #000000;
			}
			
			.sunday {
				color: #FF0000;
			}
			.saturday {
				color: #0000FF;
			}
			.weekday {
				color: #000000;
			}
			
			.cashbookTableMenu {
				width: 100%;
				text-align: center;
			}
			
			.cashbookTableMenu td {
				vertical-align: middle;
			}
			
			th {
				width: ${100/7}%;
				text-align: center;
			}
			td {
				height: 60px;
				vertical-align: top;
			}
			.diaryTable td {
				height: 130px;
				vertical-align: top;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>월별 가계부</h1>
				<p>사용자의 월별 가계부 내역을 확인할 수 있는 페이지입니다</p>
			</div>
		</div>
		
		<div class="container">
			<!-- 이번 달 총 수입/지출 -->
			<table class="cashbookTableMenu">
				<tr>
					<td width="20%">수입 합계</td>
					<td rowspan="2" width="10%">
						<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth - 1}'">이전</button>

					</td>
					<td rowspan="2" width="40%">
						<h3>${currentYear}년 ${currentMonth}월</h3>
					</td>
					<td rowspan="2" width="10%">
						<button type="button" class="btn btn-secondary" onclick="location.href='/admin/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth + 1}'">다음</button>
					</td>
					<td width="20%">지출 합계</td>
				</tr>
				<tr>
					<td>${sumIn}</td>
					<td>${sumOut}</td>
				</tr>
			</table>
			
			<br>
			
			<!-- 다이어리 -->
			<table class="table table-bordered diaryTable">
				<thead>
					<tr>
						<th class="sunday">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="saturday">토</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="i" begin="1" end="${lastDay + (firstDayOfWeek - 1)}" step="1">
							<c:if test="${i - (firstDayOfWeek - 1) < 1}">
								<td>&nbsp;</td>
							</c:if>
							
							<c:if test="${i - (firstDayOfWeek - 1) > 0}">
								<td>
									<!-- 일요일 -->
									<c:if test="${i % 7 == 1}">
										<div class="sunday">
											<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
									
									<!-- 토요일 -->
									<c:if test="${i % 7 == 0}">
										<div class="saturday">
											<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
									
									<!-- 평일 (월요일 ~ 금요일) -->
									<c:if test="${i % 7 != 1 && i % 7 != 0}">
										<div class="weekday">
											<a href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
										</div>
									</c:if>
									
									<!-- 수입/지출 목록이 있는 날짜를 cashList에서 검색 -->
									<c:forEach var="c" items="${cashList}">
										<c:if test="${i - (firstDayOfWeek - 1) == c.dDay}">
											<c:if test="${c.cashbookKind == '수입'}">
												<div>수입 : ${c.cashbookPrice}</div>
											</c:if>
											<c:if test="${c.cashbookKind == '지출'}">
												<div>지출 : ${c.cashbookPrice}</div>
											</c:if>
										</c:if>
									</c:forEach>
								</td>
							</c:if>
							
							<c:if test="${i != (lastDay + (firstDayOfWeek - 1))}">
								<c:if test="${i % 7 == 0}">
									</tr><tr>
								</c:if>
							</c:if>
						</c:forEach>
						
						<c:if test="${(lastDay + (firstDayOfWeek - 1)) % 7 != 0}">	
							<c:forEach begin="1" end="${7 - ((lastDay + (firstDayOfWeek - 1)) % 7)}" step="1">	
								<td>&nbsp;</td>	
							</c:forEach>	
						</c:if>
					</tr>
				</tbody>
			</table>
			
			<br><br>
		</div>
	</body>
</html>