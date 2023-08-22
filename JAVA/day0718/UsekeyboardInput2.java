package day0718;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class UsekeyboardInput2 {

	/**
	 * 한글이 깨지지 않도록 읽어 들이기 위해 8bit stream과 16bit stream 연결 사용
	 * 
	 * @throws IOException
	 */
	public UsekeyboardInput2() throws IOException {

		System.out.println("아무키나 누르고 엔터");

//		InputStream is = System.in;
//		InputStreamReader isr = new InputStreamReader(is);
//		BufferedReader br = new BufferedReader(isr);
		
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		String msg = br.readLine(); // 줄단위로 읽는다
		System.out.println("입력 문자열 : " + msg);

	}// UsekeyboardInput2

	public static void main(String[] args) {

		try {
			new UsekeyboardInput2();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// main

}// class
