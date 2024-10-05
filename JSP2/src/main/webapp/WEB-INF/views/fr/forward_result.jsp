<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward Servlet 확인</title>
</head>
<body>
	<h3>request scope 객체를 이용하여 전달받은 값</h3>
	<ul>
		<li>forward 입력 1 : ${param.forwardInput1}</li>
		<li>forward 입력 2 : ${param.forwardInput2}</li>
		<li>str : ${str}</li> <%-- ${requestScope.str}로도 작성 가능! --%>
	</ul>
</body>
</html>