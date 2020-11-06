<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="navbar-brand" href="/admin/index">Cashbook</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/index">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/cashbookByMonth">가계부</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/noticeList">공지사항</a>
			</li>
		</ul>
		
		<ul class="navbar-nav mr-right">
			<li class="nav-item">
				<button type="button" class="btn btn-danger btn-sm" onclick="location.href='/admin/logout'">로그아웃</button>
			</li>
		</ul>
	</div>
</nav>