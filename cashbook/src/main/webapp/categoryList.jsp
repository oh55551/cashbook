<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.*" %>
<%@ page import="model.*" %>
<a href="/cashbook/index.jsp" class="btn btn-sm btn-outline-secondary">홈화면으로</a>
<a href="/cashbook/logout.jsp" class="btn btn-sm btn-outline-secondary">로그아웃</a>
<%
	Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
	if (loginAdmin == null) {
	    response.sendRedirect("/cashbook/loginForm.jsp");
	    return;
	}
	
	int currentPage=1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	CategoryDao categoryDao = new CategoryDao();
	Paging p = new Paging();
	p.setCurrentPage(currentPage);
	p.setRowPerPage(10);
	ArrayList<Category> list = categoryDao.selectCategoryList(p);
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
<form action="insertCategoryForm.jsp" method="post">
<table class="table table-bordered table-hover">
        <tr>
            <th>No</th>
            <th>수입/지출</th>
            <th>내역</th>
            <th>작성시간</th>
            <th>내역명 수정</th>
            <th>삭제</th>
        </tr>
        <%
            for (Category c : list) {
        %>
        <tr>
            <td><%= c.getCategory_no() %></td>
            <td><%= c.getKind() %></td>
          	<td>
          		<%=c.getTitle()%>
           	</td>	
            <td><%= c.getCreatedate() %></td>
            <td> <a href="/cashbook/updateCategoryTitleForm.jsp?categoryNo=<%=c.getCategory_no()%>" class="btn btn-sm btn-outline-secondary">수정하기</td>
            <td> <a href="/cashbook/deleteCategory.jsp?categoryNo=<%=c.getCategory_no()%>" class="btn btn-sm btn-outline-secondary">삭제하기</td>
        </tr>
        <%
            }
        %>
</table>
<button type="submit" class="btn btn-sm btn-outline-secondary">카테고리 추가</button>
</form>
</body>
</html>