package day1018;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.tomcat.util.codec.binary.Base64;

import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;

public class TestMessageDigest {

	public static void main(String[] args) {
		String plainText = "안녕";
		// 1. 일방향 HASH Algorithm을 사용할 수 있는 객체 생성
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			// 2. 일반 문자열( Plain Text )를 암호화 문자열( Cipher Text )로 변환 수행
			md.update(plainText.getBytes());
			// 3. 암호화 문자열 받기
			byte[] cipherArr = md.digest();
			// 4. Base64 encoder를 사용하여 encoding
			Base64 base = new Base64();
			String cipherText = new String(base.encode(cipherArr));
			System.out.println("MD5 : "+cipherText);

			String cipher1 = DataEncrypt.messageDigest("SHA-512", plainText);
			System.out.println(cipher1);

			String text = "test@test.com";
			// 암호화 ( plain text -> cipher text )
			DataEncrypt de = new DataEncrypt("a12345678901234567");
			String cipher2 = de.encryption(text);
			System.out.println("이름 : "+cipher2);
			// 복호화 ( cipher text -> plain text )
			DataDecrypt dd = new DataDecrypt("a12345678901234567");
			String plain2 = dd.decryption(cipher2);
			System.out.println(plain2);

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
