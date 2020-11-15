<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="container d-flex align-items-center">
		
	<h1 class="logo mr-auto">
		<a href="${pageContext.request.contextPath}/admin/index">Cashbook</a>
	</h1>
	
	<nav class="main-nav d-none d-lg-block">
		<ul id="menuList">
			<li><a href="${pageContext.request.contextPath}/admin/index">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1">Cashbook</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/cashbookList/1">Cashbook List</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/noticeList/1">Notice</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/addMember">Member</a></li>
			<li class="drop-down"><a href="#">Statistics</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart1.jsp">월별 수입 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart2.jsp">월별 지출 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart3.jsp">월간 카테고리별 수입 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart4.jsp">월간 카테고리별 지출 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart5.jsp">연도별 수입/지출 내역</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart6.jsp">Chart6</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart7.jsp">Chart7</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart8.jsp">Chart8</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart9.jsp">Chart9</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/chart/chart9.jsp">Chart10</a></li>
				</ul>
			</li>
			<li><a href="${pageContext.request.contextPath}/admin/logout"><font color="red">Logout</font></a></li>
		</ul>
	</nav>
</div>