<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.connect.todo.dao.TodoDao"%>
<%@ page import="kr.or.connect.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	TodoDao dao = (TodoDao)request.getAttribute("dao");
	List<TodoDto> list = dao.getToDos();
	%>
<div id="state">
	<ul>
		<li>TO DO</li>
		<li>DOING</li>
		<li>DONE</li>
	</ul>
</div>

</body>
</html>