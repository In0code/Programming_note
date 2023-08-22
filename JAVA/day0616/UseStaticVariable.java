package day0616;

/**
 * static (class) variable의 사용. <br>
 * (객체화 없이 클래스명.변수명으로 클래스의 모든 영역에서 사용할 수 있는 변수) <br>
 * 1. 선언) - 자동초기화<br>
 * 접근지정사 static 데이터형 변수명;<br>
 * 2. 값할당)<br>
 * 클래스명. 변수명= 값;<br>
 * 3. 값사용)<br>
 * 클래스명.변수명<br>
 * @author user
 *
 */
public class UseStaticVariable {
	//class field : 변수선언, method정의만 기술 가능
	//1. 선언) - (static 변수는)하나만 생성, 사용된다. (공용변수 - 모든 객체가 하나의 변수를 사용)
	            //값을 변경하면 변경된 값을 계속 사용하게 된다.
	//가족이 이사가도 이사간 주소를 가족 다같이 쓸 수 있는 것처럼. 공용주소로. 이에 static. static도 공용변수이다.
	public static int age;
	static int year;
//age=10;  /error / class filed에는 변수의 선언과 method의 정의만 기술할 수 있다.
	//static이 붙어있는 애들은 같은 영역. 
	
	public void test() {  
		//static이 붙어있지 않은 instance 영역에서도 (age, year)사용가능
		age=20;  //static변수는 하나만 생성되기때문에 어디 한쪽에서 바꾸면 (전체가) 바뀐다.
		System.out.println("test영역 "+age+" / "+year);
	}
	
	public static void main(String[] args) {
		//영역이 달라도 사용가능
		UseStaticVariable usv=new UseStaticVariable();
		usv.test();  //그냥 test();만 해서는 부를 수 없음 //다른 영역 호출
		
		//2. 값 할당
//		UseStaticVariable.age=10; //클래스명.변수명도 괜찮고 
//		year=2023;  //그냥 변수명만 써도 된다
		//3. 값 사용
		System.out.println("나이 : "+age+", 올해 : "+ UseStaticVariable.year);
		
		//공용의 특징 ( 모든 객체가 하나의 변수를 사용 )
		//클래스명 객체명 = new 클래스명();
		UseStaticVariable usv2=new UseStaticVariable();  //usv2가 객체명
		UseStaticVariable usv3=new UseStaticVariable();  //usv2가 객체명
		
		//usv2 객체와 usv3객체는 같은 static 변수를 사용한다.  //객체는 다른데 같은 static 변수를 공용으로 사용
		// 야! 니네 집 전화번호 뭐야? 라고 물어보면 
//'내 집 전화는'이라고 안하고 '우리 집 전화는' 이라고 함. 엄마랑 아빠랑 나랑 같이 쓰고 있기 때문에.
		//'내집전화'는 사용은 되나, 올바른 표현은 아니다
		//-> static 변수는 특정 객체에 속해있는 변수가 아니다! 
		//-> 객체명.변수명 은 (사용은 되나)올바른 표현은 아니다.
		
		usv2.year=2024;   //usv2의 값을 변경해도 공용이다 보니 usv3의 값도 같이 바뀜
		//특정객체 usv2의 year변수를 값변경 했는데
		System.out.println("usv2.객체의 year : "+usv2.year);
		System.out.println("usv3.객체의 year : "+usv3.year); //usv3까지 함께 변경된다.
		
		
	}//main

}//class
