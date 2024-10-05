<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= request.getParameter("orderer") %>님의 주문 결과</title>
</head>
<body>
	<h1>주문자명 : <%= request.getParameter("orderer") %></h1>
	
	<h3>주문한 커피 : 
		<% if(request.getParameter("type").equals("ice")) { %>
			차가운
		<% } else {%>
			따뜻한
		<% } %>
		
		<%= request.getParameter("coffee") %>
	</h3>
	
	<%-- 옵션이 하나도 선택안되있으면 null (스크립틀릿으로 사용한 경우)로 들어옴 --%>
	<% if(request.getParameterValues("opt") != null){%>
		<ul>
			<% for(String opt : request.getParameterValues("opt")) {%>
				<li><%= opt %></li>
			<% } %>
		</ul>
	<% } %>
</body>
</html>