package day0627;

import java.util.ArrayList;
import java.util.List;

/**
 * Annotation 사용 <br>
 * 
 * @author user
 *
 */
public class TestAnnotation {
	/**
	 * 6월27일에는 시간이 안갔으나, 지금은 아님 <strong>Deprecated</strong> 얘 말고 쟤쓰세욧
	 */
	@Deprecated
	public void print() {
		System.out.println("아! 오늘은 기부니가 좋다!");

	}// print

	@Override
	public String toString() {
		return "주소는 거절한다";
	}// toString

//	@SuppressWarnings("unused")
	@SuppressWarnings({ "rawtypes", "unused" })
	public void test() {
//		@SuppressWarnings("unused")
		int i = 0;
//		@SuppressWarnings("unused")
		int j=0;
		
		List list=new ArrayList();
		
		
	}// test

	public static void main(String[] args) {

		TestAnnotation ta = new TestAnnotation();
		ta.print();
		String str = new String("내일은 쉰댄다 ㄴㅇㅅ");
		System.out.println(str);
		System.out.println(ta);
	}// main

}// class
