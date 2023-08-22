package day0627;

/**
 * 자식클래스를 만들고 배열을 받아서 "이름"을 출력하는 method를 만드는 일(Override)
 * FirstName=이름
 * LastName=성
 * @author user
 *
 */
public class PrintFirstName extends PrintLastName {

	@Override
	// 학생의 이름을 출력하는 일
	public void printName(String[] studentNameList) {
		// 자식과 부모가 같은 이름의 method를 가질 때
		// super.method명()
		super.printName(studentNameList);
		System.out.println();
		for (int i = 0; i < studentNameList.length; i++) {
			System.out.print(studentNameList[i].substring(1, 3) + " ");
			// 개선된 for
			// for (String name : nameList) {
//         System.out.print(name.substring(1, 3) + " ");
		} // end for
		System.out.println();
	}// printName

	public static void main(String[] args) {
		String[] studentNameList = { "강다연", "김다영", "김선경", "김인영", "김주민", "박상준", "박서영" };
		PrintFirstName fn = new PrintFirstName();
		fn.printName(studentNameList);
		// is a관계로 객체화를 한 후 Override된 method를 호출하는 일
		// is a 관계
		// 부모클래스명 객체명=new 자식클래스의생성자();
		PrintLastName pfn = new PrintFirstName();
		System.out.println("-----------------------------------");
		// 가변일-반환형 없고, 매개변수 있는 형
		// 호출- 객체명.method명();
		pfn.printName(studentNameList);

	}// main
}// class
