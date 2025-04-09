<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/categoryList.jsp" class="btn btn-sm btn-outline-secondary">카테고리리스트</a>
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
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<body>

</body>
</html>