package day0616;

/**
 * 접근 지정자의 접근확인 연습
 * @author user
 *
 */
public class ModifiersA {
	public int a;
	protected int b;
	int c;
	private int d;
	
	public static void main(String[] arags) {
		//instance 변수를 쓰려면 객체화 해야함
		ModifiersA ma=new ModifiersA();
		
		System.out.println("public a "+ma.a);
		System.out.println("protected b "+ma.b);
		System.out.println(" c "+ma.c);
		System.out.println("private d "+ma.d);
	}

}
