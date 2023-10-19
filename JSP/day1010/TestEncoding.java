package day1010;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class TestEncoding {

	public static void main(String[] args) {

		String msg="aaa임태균bbb";
		
		try {
			String encode=URLEncoder.encode(msg,"UTF-8");//encoding 할 cahrset
			System.out.println("원본 : "+msg);
			System.out.println("ebcode : "+ encode);
			
			String decode=URLDecoder.decode(encode,"UTF-8");//decoding 할 charset
			System.out.println("decode : "+decode);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}//main

}//class
