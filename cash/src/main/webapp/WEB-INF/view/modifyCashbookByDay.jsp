<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyCashbookByDay</title>
		
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
			td {
				width: 50%;
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<div class="jumbotron">
			<div class="container">
				<h1>가계부 수정</h1>
				<p>가계부 내역을 수정할 수 있는 페이지입니다</p>
			</div>
		</div>
		
		<div class="container">
			<form method="post" action="/admin/modifyCashbookByDay">
				<table class="table">
					<tr>
						<td>번호</td>
						<td>
							<input type="text" class="form-control" name="cashbookId" value="${cashbook.cashbookId}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>날짜</td>
						<td>
							<input type="text" class="form-control" name="cashbookDate" value="${cashbook.cashbookDate}" readonly="readonly">
						</td>
					</tr>			
					<tr>
						<td>수입/지출</td>
						<td>
							<c:if test="${cashbook.cashbookKind == '수입'}">
								<input type="radio" name="cashbookKind" value="수입" checked="checked">&nbsp;수입
								&nbsp;&nbsp;&nbsp;
								<input type="radio" name="cashbookKind" value="지출">&nbsp;지출
							</c:if>
							<c:if test="${cashbook.cashbookKind == '지출'}">
								<input type="radio" name="cashbookKind" value="수입">&nbsp;수입
								&nbsp;&nbsp;&nbsp;
								<input type="radio" name="cashbookKind" value="지출" checked="checked">&nbsp;지출
							</c:if>
						</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select class="form-control" name="categoryName">
								<c:forEach var="c" items="${categoryList}">
									<c:if test="${c.categoryName == cashbook.categoryName}">
										<option value="${c.categoryName}" selected="selected">${c.categoryName}</option>
									</c:if>
									<c:if test="${c.categoryName != cashbook.categoryName}">
										<option value="${c.categoryName}">${c.categoryName}</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>금액</td>
						<td>
							<input type="text" class="form-control" name="cashbookPrice" value="${cashbook.cashbookPrice}">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<input type="text" class="form-control" name="cashbookContent" value="${cashbook.cashbookContent}">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary btn-block">수정</button>
						</td>
					</tr>
				</table>
			</form>
			
			<br><br>
		</div>
	</body>
</html>