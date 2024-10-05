package edu.kh.jsp2.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/fr/forward") // 이 URL이 클라이언트에게 보여짐
public class ForwardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청처리
		// requestScope 에 새로운 값(K-V 형태) 세팅
		req.setAttribute("str", "안녕하세요");
		
		// 응답처리
		// JSP 파일 경로 작성(webapp 폴더 기준) 및 요청발송자를 이용하여 위임하기
		String path = "/WEB-INF/views/fr/forward_result.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
}
