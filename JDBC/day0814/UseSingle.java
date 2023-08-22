package day0814;

import java.sql.Connection;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class UseSingle {

	public static void main(String[] args) {

		// Singleton Pattern이 적용된 클래스 사용
		Singleton single = Singleton.getInstance();
		Singleton single2 = Singleton.getInstance();
		Singleton single3 = Singleton.getInstance();

		// private 이라 밖에서 객체화 안됨
//		Singleton st = new Singleton(); // 직접 객체화 불가능

		System.out.println(single + " / " + single2 + " / " + single3 + "\n"); // 몇 번을 쓰든 같은 객체가 나온다

		try {
			Connection con = DbConn.getInstance().getConnection("localhost", "scott", "tiger");
			System.out.println(con);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
