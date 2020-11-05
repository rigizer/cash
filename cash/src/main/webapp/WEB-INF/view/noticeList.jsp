<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>noticeList</title>
		
		<style>
			ul {
			    list-style:none;
			    margin:0;
			    padding:0;
			}
			
			li {
			    margin: 0 0 0 0;
			    padding: 0 0 0 0;
			    border : 0;
			    float: left;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp" />
		
		<h1>noticeList</h1>
		
		<!-- 공지 -->
		<h3>공지사항</h3>
		
		<a href="/admin/addNotice">[글쓰기]</a>
		
		<div>
			<table border="1" width="100%">
				<thead>
					<tr>
						<th>notice_id</th>
						<th>notice_title</th>
						<th>notice_date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList}">
						<tr>
							<td>${n.noticeId}</td>
							<td><a href="/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeTitle}</a></td>
							<td>${n.noticeDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<br>
		
		<div>
			<!-- 페이지 네비게이션 -->
			<ul class="pagination justify-content-center">
				<!-- 처음으로 버튼 -->
				<c:choose>
					<c:when test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList?currentPage=1">[처음]</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">[처음]</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage > 1}">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList?currentPage=${currentPage - 1}">[이전]</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">[이전]</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 현재 페이지 표시 -->
				<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
					<c:if test="${i <= lastPage}">
						<c:choose>
							<%-- 현재 페이지 --%>
							<c:when test="${i == currentPage}">
								<li class="page-item disabled">
									<a class="page-link" href="#">[${i}]</a>
								</li>
							</c:when>
							<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/admin/noticeList?currentPage=${i}">[${i}]</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage < lastPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList?currentPage=${currentPage + 1}">[다음]</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">[다음]</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<!-- 마지막으로 버튼 -->
				<c:choose>
					<c:when test="${currentPage < lastPage}">
						<li class="page-item">
							<a class="page-link" href="/admin/noticeList?currentPage=${lastPage}">[마지막]</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="#">[마지막]</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
		<br>
		
		<div>
			<!-- 총 페이지 수 출력 -->
			<table style="margin: auto;">
				<tr>
					<td>
						<button type="button" class="btn btn-outline-dark btn-sm">
							${currentPage} / ${lastPage} 페이지
						</button>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>