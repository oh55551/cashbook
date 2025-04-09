<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.*" %>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
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

</head>
<body>
	<h2>메뉴</h2>
	<ul>
		<li>
			<a href="/cashbook/updateAdminPwForm.jsp" class="btn btn-sm btn-outline-secondary">비밀번호 수정</a>
		</li>
		<li>
			<a href="/cashbook/cashList.jsp" class="btn btn-sm btn-outline-secondary">cashList</a>
		</li>
		<li>
			<a href="/cashbook/categoryList.jsp" class="btn btn-sm btn-outline-secondary">categoryList</a>
		</li>
	</ul>
</body>
</html>