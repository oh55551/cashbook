<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.*" %>
<hr>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
<a href="/cashbook/categoryList.jsp" class="btn btn-sm btn-outline-secondary">카테고리</a>
<a href="/cashbook/monthList.jsp" class="btn btn-sm btn-outline-secondary">달력</a>
<hr>
<%
	//로그인 되었는지 아닌지
	Admin loginAdmin = (Admin)(session.getAttribute("loginAdmin"));

	if(loginAdmin == null){ //로그아웃 상태라면
	//로그인 페이지로 리다이렉트
		response.sendRedirect("/cashbook/loginForm.jsp");	
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Google Font: Poppins -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
<style>
    body, html {
        height: 100%;
    }

    .menu-title {
        font-family: 'Poppins', sans-serif;
        font-size: 24px;
        font-weight: 500;
    }
</style>
</head>
<body>

	<h4 class="text-center mb-4 menu-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MENU</h4>
	<ul>
		<div class="text-center mb-4 menu-title">
			<a href="/cashbook/categoryList.jsp" class="btn btn btn-outline-secondary">수입/지출 리스트</a>
		</div>
		<div class="text-center mb-4 menu-title">
			<a href="/cashbook/monthList.jsp" class="btn btn btn-outline-secondary">가계부</a>
		</div>
	</ul>
</body>
</html>