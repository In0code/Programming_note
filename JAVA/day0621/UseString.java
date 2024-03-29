package day0621;

/**
 * 문자열 : 문자열은 문자열 저장소에 유일하게 하나만 생성된다. <br>
 * 문자열을 저장하기 위해 자바에서는 java.lang.String class를 제공한다.<br>
 * java.lang.String 클래스는 자바에서 유일하게 <br>
 * 기본형의 문법으로 사용할 수 있는클래스이다.
 * 사용법) <br>
 * -기본형 형식) new 를 사용하지 않는다. <br>
 * String str= "값"; <br>
 * -참조형 형식 ) new 를 사용 <br>
 * String str= new String("값");
 * @author user
 *
 */
public class UseString {

	public static void main(String[] args) {

		//기본형 형식 ) 문자열 저장소의 주소를 바로 저장
		String str="AbcdE";
		//참조형 형식 ) 힙의 주소를 저장하고, 힙에서 문자열 저장소의 주소를 저장.
		String str1= new String("AbcdE");
		
		System.out.println(str+ " / "+str1);
		
		// == 을 사용하여 참조형 데이터 형을 비교하면 주소가 같은 지 비교한다.
		//if를 써도 괜찮고, 삼항연산자를 써도 괜찮음
		if (str=="AbcdE") {
			System.out.println("기본형 주소 같음");
		}else {
			System.out.println("기본형 주소 다름");
		}
		
		if (str1=="AbcdE") {
			System.out.println("참조형 주소 같음");
		}else {
			System.out.println("참조형 주소 다름");
		}
		 
		// 생성하는 문법에 따라 == 은 다른 결과를 보여준다.
		//그래서 같은지는 equals를 사용해야 한다.
		System.out.println("---------------------------");
		
		if (str.equals("AbcdE")) {
			System.out.println("기본형 equals 같음");
		}else {
			System.out.println("기본형 equals 다름");
		}//end else
		
		if (str1.equals("AbcdE")) {
			System.out.println("참조형 equals 같음");
		}else {
			System.out.println("참조형 equals 다름");
			
		}//end else
		//equals method는 string의 생성방법과 상관없이 동일한 비교를 수행한다.
		
		String mail=new String("1011kiy@naver.com");
		System.out.println(str+"의 글자수"+str.length());
		int mailLeng=mail.length();
		System.out.println(mail+"의 글자수 "+mailLeng);
		
		System.out.println(str+"을 모두 대문자로 "+ str.toUpperCase());
		String lowerCase=str.toLowerCase();
		System.out.println(str+"을 모두 소문자로 "+lowerCase);
		
		System.out.println(str+"에서 'd'의 인덱스 "+str.indexOf("d"));
		System.out.println(str+"에서 \"bcd\"의 인덱스 "+str.indexOf("bcd"));
		System.out.println(str+"에서 f 의 인덱스 "+str.indexOf("f"));
		
		String name="김인영";
		if ( name.indexOf("김")==0) {
			System.out.println("김씨입니다");
		}else {
			System.out.println("김씨아님");
		}//end if
		
		str="java";
		//indexOf는 왼쪽에서 부터 오른쪽으로 진행하면서 일치하는
		//문자열의 시작인덱스를 얻는다
		//처음 a
		System.out.println(str+" a의 인덱스 "+str.indexOf("a"));
		//마지막 a
		 System.out.println(str + " a의 인덱스 " + str.lastIndexOf("a"));
		//두번째 a
		 System.out.println(str + " a의 인덱스 " + str.indexOf("a", str.indexOf("a")+1));
		
		
		 str="AbcdeF";
		 System.out.println(str+"에서 3번째 인덱스의 문자"+str.charAt(3));
		 
		 char c=str.charAt(1);  //b의 unicode가 들어간다
		 System.out.println(c); //unicode에 해당하는 문자를 출력한다.
		 
		 
		 System.out.println(str+ "에서 2~4 인덱스 사이의 자식 문자열 " +str.substring(2,5));
		 //자르려고 하는 문자열에서 +1 해야한다.
		 
		 //1011kiy@naver.com
		 //메일주소@도메인주소
		 //mail 변수에서 메일주소와 도메인 주소를 잘라서 출력
		 System.out.println(mail+"에서 메일 주소는 "+mail.substring(0,7));
		 System.out.println(mail+"에서 도메인 주소는 "+mail.substring(8,17));
		 
		 System.out.println(mail.substring(0,mail.indexOf("@")));
		 System.out.println(mail.substring(mail.indexOf("@")+1, mail.length()));
		 //substring method는 시작인덱스만 넣으면 알아서 끝까지 잘라주는
		 //method도 있다 (overload)
		 System.out.println(mail.substring(mail.indexOf("@")+1));
		 
		 //앞 뒤 공백 자르기
		 str="   A BC   ";
		 System.out.println(str+"["+str.trim()+"]");
		 
//		 str="서울시 강남구 역삼동";
//		 str="서울시 동작구 상도동";
		 str="경기도 수원시 영통동";
		 
		 if (str.startsWith("서울시")) {
			 System.out.println("서울");
		 }else {
			 System.out.println("지방");
		 }
		 
		 str="서울시 동작구 상도리";
		 if(str.endsWith("동")) {
			 System.out.println("도시");
		 }else {
			 System.out.println("시골");
		 }
		 
		 str="내일은 화요일 입니다.";
//		 str="오늘은 월요일 입니다.";
		 if (str.contains("요일")) {
			 System.out.println("요일을 말하는 문장");
		 }else {
			 System.out.println("문장");
		 }
		 
		 str="오늘도 긴시간";
		 System.out.println(str.concat("수고 하셨습니다."));
		 
		 str="오늘은 화창한 하루입니다.";
		 System.out.println(str+" / "+str.replace("화창한", "비오는"));
		 
		 //method chain : method의 반환형이 객체라면 . (점)으로 제공하는 method를 
		 //계속 연결하여 사용할 수 있다.
		 //method의 반환형이 기본일때는 chain을 못 씀
		 str="어 나는 지금 피씨방이야! 넌 어딘데 씨방새야?";
		 System.out.println(str.replaceAll("씨", "*").replaceAll("방","*"));
		 
		 str="951212-72345678";
//		 1,3,5,7,9 -남
//		 0,2,4,6,8 -여
		 //str은 주민번화가 들어있다. 이 주민 번호가 남자인지, 여자인지를 판단하여 출력
//		 str.charAt(8)==1
		 
		 char sex=str.charAt(8);
		switch(sex) {
		case '1' : 
		case '3' : 
		case '5' :
		case '7' : 
		case '9' : 
			System.out.println("남자"); 
			break;
		case '0' : 
		case '2' : 
		case '4' : 
		case '6' : 
		case '8' : 
			System.out.println("여자");
			break;
		
		}
			 
		str=null;  //객체가 생성되지 않음 => 사용할 수 없음
		str1="32";  // 객체는 생성되었으나 값이 없음 => 사용할 수 없음
		
		if (str == null) {
//			System.out.println("str 객체가 생성되지 않았음");
////			str.length();   //객체가 생성되지 않은 상태에서는 instance method를 호출할 수 없다
//		}else {
//			System.out.println("str 객체가 생성되었음");
//
//		}}
		}
			if (str1.isEmpty()) {
				System.out.println("비었음");
			}else {
				System.out.println("비어있지 않음");
			}
		 
			 
		 
	}//main

}//class
