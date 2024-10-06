/* 제목이 작성되지 않은 경우 form 태그 제출 막기 */
const addForm = document.querySelector("#addForm");     // form 태그
const title = document.querySelector("[name=title]");   // 제목 input 태그 (일반속성 선택자)

// addForm 이 제출될 때
addForm.addEventListener("submit", (e) => {             // e : 이벤트 객체
  const input = title.value.trim();     // 제목 입력 값 가져와서 양쪽 공백 제거

  if(input.length === 0){               // 제목이 입력되지 않았을 때
    e.preventDefault();                 // form 제출 이벤트 막기
    alert("제목을 입력해주세요");         // 알림창 띄우기
    title.focus();                      // 제목 input 창에 focusing 하기
  }
});