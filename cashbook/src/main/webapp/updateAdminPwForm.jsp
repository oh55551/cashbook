<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
<%
	Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
	if (loginAdmin == null) {
	    response.sendRedirect("/cashbook/loginForm.jsp");
	    return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<title>pollList</title>
	
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<form action="updateAdminPwAction.jsp" method="post">
	<h1>updatePw</h1>
		<table class="table table-bordered table-hover">
			<tr>
				<td>adminId</td>
				<td>
					<input type="text" name="adminId">
				</td>
			</tr>
			<tr>
				<td>현재 비밀번호</td>
				<td>
					<input type="password" name="currentPw">
				</td>
			</tr>
			<tr>
				<td>변경할 비밀번호</td>
				<td>
					<input type="password" name="newPw">
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-sm btn-outline-secondary">변경</button>
</form>
</body>
</html>