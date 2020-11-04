<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cashbookByMonth.jsp</title>
		
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
			
			th {
				width: ${100/7}%;
			}
			td {
				height: 80px;
				vertical-align: top;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>cashbookByMonth</h1>
		
		<!-- 이번 달 총 수입/지출 -->
		<div>
			${currentYear}년 ${currentMonth}월 수입 합계 : ${sumIn}
		</div>
		<div>
			${currentYear}년 ${currentMonth}월 지출 합계 : ${sumOut}
		</div>
		
		<!-- 다이어리 -->
		<h3>
			<a href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth - 1}">[이전달]</a>
			${currentYear}년 ${currentMonth}월
			<a href="/cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth + 1}">[다음달]</a>
		</h3>
		
		<table border="1" width="100%">
			<thead>
				<tr>
					<th><div class="sunday">일</div></th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th><div class="saturday">토</div></th>
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
										<a href="/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
								
								<!-- 토요일 -->
								<c:if test="${i % 7 == 0}">
									<div class="saturday">
										<a href="/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
								
								<!-- 평일 (월요일 ~ 금요일) -->
								<c:if test="${i % 7 != 1 && i % 7 != 0}">
									<div class="weekday">
										<a href="/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
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
	</body>
</html>