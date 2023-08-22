package day0622;

/**
 * 주민번호로 길이, 형식, 생년월일, 나이, 성별, 띠를 구하는 일을 가지고 있는 클래스
 * 
 * @author user
 *
 */
public class Work0622_t {

	private String ssn;
	private int year;
	private int genderFlag;

	/**
	 * 주민번호를 입력받아 인스턴스 변수에 저장하는 생성자
	 * 
	 * @param ssn 주민번호
	 */
	public Work0622_t(String ssn) {
		this.ssn = ssn;

	}// Work0622_t

	/**
	 * 인스턴스 변수에 저장된 주민번호를 변경할 때 사용하는 method
	 * 
	 * @param ssn 주민번호
	 */
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}// setSsn

	/**
	 * 객체가 가지고 있는 주민번호를 반환하는 일
	 * 
	 * @return 주민번호
	 */
	public String getSsn() {
		return ssn;
	}// getSsn

	/**
	 * 주민번호의 14인지 길이를 체크
	 * 
	 * @return boolean
	 */
	public boolean chkSsnLength() {
		return ssn.length() == 14;

//		boolean flag=false;
//		boolean flag=ssn.length()==14;
//		return flag;

//		if (ssn.length() == 14) {
//			flag= true;
//		}else {
//			flag= false;
//		}
	}// chkSsnLength

	/**
	 * 주민번호의 - 위치를 체크하는 일
	 * 
	 * @return boolean
	 */
	public boolean chkSsnHyphen() {
//		boolean flag=false;
//		if(ssn.indexOf("-")==6) {
//			flag=true;
//		}//end if
//		
		return ssn.indexOf("-") == 6;
	}// chkSsnHyphen

	/**
	 * 주민번호에서 생년월일을 잘라내서 반환 (subString)
	 * 
	 * @return 생년월일
	 */
	public String birth() {
		String result = "";
		genderFlag = ssn.charAt(7) - 48;
		// char 값을 int에 집어넣으면 unicode가 들어가서 49가 나온 것.

		// 쌍따옴표 두개 쓴 걸 뭐라고 할까? => empty
		// -의 뒷자리가 1,2 -> 내국인 1900년대생, 5,6 - 외국인 1900년대생
		// 3,4 -> 내국인 2000년대 생, 7,8 -> 외국인 2000년대생
		// 0,9 -> 내국인 1800년대생

//		int tempYear=1800;  //95
//		if(genderFlag==1 || genderFlag==2 ||genderFlag==5 ||genderFlag==6 ) {
//			tempYear=1900;
//		}else if(genderFlag==3 || genderFlag==4 ||genderFlag==7 ||genderFlag==8) {
//			tempYear=2000;
//		}//end if
//		 
//		year=tempYear+Integer.parseInt(ssn.substring(0, 2));	
//		
		int[] temp = { 1800, 1900, 1900, 2000, 2000, 1900, 1900, 2000, 2000, 1800 };
		year = temp[genderFlag] + Integer.parseInt(ssn.substring(0, 2));

		result = year + "년 " + ssn.substring(2, 4) + "월 " + ssn.substring(4, 6) + "일";
		return result;
	}// birth

	/**
	 * 주민번호에서 나이를 구하여 반환
	 * 
	 * @return 나이
	 */
	public int age() {
		int age = 2023 - year;

		return age;
	}// age

	/**
	 * 주민번호에서 성별을 구하여 반환
	 * 
	 * @return
	 */
	public String gender() {
//		String gender="";
//		gender=genderFlag%2==0?"여자":"남자";
//		
//		return gender;
		return "여자,남자".split(",")[genderFlag % 2]; // if안쓰고도 coding할 수 다.
	}// gender

	/**
	 * 주민번호에서 띠를 구하여 반환
	 * 
	 * @return
	 */
	public String zodiac() {
//		String[] zodiacTitle= {"원숭이","닭","개","돼지","쥐","소","호랑이","토끼","용","뱀","말","양"};
//		
//		return zodiacTitle[year%12];
		return "원숭이,닭,개,돼지,쥐,소,호랑이,토끼,용,뱀,말,양".split(",")[year % 12];// split
	}// zodiac
}// class
