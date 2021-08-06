<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>MY TO DO LIST</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<header>
		<h1 id="title">TO DO LIST</h1>
	</header>
	<div id="register" onclick="location.href='./TodoFormServlet'">새로운 TODO 등록</div>
	<section id="outline">
		<c:forEach var="type" items="${types}">
			<div id="${type}">
				<div class="status-list">${type}</div>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.type eq type}"> 
						<div class="content">
							<h1 class="content-title">${list.title}</h1>
							<div class="content-detail">등록날짜: ${list.regdate},
							${list.name}, 우선순위 ${list.sequence }</div>
							<c:if test="${list.type ne 'done'}">
								<button class="move" onclick="moveButtonClick(${list.id}, this)">▶</button>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</section>
	<script src="./todo.js" type="text/javascript"></script>
</body>
</html>