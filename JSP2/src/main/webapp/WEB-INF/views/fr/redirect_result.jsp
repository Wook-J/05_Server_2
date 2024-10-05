<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> /fr/redirect 요청 시 재요청 되어 보여지는 페이지</h3>
	
	<h3>request scope로 전달된 값이 존재하는지 확인</h3>
	<ul>
		<li>redirectInput1 : ${param.redirectInput1}</li>
		<li>redirectInput2 : ${param.redirectInput2}</li>
		<li>str2 : ${str2}</li> <%-- ${requestScope.str2} 로 작성해도 됨!--%>
	</ul>
	
	<h3>session scope로 전달된 값 : ${sessionNum }</h3>
	<%-- ${sessionScope.sessionNum} 로 작성해도 됨!--%>
	<h3>index.jsp에서 온 값 보내기 : ${redirectInput1}</h3>
	
	<h3 id="print"></h3>
	
	<script>
		document.querySelector("#print").innerText = location.pathname;
	</script>
</body>
</html>