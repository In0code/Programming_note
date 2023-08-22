package day0608;
class UseLocalVariable2{


	public static void main(String[] args) {
		//올해를 저장하는 변수와 나이를 저장하는 변수를 선언한 후
		//출력하는 코드 작성하고 샐행 => 이름의 중요성!
		int thisYear=2023;
		int age=24;

		int i=2023;
		int j=24;

			System.out.println("Thisyear:"+thisYear);
			System.out.println("age:"+ age);

			System.out.println(thisYear-age);  //가독성 향사
			System.out.println(i- j);  //가독성 저하 , i가 무엇이고 j가 무엇인지 모름

			//java에서는 이름(변수명, method명, class명)을 한글로 설정할 수 있음
			//그러나 한글로는 설정하지 않는다.
			int 올해=2023;
			int 나이=24;
				System.out.println(올해);
				System.out.println(나이);

	}//main
}//class
