<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 확인 1</title>
</head>
<body>
	<h2>EL의 특징</h2>
	<pre>
		1. null 을 빈칸("")으로 처리 + NullPointerException을 발생시키지 않음!
		
		2. get 이라는 단어를 거의 사용하지 않음!
		  - EL 은 표현(출력) 언어여서, 값을 대입하거나 조건/반복하는 구문 작성X
		  - 오로지 출력을 목적으로 함!
	</pre> <hr>
	
	<h3>전달 받은 파라미터 출력하기</h3>
	<pre>
		- \${param.key} : key 가 일치하는 파라미터 얻어오기
		- \${paramValues.key} : key 가 일치하는 모든 파라미터 얻어오기
	</pre>
	
	<h4>존재하는 파라미터 얻어오기</h4>
	<ul>
		<li>
			JSP 표현식으로 str 파라미터 얻어오기 : 
			<%= request.getParameter("str") %>
		</li>
		<li>
			EL 구문으로 str 파라미터 얻어오기 :
			${param.str}
		</li>
	</ul>
	
	<h4>존재하지 않는 파라미터 얻어오기</h4>
		<ul>
		<li>
			JSP 표현식으로 temp 파라미터 얻어오기 : 
			<%= request.getParameter("temp") %>
		</li>
		<li>
			EL 구문으로 temp 파라미터 얻어오기 :
			${param.temp}
		</li>
	</ul>
	
	<h3>EL 은 자료형 변환(parsing)을 자동 수행해준다!</h3>
	<ul>
		<%-- EL에서는 문자열 비교시 "==(비교연산자)" 사용 가능! --%>
		<li>${param.str == "abc"}</li>
		<li>${param.intNum == 100}</li>
		<li>${param.doubleNum == 3.14}</li>
		<%-- HTML 에서 얻어온 데이터는 모두 String 형,
			하지만 EL 에서 연산되는 자료형이 다를 경우
			자동으로 자료형 변환(parsing)을 진행해준다!
		 --%>
	</ul>
	 
	<hr>
	
	<h3>같은 key 값을 지닌 파라미터 얻어오기</h3>
	<ul>
		<li>
			<%-- check 가 여러개 전달된 경우 : 첫 번째 값만 출력 --%>
			param.check : ${param.check}
		</li>
		
		<li>
			<%-- check 라는 key 를 가진 모든 값을 모아 String[]로 반환 --%>
			paramValues.check : ${paramValues.check} <%-- 배열의 주소 --%>
		</li>
		
		<li>paramValues.check[0] : ${paramValues.check[0]}</li>
		<li>paramValues.check[1] : ${paramValues.check[1]}</li>
		<li>paramValues.check[2] : ${paramValues.check[2]}</li>
	
	</ul>
</body>
</html>