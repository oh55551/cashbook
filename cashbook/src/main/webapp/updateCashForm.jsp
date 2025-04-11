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
	int cashNo = Integer.parseInt(request.getParameter("cash_no"));
	CashDao cashDao = new CashDao();
	HashMap<String, Object> m = cashDao.cashOneByNo(cashNo);

	String kind = request.getParameter("kind");
	ArrayList<Category> list = null;
	if(kind!=null){ // insertCashForm.jsp 에서 kind가 선택 후 재요청
		// DB : 선택된 kind의 title 목록
		CategoryDao categoryDao = new CategoryDao();
		list = categoryDao.selectCategoryListByKind(kind);
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
</head>
<body>
<form method="post" action="/cashbook/updateCashAction.jsp?cashDate=<%=cashDate%>">
<table class="table table-bordered table-hover">
	<input type="hidden" name="cashDate" value="<%= cashDate %>">
		<tr>
			<th>kind</th>
			<td>
				<select name="kind" class="form-select" onchange="this.form.action='/cashbook/updateCashForm.jsp'; this.form.submit();">
					<option value="수입" <%= "수입".equals(kind) ? "selected" : "" %>>수입</option>
					<option value="지출" <%= "지출".equals(kind) ? "selected" : "" %>>지출</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>cashNo</th>
			<td>
				<input type="hidden" name="cash_no" value="<%= m.get("cash_no") %>">
				<%= m.get("cash_no") %>
			</td>
		</tr>
		<tr>
			<th>categoryNo</th>
			<td><input type="text" name="category_no" value="<%= m.get("category_no") %>" class="form-control" readonly></td>
		</tr>
		<tr>
			<th>title</th>
			<td>
				<select name="title" class="form-select">
				<%
					if (list != null) {
						for (Category c : list) {
							String selected = c.getTitle().equals(m.get("title")) ? "selected" : "";
				%>
							<option value="<%= c.getTitle() %>" <%= selected %>><%= c.getTitle() %></option>
				<%
						}
					}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<th>amount</th>
			<td><input type="number" name="amount" value="<%= m.get("amount") %>" class="form-control"></td>
		</tr>
		<tr>
			<th>memo</th>
			<td><input type="text" name="memo" value="<%= m.get("memo") %>" class="form-control"></td>
		</tr>
		<tr>
			<th>color</th>
			<td><input type="color" name="color" value="<%= m.get("color") %>" class="form-control form-control-color"></td>
		</tr>
		<tr>
			<th>createdate</th>
			<td><%= m.get("createdate") %></td>
		</tr>
		<tr>
			<th>updatedate</th>
			<td><%= m.get("updatedate") %></td>
		</tr>
		<tr>
			<td colspan="2" class="text-center">
			</td>
		</tr>
	</table>
	<button type="submit" class="btn btn-sm btn-outline-secondary">수정하기</button>
</form>
</body>
</html>