package day0724;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * Socket을 열어 지정한 서버에 접속 하는 일
 * 
 * @author USER
 */
public class TestSocket {

	public TestSocket() throws UnknownHostException, IOException {
		// 1. Socket을 생성하여 서버에 접속
		Socket client = new Socket("127.0.0.1", 65000);
		System.out.println("클라이언트 생성");

	}// TestSocket

	public static void main(String[] args) {
		try {
			new TestSocket();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
