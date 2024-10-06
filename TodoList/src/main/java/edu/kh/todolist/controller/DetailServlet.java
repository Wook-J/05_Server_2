package edu.kh.todolist.controller;

import java.io.IOException;
import java.util.List;

import edu.kh.todolist.model.dto.Todo;
import edu.kh.todolist.model.service.TodoListService;
import edu.kh.todolist.model.service.TodoListServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/todo/detail")
public class DetailServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int index = Integer.parseInt( req.getParameter("index") );
		
		try {
			TodoListService service = new TodoListServiceImpl();
			List<Todo> todoList = service.todoListFullView();
			Todo todo = todoList.get(index);
			req.setAttribute("todo", todo);
			
			String path = "/WEB-INF/views/detail.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
