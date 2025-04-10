<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dto.*" %>
<%@ page import = "model.*" %>
<%@ page import = "java.util.*" %>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
<a href="/cashbook/categoryList.jsp" class="btn btn-sm btn-outline-secondary">카테고리리스트</a>
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
	<h1>카테고리 추가</h1>
	<form action="insertCategoryAction.jsp">
	<table class="table table-bordered table-hover">
		<tr>
			<th>Kind</th>
			<td>
			 <select name="kind" class="form-select">
				<option value="수입">수입</option>
                <option value="지출">지출</option>
            </td>
		</tr>
		<tr>
			<th>Title</th>
			<td>
				<input type="text" name="title" class="form-control">
            </td>
		</tr>
	</table>
	<button type="submit" class="btn btn-sm btn-outline-secondary">추가하기</button>
	</form>
</body>
</html>