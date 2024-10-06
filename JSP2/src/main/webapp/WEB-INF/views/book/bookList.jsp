<%-- prefix c : 자주 사용하는 Java 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- prefix fn : 컬렉선/문자열 관련 기능 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 목록 조회</title>

	<%--
		CSS, JS 파일은 브라우저에서 직접 요청하는 정적 파일.
		브라우저(클라이언트)가 HTML 페이지 로드할 때
		CSS, JS 파일에 대한 경로를 지정하고, 해당 경로로 요청을 보냄
		
		이런 정적 리소스들을 클라이언트(브라우저)에서 직접 접근 가능해야 하므로,
		webapp 폴더 또는 그 하위폴더에 있어야 함.
		
		WEB-INF 폴더 안에 넣으면 인식 안됨!!
	--%>
	 
	<%--webapp 폴더를 기준으로 css 파일 경로 작성(css 파일은 head 부분에 작성함) --%>
	<link rel="stylesheet" href="/resources/css/book.css">
</head>

<body>
	<h1>책 목록 조회</h1>
	<hr>
	<h3>전체 책 수량 : ${fn:length(bookList)}권</h3>
	<hr>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>저자</th>
				<th>가격(원)</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="book" items="${bookList}" varStatus="vs">
				<tr>
					<th>${vs.count}</th>
					<td>${book.title}</td> <%-- vs.current.title 도 가능 --%>
					<td>${book.writer}</td> <%-- Book 클래스에 있는 title, writer, price 를 --%>
					<td>${book.price}</td>	<%-- 이렇게 불러와도 땡겨올 수 있음..!(getter 인건가..) --%>
				</tr>
				
				<%-- 3배수 번째 반복 시 사이에 회색의 여백 만들기 --%>
				<c:if test="${vs.count%3 == 0}">
					<tr>
					<td class="blank" colspan="4">&nbsp;</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<br><hr>
	<button type="button" id="btn">js 테스트</button>


	<%-- webapp 폴더를 기준으로 js 파일 경로 작성(js 파일은 보통 body 의 맨 끝에 작성함) --%>
	<script src="/resources/js/book.js"></script>
</body>
</html>