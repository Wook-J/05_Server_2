package edu.kh.servlet.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/coffee")									// import jakarta.servlet.annotation.WebServlet;
public class ExampleController3 extends HttpServlet{	// import jakarta.servlet.http.HttpServlet;
	
	@Override		// import 4개(HttpServletRequest, HttpServletResponse, ServletException, IOException)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String orderer = req.getParameter("orderer");
		String coffee = req.getParameter("coffee");
		String type = req.getParameter("type");
		
		/*
		 * name 속성값이 같은 파라미터가 여러 개인 경우
		 * String[] 로 한번에 반환하는 getParameterValues("name속성값") 사용
		 * */
		String[] optionArr = req.getParameterValues("opt");
		
		System.out.println(orderer);
		System.out.println(coffee);
		System.out.println(type);
		System.out.println(optionArr);	// 주소값
		
		for(String opt : optionArr) System.out.println(opt);
		
		// ---------------------------------------------------------
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/result2.jsp");
		dispatcher.forward(req, resp);
	}

}
