package edu.kh.todolist.controller;

import java.io.IOException;

import edu.kh.todolist.model.service.TodoListService;
import edu.kh.todolist.model.service.TodoListServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/todo/add")
public class TodoAddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* 할 일 추가 -> 파일에 입력 받은 데이터를 저장 */
		try {		// 모든 예외는 컨트롤러로 던지기
			
			// 1. TodoListServiceImpl 객체 생성
			TodoListService service = new TodoListServiceImpl();
			
			// 2. 요청 시 전달 받은 파라미터 얻어오기(title, detail)
			String title = req.getParameter("title");
			String detail = req.getParameter("detail");
			
			// 3. 서비스 호출 시 매개변수로 파라미터 전달, 결과 반환 받기
			//    1) 성공 시 -> 추가된 index 번호/  2) 실패 시 -> -1 반환
			int index = service.todoAdd(title, detail);
			
			// 4. 반환 값으로 성공/실패 메시지 세팅
			String message = null;
			if(index > -1) message = "추가 성공!";
			else message = "추가 실패...";
			
			// 5. 기존의 req 를 사용할 수 없으므로 session 을 이용해 전달할 값 세팅
			HttpSession session = req.getSession();
			session.setAttribute("message", message);
			
			// 6. 메인 페이지로 redirect(재요청)
			resp.sendRedirect("/");
			// index.jsp 호출 -> /main으로 호출 -> doget 메서드 수행됨
			// resp.sendRedirect("/main"); 으로 해도 결과는 같음!
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
