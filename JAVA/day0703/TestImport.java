package day0703;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
//import java.sql.Date;  //이름이 같고 package가 다르다면, 둘 중 하나만 import 받는다 //먼저 선언된 놈이 임자

/**
 * import 연습
 * 
 * @author user
 *
 */
public class TestImport {

	public static void main(String[] args) {

//		Date d; // TestImport 클래스가 존재하는 패키지에 Date 클래스가 없으므로 error

		java.sql.Date d = null; // squl의 Date 사용하고 싶고
		Date d1 = null; // utill의 Date를 사용하고 싶으면? 그때 full path를 쓰는 것임
		// import를 받으면 내 클래스에서 몇 개든 쓸 수 있음. 내 package에 존재하지 않더라도. 필요한 만큼
		// import를 정의하지 않으면 full path로 처리할 수 있다
		// full path: 클래스가 사용될 때마다 패키지를 명시하는 것. 패키지명. 클래스명
		java.awt.List list = new java.awt.List(); // 너무 귀찮음. 안되는건 아닌데, 귀찮아서 잘 안함.

		SimpleDateFormat sdf = null;
		DecimalFormat df = null;

	}// main

}// class