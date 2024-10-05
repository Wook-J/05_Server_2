package edu.kh.todolist.model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import edu.kh.todolist.model.dto.Todo;

public class TodoListDAOImpl implements TodoListDAO{
	
	// 필드
	private final String FILE_PATH ="/servlet_todoList_data/TodoList.dat";	// 경로지정
									// (위치) C:/servlet_todoList_data/TodoList.dat
	private ObjectOutputStream oos = null;		// 객체 출력용 스트림
	private ObjectInputStream ois = null;		// 객체 입력용 스트림
	
	private List<Todo> todoList = null;
	
	// 생성자
	public TodoListDAOImpl() throws Exception{
		
		// TodoList.dat 파일이 없으면 새로운 List 생성, 있으면 내용 읽어오기
		File file = new File(FILE_PATH);
		
		if(!file.exists()) {		// 파일이 존재하지 않는 경우
			todoList = new ArrayList<Todo>();
			
			todoList.add(new Todo("Servlet 공부", "수업 내용 복습하기~1111"));
			todoList.add(new Todo("JSP 공부", "수업 내용 복습하기~2222"));
			todoList.add(new Todo("TodoList 만들기", "수업 내용 복습하기~3333"));
		}else {						// 파일이 존재하는 경우
			// 외부파일에 작성된 List<Todo> 객체를 입력받아 todoList 에 대입
			
			try {			// catch 는 안쓸거임! 호출한 곳에 던질 예정!(throws ~)
				ois = new ObjectInputStream(new FileInputStream(FILE_PATH));
				todoList = (ArrayList<Todo>) ois.readObject();
			} finally {
				if(ois!=null) ois.close();
			}
		}
	}
	
	// 보조 메서드
	@Override		
	public void saveFile() throws Exception{
		// 예외는 throws 로 던져버리기 때문에 catch 문 불필요
		// 이때 인터페이스에도 throws Exception 작성해야 함! 폭탄던지기를 끝까지 이어줘야 함
		try {
			oos = new ObjectOutputStream(new FileOutputStream(FILE_PATH));
			oos.writeObject(todoList);
		} finally {
			if(oos != null) oos.close();
		}
	}
	
	// 일반 메서드
	@Override
	public List<Todo> todoListFullView() {
		return todoList;
	}

	@Override
	public int todoAdd(Todo todo) throws Exception{
		
		if(todoList.add(todo)){				// Todo 객체 파일 추가 성공 시
			saveFile();						// 외부파일로 출력
			return todoList.size() - 1;		// 마지막 인덱스 번호 반환
		}
		
		return -1;
	}

}
