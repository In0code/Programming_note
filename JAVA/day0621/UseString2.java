package day0621;

public class UseString2 {
	//입력받은 이메일의 유효성 검증을 수행하는 method를 작성
	//유효하면 true를 그렇지 않으면 false를 반환 => 가변값
	//validation : @ 과 .

	public boolean emailcheck(String email) {
		boolean flag=false;
		if (email.indexOf("@") != -1 && email.indexOf(".")!=-1) {
			flag=true;
		}
			return flag;
	}
		
	public static void main(String[] args) {

		String email1="test";
		String email2="test@test.com";
		String email3="test@testcom";
		String email4="testtest.com";
		String email5="test@sist.co.kr";
		//유효성 검증하는 method를 호출
		
//		if (email1.indexOf("@")==4 && email1.indexOf(".")==8) {
			
		UseString2 us2=new UseString2();
		System.out.println(email1+" / "+us2.emailcheck(email1));
		System.out.println(email2+" / "+us2.emailcheck(email2));
		System.out.println(email3+" / "+us2.emailcheck(email3));
		System.out.println(email4+" / "+us2.emailcheck(email4));
		System.out.println(email5+" / "+us2.emailcheck(email5));
		
		}
		
	}


