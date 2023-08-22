package day0707;

import java.util.Stack;

public class UseStack {

	public UseStack() {
		// 1. 생성 )
		Stack<String> stk = new Stack<String>();
		// 2. 값 할당
		stk.push("드세요");
		stk.push("맛있게");
		stk.push("점심을");

//		System.out.println(stk.pop());
//		System.out.println(stk.pop());
//		System.out.println(stk.pop());
//		System.out.println(stk.get(2));// 부모의 method를 사용하지 않는다
//		System.out.println(stk.get(1));
//		System.out.println(stk.get(0));
		while (!stk.empty()) {// Stack이 비어있지 않다면
			System.out.println(stk.pop());// Stack은 히스토리를 만들 때 사용한다.
		}

		System.out.println(stk);
	}

	public static void main(String[] args) {
		new UseStack();

	}

}
