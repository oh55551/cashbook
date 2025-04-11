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
	
	//날짜받아오기
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("day");
	
	//한자리수 월,일을 두자리수로만들어주기
	if (month.length() == 1){
		month = "0" + month;
	}
	if (date.length() == 1){
		date = "0" + date;
	}
	String cashDate = year + "-" + month + "-" + date;
	
	//DB불러오기
	CashDao cashDao = new CashDao();
	ArrayList<HashMap<String, Object>> list = cashDao.selectCashListByDate(cashDate);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<table class="table table-bordered table-hover">
		<tr>
			<th>구분</th>
			<th>분류</th>
			<th>금액</th>
			<th>작성일시</th>
			<th>상세보기</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	<%
		for (HashMap<String, Object> c : list) {
	%>
		<tr>
			<td><%=c.get("kind") %></td>
			<td><%=c.get("title") %></td>
			<td><%=c.get("amount") %> 원</td>
			<td><%=c.get("createdate") %></td>
			<td><a href="/cashbook/cashOne.jsp?cashDate=<%=cashDate%>">상세보기</a></td>
			<td><a href="/cashbook/updateCashForm.jsp?cash_no=<%=c.get("cash_no")%>&cashDate=<%=cashDate%>">수정</td>
			<td><a href="/cashbook/deleteCash.jsp?cashDate=<%=cashDate%>&cash_no=<%=c.get("cash_no")%>">삭제</a></td>
		</tr>
	<%
		}
	%>
	</table>
	<a href="/cashbook/insertCashForm.jsp?cashDate=<%=cashDate %>" class="btn btn-sm btn-outline-secondary">내역 추가</a>
</body>
</html>