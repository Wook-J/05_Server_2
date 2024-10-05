package edu.kh.todolist.model.service;

import java.util.List;

import edu.kh.todolist.model.dto.Todo;

public interface TodoListService {
	// 인터페이스에 있는 모든 메서드는 묵시적으로 public abstract 임

	/** 할 일 목록을 반환하는 서비스
	 * @return todoList
	 */
	/*public abstract*/ List<Todo> todoListFullView();		// 추상 메서드

	/** 전달 받은 title, detail 을 이용하여 할 일을 추가하는 서비스
	 * @param title
	 * @param detail
	 * @return 성공시 추가된 index 번호, 실패시 -1
	 */
	int todoAdd(String title, String detail) throws Exception;
}
