package day0725;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class UseURLEncoding {

	public static void main(String[] args) {
		String msg = "오늘은 후덥지근한 화요일입니다";
		// 일반문자열 => 사람이 볼 수 있으나 패킷에 실을 수 없다
		String encode = "";
		System.out.println("일반 문자열 : " + msg);
		try {
			encode = URLEncoder.encode(msg, "UTF-8");
			// 패킷에 실을 수 있도록 encoding을 한다
			System.out.println("encode된 문자열 : " + encode);

			String decode = URLDecoder.decode(encode, "UTF-8");
			System.out.println("decode된 문자열 : " + decode);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} // end catch

	}// main

}// class
