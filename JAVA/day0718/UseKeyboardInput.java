package day0718;

import java.io.IOException;

/**
 * 키보드에서 눌린 키의 값 받기
 * 
 * @author user
 *
 */
public class UseKeyboardInput {

	public UseKeyboardInput() throws IOException {

		System.out.println("아무키나 누르고 엔터!!");
////		int keyCode = System.in.read();  // 멈춰!
//		int unicode = System.in.read();  // 멈춰!
////		System.out.println("입력한 키 : "+ keyCode);
//		System.out.println("입력한 키 : "+unicode+" , "+ (char)unicode);
		
		int code=-1;
		while((code=System.in.read() )!= 13) {
			System.out.print((char)code);
//			System.out.println(code);
		}
		
	
	}// UseKeyboardInput

	public static void main(String[] args) {
		try {
			new UseKeyboardInput();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}// main

}// class