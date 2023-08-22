package day0614;

/**
 * switch~case 사용
 * @author user
 *
 */
public class UseSwitchCase2 {
	public static final int GRADE_A_PLUS=10;
	public static final int GRADE_A=9;
	public static final int GRADE_B=8;
	public static final int GRADE_C=7;
	public static final int GRADE_D=6;
	public static final int MONKET=0;
	public static final int CHICKIN=1;
	public static final int DOG=2;
	public static final int PIG=3;
	public static final int MOUTHE=4;
	public static final int COW=5;
	public static final int TIGER=6;
	public static final int RABBIT=7;
	public static final int DRAGON=8;
	public static final int SNAKE=9;
	public static final int HORS=10;
	public static final int SHIP=11;
	
 public static void main(String[] args) {
	 
	 //java 는 정수 나누기 정수는 정수이다
	 //constant 를 만들어서 가독성을 향상시켜야 한다.
//	 int score=64;
//	 switch (score/10) {
	//case 10:
	//case 9: grade='A'; break;
	//case 8: grade='B'; break;
	//case 7: grade='C'; break;
	//case 6: grade='D'; break;    // 이거는 가독성이 떨어짐. 9가 뭔지 10이 뭔지 잘 모름
	//default:grade='F';
	 int score=100;
	if(score>-1 && score<101) {
	 switch (score/10) {
	 case GRADE_D : System.out.println(score+"는 D학점");break;
	 case GRADE_C : System.out.println(score+"는 C학점");break;
	 case GRADE_B : System.out.println(score+"는 B학점");break;
	 case GRADE_A : System.out.println(score+"는 A학점");break;
	 case GRADE_A_PLUS :System.out.println(score+"는 A+학점"); break;
	 default:System.out.println(score+"는 F학점");
	 }
	}else {
		System.out.println(score+"는 점수가 아닙니다.");
	}
//	 
//	 int score='A';
//	 char grade = '\u0000';
//	
//	 switch (score/10) {
//	case UseSwitchCase2.GRADE_A:
//		
//		break;
//
//	default:
//		break;
//	}
//	 
	 
	//switch (score/10) {
	//case    //break가 들어가 있는 switch가 더 좋다
//	case  UseSwitchCase2.GRADE_A:
//	 case : UseSwithchCase2.GRADE_B break;
//	 case  UseSwithchCase2.GRADE_C: break;
//	 case  UseSwithchCase2.GRADE_D: break;
//	default:grade='F';
//	}
//	 
	// System.out.println(score+" 점의 학점은 "+grade);

	 
	 // 띠 구하기를 switch~case로 구현
	 int year = 1999;
	 switch (year%12) {
	case UseSwitchCase2.MONKET: 
		System.out.println(year+"년도는 원숭이띠"); break;
	case UseSwitchCase2.CHICKIN: 
		System.out.println(year+"년도는 닭띠"); break;
	case UseSwitchCase2.DOG: 
		System.out.println(year+"년도는 개띠"); break;
	case UseSwitchCase2.PIG: 
		System.out.println(year+"년도는 돼지띠"); break;
	case UseSwitchCase2.MOUTHE:
		System.out.println(year+"년도는 쥐띠"); break;
	case UseSwitchCase2.COW: 
		System.out.println(year+"년도는 소띠"); break;
	case UseSwitchCase2.TIGER:
		System.out.println(year+"년도는 호랑이띠"); break;
	case UseSwitchCase2.RABBIT:
		System.out.println(year+"년도는 토끼띠"); break;
	case UseSwitchCase2.DRAGON: 
		System.out.println(year+"년도는 용띠"); break;
	case UseSwitchCase2.SNAKE: 
		System.out.println(year+"년도는 뱀띠"); break;
	case UseSwitchCase2.HORS:
		System.out.println(year+"년도는 말띠"); break;
		
	default : System.out.println("양띠");
	}

	 }
	 
	
		
	}


