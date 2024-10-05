<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 강비 결과 페이지 입니다</h1>
	<h3>입력되어 전달된 값들</h3>
	<ul>
		<li>ID : ${param.inputId}</li>
		<li>PW : ${param.inputPw}</li>
		<li>확인 : ${param.inputPwCheck}</li>
		<li>이름 : ${param.inputName}</li>
		<li>나이 : ${param.inputAge}</li>
	</ul>
	
	<%-- JSTL 을 사용한 경우 --%>
	<c:if test="${param.inputPw == param.inputPwCheck}">
		<h3 style="color:green;">회원가입 성공(JSTL 사용)</h3>
	</c:if>
	<c:if test="${param.inputPw != param.inputPwCheck}">
		<h3 style="color:red"> 비밀번호 불일치(JSTL 사용)</h3>
	</c:if>
	
	
	<%-- JSP 스크립틀릿 을 사용한 경우 --%>
	<%	String inputPw = request.getParameter("inputPw");
		String inputPwCheck = request.getParameter("inputPwCheck");
		if(inputPw.equals(inputPwCheck)){ %>
			<h3 style="color:green;">회원가입 성공(JSP 스크립틀릿 사용)</h3>
	<% } else{ %>
			<h3 style="color:red;">비밀번호 불일치(JSP 스크립틀릿 사용)</h3>
	<% } %>
</body>
</html>