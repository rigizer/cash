<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//현재 페이지의 이름을 확인하는 함수
	function getPageName(){
	    let pageName = "";
	 
	    let tempPageName = window.location.href;
	    let strPageName = tempPageName.split("/");
	    pageName = strPageName[strPageName.length-1].split("?")[0];
	 
	    return pageName;
	}
	
	var thisPageName = getPageName();
	console.log(thisPageName);
</script>

<div class="container d-flex align-items-center">
		
	<h1 class="logo mr-auto">
		<a href="/admin/index">Cashbook</a>
	</h1>
	
	<nav class="main-nav d-none d-lg-block">
		<ul id="menuList">
			<li><a href="/admin/index">Home</a></li>
			<li><a href="/admin/cashbookByMonth/-1/-1">Cashbook</a></li>
			<li><a href="/admin/noticeList/1">Notice</a></li>
			<li><a href="/admin/logout"><font color="red">Logout</font></a></li>
		</ul>
	</nav>
</div>