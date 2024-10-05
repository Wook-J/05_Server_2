<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	prefix : 접두사 (앞에 붙은 말/단어)
	만약 prefix="c" 로 작성하면 <c:if> 로 태그 작성!!
	만약 prefix="fn"로 작성하면 <fn:...>로 태그 작성!!
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL/ JSTL 사용법</title>
</head>
<body>
	<h1>a태그 Get 요청으로 응답받은 페이지</h1>
	
	<h1>EL (Expression Language) : 표현 언어</h1>
	<pre>
		<%--
			JSP에서 쓰는 표현식 : <%= %> (번거로움)
		 --%>
		- JSP 에서 표현식을 간단하고 효율적으로 작성할 수 
		  있도록 고안된 언어(JSP 내부에 기본 내장되어 있음!!)
		  
		- Java 값을 HTML 형태로 쉽게 출력할 수 있게 해줌!
		
		- 기본 작성법 : \${key} (실제로는 백슬레시는 제거하고 사용)
	</pre>
	
	<h3>전달 받은 파라미터를 출력하는 방법</h3>
	
	<p style="color: red;">
		주소 뒤에 쿼리스트링(?name=홍길동&age=20)
		직접 작성해보면서 테스트
	</p>
	
	<h4>1. JSP 표현식</h4>
	<div>
		name : <%= request.getParameter("name") %> <br>
		age : <%= request.getParameter("age") %>
	</div>
	
	<h4>2. EL</h4>
	<%-- EL 특징
		 1. null, NullPointerException을 빈칸으로 처리
		 2. get 이라는 단어를 사용하지 않음 
	--%>
	<div>
		<%-- EL에서 파라미터를 얻어오는 방법 : ${param.key값} --%>
		name : ${param.name} <br>
		age : ${param.age}
	</div>
	
	<hr><hr>
	
	<h1>JSTL (Jsp Standard Tag Library)</h1>
	<pre>
		JSP에서 자주 사용하는 Java 코드를
		(if, for, 변수선언, String 관련 메서드...) 
		스크립틀릿이 아닌 HTML 태그모양으로 작성할 수 있도록
		태그를 제공하는 라이브러리
		
		[라이브러리 추가 방법]
		1. 필요한 라이브러리(.jar) 파일을 다운받기
		2. 적용하고자 하는 프로젝트에 webapp/WEB-INF/lib 폴더에
		   다운받은 라이브러리 추가(복사 붙여넣기)
		3. JSTL 문법을 사용할 JSP 파일 제일 위에 taglib 구문을 추가로 작성
		   (현재 파일 : taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core")
	</pre>
	
	<h3>JSTL c:if 문 사용해보기</h3>
	<%-- 링크그대로 따라들어가면 에러발생 NumberFormatException 주소창에 "?age=~~~" 추가하기 --%>
	<%
		int age = Integer.parseInt(request.getParameter("age"));
		if(age>20) { %>
			<h3>성인입니다 (JSP 스크립틀릿으로 출력)</h3>
	<% } %>
	
	<c:if test="${param.age > 20}">
		<h3>성인입니다 (JSTL 사용)</h3>
	</c:if>
	
	<c:if test="${param.age <= 20}">
		<h3>성인이 아닙니다 (JSTL 사용)</h3>
	</c:if>
	
</body>
</html>