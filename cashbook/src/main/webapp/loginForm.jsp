<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>pollList</title>
	
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<title></title>
</head>
<body>
<form action="loginAction.jsp" method="post">
	<h1>loginForm</h1>
		<table class="table table-dark table-hover">
			<tr>
				<td>adminId</td>
				<td>
					<input type="text" name="adminId">
				</td>
			</tr>
			<tr>
				<td>adminPw</td>
				<td>
					<input type="text" name="adminPw">
				</td>
			</tr>
		</table>
	<button type="submit" class="btn btn-danger">로그인</button>
</form>
<a href="/cashbook/updateAdminPwForm.jsp">비밀번호 변경</a>
</body>
</html>