package edu.kh.servlet.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Servlet 관련 코드를 작성하기 위해서는 HttpServlet 클래스 상속받아야 함!
// -> 상속받았다고 하여 바로 Servlet 등록이 되는 것은 아님
// -> 1. web.xml에 작성하기, 2. @WebServlet() 어노테이션 사용

/* 어노테이션 : 컴파일러가 읽는 주석
 * 
 * @WerServlet 어노테이션
 * - 해당 클래스를 Servlet 으로 등록하고 매핑할 주소를 연결하라고 지시하는 어노테이션
 * 
 * - 서버 실행 시 자동으로 web.xml에 <servlet> <servlet-mapping>를 작성하는 효과!!
 * 
 * - ExampleController1 는 web.xml에 <servlet> <servlet-mapping> 작성된 것과 비교!
 * */

@WebServlet("/signUp")
public class ExampleController2 extends HttpServlet{
	
	@Override		// Post 요청 처리를 하는 메서드(오버라이딩)
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 원래 tomcat 9 버전때는 전달받은 값을 얻어와서 확인하면 한글이 깨지는 문제발생!!
		// -> 해결방법 : 전달받은 데이터의 문자인코딩을 서버에 맞게 변경해줘야 함!
//		req.setCharacterEncoding("UTF-8");
		// -> tomcat 10 버전 이상부터 자동으로 인코딩 처리를 해주기 때문에
		//    개발자가 직접 추가적인 처리를 할 필요가 없어짐!
		
		String inputId = req.getParameter("inputId");
		String inputPw = req.getParameter("inputPw");
		String inputName = req.getParameter("inputName");
		String intro = req.getParameter("intro");
		
		System.out.println(inputId);
		System.out.println(inputPw);
		System.out.println(inputName);
		System.out.println(intro);
		
		// 응답화면 만들기
		// -> Java 에서 응답화면을 작성하기가 번거롭고 힘들다...
		// 누가 이것 좀 대신 만들어줘라
		// -> JSP 가 대신 화면을 만들어달라! (Servlet 이 JSP 에게 요청을 위임)
		
		// JSP가 대신 응답화면을 만들어 주기 위해서는
		// Servlet 이 어떤 요청을 받았는지 알아야 함! (req, resp 을 넘겨줘야함!)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/result.jsp");
															// 경로 : webapp 폴더 기준
		// WEB-INF 폴더에 있는 파일들은 직접적으로 클라이언트가 접근할 수 없으며,
		// Servlet 을 통해서만 접근 가능!
		
		dispatcher.forward(req, resp);
		// RequestDispatcher 객체를 사용하여 현재 요청(req)과 응답(resp)을
		// 지정한 JSP 페이지(현재 : webapp/WEB-INF/views/result.jsp)로 전달하는 작업
		// -> 즉, 현재 서블릿에서 처리하던 요청을 result.jsp 로 전달하고,
		//    제어권을 그곳으로 넘김 (== 위임하다)

	}

}
