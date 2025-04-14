<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>

<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<html>
    <head>
        <meta charset="UTF-8">
        <title>영수증 등록</title>
    </head>
    <body>
    <%
   	 int cashNo = Integer.parseInt(request.getParameter("cash_no"));
    	if(request.getParameter("msg") != null) { // insertReceitAction png파일 아니라서 redirect
    %>
    		<div><%=request.getParameter("msg")%></div>
    <%		
    	}
    %>
    <form action="/cashbook/insertReceitAction.jsp" method="post" enctype="multipart/form-data">
    	<input type="hidden" name="cash_no" value="<%= cashNo %>">
		<div>이미지 : <input type="file" name="imageFile"></div>
		 <input type="hidden" name="createdate">
		<button type="submit" class="btn btn-sm btn-outline-secondary">영수증 등록</button>
    </form>
    </body>
</html>
