<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.*" %>
<%@ page import="model.*" %>
<%
	int currentPage=1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	CategoryDao categoryDao = new CategoryDao();
	Paging p = new Paging();
	p.setCurrentPage(currentPage);
	p.setRowPerPage(10);
	ArrayList<Category> list = categoryDao.(p);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>