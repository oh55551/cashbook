<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
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
	<title>pollList</title>
	
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<form action="updateAdminPwAction.jsp" method="post">
	<h1>updatePw</h1>
		<table class="table table-dark table-hover">
			<tr>
				<td>adminId</td>
				<td>
					<input type="text" name="adminId">
				</td>
			</tr>
			<tr>
				<td>현재 비밀번호</td>
				<td>
					<input type="text" name="currentPw">
				</td>
			</tr>
			<tr>
				<td>변경할 비밀번호</td>
				<td>
					<input type="text" name="newPw">
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-danger">변경</button>
</form>
</body>
</html>