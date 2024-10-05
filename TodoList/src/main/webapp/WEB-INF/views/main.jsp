<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Todo List</title>
	
	<%-- css 파일 연결(webapp 폴더 기준) --%>
	<link rel="stylesheet" href="/resources/css/main.css"> 
</head>

<body>
	<h1>Todo List</h1>
	<h3>전체 Todo 개수 : ${fn:length(todoList)}</h3>
					<%-- MainServlet의 requestScope --%>
	<hr>
	<h4>할 일 추가</h4> <%-- TodoAddServlet의 @WebServlet과 연결 --%>
	<form action="/todo/add" method="post" id="addForm">
		<div>
			제목 : <input type="text" name="title">
		</div>
		<div>
			<textarea name="detail" rows="3" cols="50" placeholder="상세 내용"></textarea>
		</div>
		<button>추가</button>
	</form>

	<%-- 할 일 목록 출력 --%>
	<table id="todoList" border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>할 일 제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${todoList}" varStatus="vs" var="todo">
				<tr>
					<th>${vs.count}</th>
					<td><a href="/todo/detail?index=${vs.index}" >${todo.title}</a></td>
							<%-- ${vs.current.title} 도 가능!--%>
							<%-- /todo/detail?index=n 을 가져와서 프린트하기 --%>
							<%-- 시간되면 이부분 고민해보기 --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<%-- session 범위에 message 가 있을 경우 --%>
	<c:if test="${not empty sessionScope.message}">
		<script>
			alert("${message}");
			// JSP 해석순서
			// 1순위 : Java 코드(EL/JSTL)
			// 2순위 : Front 코드(HTML, CSS, JS)
		</script>
		
		<%-- message 를 한 번만 출력하고 제거하기 --%>
		<c:remove var="message" scope="session" />
	</c:if>
	
	<%-- JS 연결 --%>
	<script src="/resources/js/main.js"></script>
</body>
</html>