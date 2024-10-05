<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL/JSTL 기초 연습</title>
</head>
<body>
	<pre>
		index.html 과 index.jsp 의 차이점
		
		- html : html, css, js 코드 작성이 가능함 
				+ 정적 페이지 (미리 만들어진 형태 그대로 출력)

		- jsp : html, css, js, java, el, jstl 작성 가능
				+ 동적 페이지 (요청에 따라 응답화면 변화가 가능)
	</pre>
	
	<hr>
	
	<h1>EL (Expression Language, 표현 언어)</h1>
	<pre>
		- JSP에서 Java 코드 값을 쉽게 출력하는 언어
		- 표현식 : \${key}
	</pre>
	
	<%-- form 태그 method 생략 시 기본값 GET --%>
	<%-- 2레벨로도 요청주소 작성 가능! --%>
	<form action="/el/test1">		<%-- ELTestServlet1(@WebServlet)와 연동 --%>
		문자열 입력 : <input type="text" name="str"> <br>
		정수 입력 : <input type="number" name="intNum"> <br>
		실수 입력 : <input type="text" name="doubleNum"> <br>
		
		<div>
			A <input type="checkBox" name="check" value="A">
			B <input type="checkBox" name="check" value="B">
			C <input type="checkBox" name="check" value="C">
		</div>
		
		<button>제출하기</button>
	</form>
	
	<hr>
	<h1>
		<%-- a태그 클릭 시 요청은 GET방식임 --%>
		<%-- ELTestServlet2(@WebServlet)와 연동 --%>
		<a href="/el/scope">Servlet / JSP 범위(scope)별 내장 객체 + EL 사용법</a>
	</h1>
	
	<hr>
	
	<h1>
		<%-- JSTLTestServlet(@WebServlet)와 연동 --%>
		<a href="/jstl/test"> JSTL 간단히 다뤄보기</a>
	</h1>
	
	<hr>
	
	<h1>
		<%-- BookServlet(@WebServlet)와 연동 --%>
		<a href="/book/list"> 책 목록 조회하기</a>
	</h1>
	
	<hr>
	
	<h1>forward 와 redirect</h1>
	
	<h3>forward : 요청 위임</h3>
	<pre>
		- 클라이언트 요청을 받은 Servlet/JSP가 직접 응답하는 것이 아닌
		  다른 Servlet/JSP 에 HttpServletRequest, HttpServletResponse 객체를
		  넘겨서(위임) 대신 응답하게 하는 것
		  
		- 요청 위임 시 RequestDispatcher(요청 발송자)를 이용
		
		- 요청 위임할 JSP ***파일 경로*** 작성
		
		- 응답 화면(결과 페이지) 주소는 처음 Servlet이 요청받은 주소 그대로 표현됨!
	</pre> 
	
	<form action="/fr/forward">		<%-- ForwardServlet(@WebServlet)와 연동 --%>
		forward 입력 1 : <input type="text" name="forwardInput1"> <br>
		forward 입력 2 : <input type="text" name="forwardInput2"> <br>
		<button>forward 확인하기</button>
	</form>
	
	<hr>
	
	<h3>redirect(재요청, 다른 Servlet을 요청)</h3>
	<pre>
		- 클라이언트의 요청을 받은 Servlet에서 직접 응답하지 않고,
		  다른 Servlet을 다시 요청하는 것
		
		- 보통 Servlet 요청 처리 후 특정 JSP로 요청을 위임해서 결과화면을 응답하는 것이 아닌
		  (요청 받은 Servlet이 응답해줄 JSP가 없는 경우)
		  다른 Servlet을 다시 요청하여 다른 Servlet의 결과 화면을 응답해줌!!
		  
		- redirect는 다시 요청하는 것이다 보니,
		  기존의 (req, resp 객체)가 사라지고, 새로운 (req, resp 객체)가 생성됨!!
		  -> request scope 에 세팅된 값들이 모두 사라짐
		
		- redirect 응답 화면의 주소가 처음 요청한 Servlet 주소가 아닌
		  재요청한 Servlet 주소로 변경됨
		
		- 다른 Servlet으로 요청을 하기 위해서는 "요청 주소"를 작성해야 함
	</pre>
	
	<form action="/fr/redirect">	<%-- RedirectServlet(@WebServlet)와 연동 --%>
		redirect 입력 1 : <input type="text" name="redirectInput1"> <br>
		redirect 입력 2 : <input type="text" name="redirectInput2"> <br>
		<button>redirect 확인하기</button>
	</form>
	
	
</body>
</html>