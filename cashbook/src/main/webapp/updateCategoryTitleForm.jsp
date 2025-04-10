<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="dto.*" %>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
<a href="/cashbook/categoryList.jsp" class="btn btn-sm btn-outline-secondary">카테고리리스트</a>
<%
	Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
	if (loginAdmin == null) {
	    response.sendRedirect("/cashbook/loginForm.jsp");
	    return;
	}
    int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
    CategoryDao categoryDao = new CategoryDao();
   
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
	<form action="updateCategoryTitleAction.jsp?categoryNo=<%=categoryNo %>" method="post">
	<table class="table table-bordered table-hover">
		<tr>
			<td>categoryNo</td>
			<td><%=categoryNo %></td>
		</tr>
		<tr>
			<td>새로운 제목</td>
			<td><input type="text" name="newTitle" class="form-control"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-sm btn-outline-secondary">수정하기</button>
	</form>
</body>
</html>