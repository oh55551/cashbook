<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.*" %>
<%@ page import="model.*" %>
<hr>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
<a href="/cashbook/categoryList.jsp" class="btn btn-sm btn-outline-secondary">카테고리</a>
<a href="/cashbook/monthList.jsp" class="btn btn-sm btn-outline-secondary">달력</a>
<hr>
<%
	Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
	if (loginAdmin == null) {
		  response.sendRedirect("/cashbook/loginForm.jsp");
		  return;
	}
	
	String cashDate = request.getParameter("cashDate");
	CashDao cashDao = new CashDao();
	HashMap<String, Object> m = cashDao.cashOne(cashDate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<table class="table table-bordered table-hover">
		<tr>
			<th>kind</th>
			<td><%= m.get("kind") %></td>
		</tr>
		<tr>
			<th>cashNo</th>
			<td><%= m.get("cash_no") %></td>
		</tr>
		<tr>
			<th>categoryNo</th>
			<td><%= m.get("category_no") %></td>
		</tr>
		<tr>
			<th>title</th>
			<td><%= m.get("title") %></td>
		</tr>
		<tr>
			<th>amount</th>
			<td><%= m.get("amount") %></td>
		</tr>
		<tr>
			<th>memo</th>
			<td><%= m.get("memo") %></td>
		</tr>
		<tr>
			<th>color</th>
			<td><%= m.get("color") %></td>
		</tr>
		<tr>
			<th>createdate</th>
			<td><%= m.get("createdate") %></td>
		</tr>
		<tr>
			<th>updatedate</th>
			<td><%= m.get("updatedate") %></td>
		</tr>
	</table>
	
</body>
</html>