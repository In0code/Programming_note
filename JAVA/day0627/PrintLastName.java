package day0627;

/**
 * 부모클래스를 만들고 배열 받아서 "성"을 출력하는 method를 만드는 일
 * 
 * @author user
 *
 */
public class PrintLastName {

	// 가변일-반환형 없고, 매개변수 있는 형
	// 호출- 객체명.method명();
	public void printName(String[] studentNameList) {
		for (int i = 0; i < studentNameList.length; i++) {
			System.out.print(studentNameList[i].substring(0, 1) + " ");
			// 개선된 for
//      for (String name : nameList) {
//         System.out.print(name.substring(0, 1)+" ");
		} // end for
	}// printName

}// class
