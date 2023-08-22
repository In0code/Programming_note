package day0620;

/**
 * person 클래스를 생성하여 사용하는 일
 * @author user
 *
 */
public class UsePerson {

	/**
	 * Java Application
	 * @param args
	 */
	public static void main(String[] args) {
		//객체 생성
		Person inyoung=new Person();
//		inyoung.setEye(2);
//		inyoung.setNose(1);//		inyoung.setMouth(1);
		inyoung.setName("김인영");
		
		System.out.printf("눈의 수 %d, 코의 수 %d, 입의 수 %d, 이름 %s \n"
				,inyoung.getEye(),inyoung.getNose(), inyoung.getMouth(),inyoung.getName());
		//객체가 제공하는 기능을 사용
		System.out.println(inyoung.eat());
		System.out.println(inyoung.eat("돈가스",13000));
		
		Person youngjea=new Person(3,1,1);  //이렇게 하면 setter method를 많이 안불러도 된다.
		
//		youngjea.setEye(2);
//		youngjea.setNose(1);
//		youngjea.setMouth(1);
		youngjea.setName("김영재");
		
		System.out.printf("눈의 수 %d, 코의 수 %d, 입의 수 %d, 이름 %s \n"
				,youngjea.getEye(),youngjea.getNose(), youngjea.getMouth(),youngjea.getName());
		
		System.out.println(youngjea.eat());
		System.out.println(youngjea.eat("대원칼국수",9000));
		System.out.println("---------------------------------");
		//객체생성
		Person kimiy=new Person();
		//값할당
		kimiy.setEye(2);
		kimiy.setMouth(1);
		kimiy.setNose(1);
		kimiy.setName("김인영");
		//객체사용
		System.out.printf("%s의 눈은 %d개 이고 입은 %d개, 코는 %d개이다\n",kimiy.getName(),kimiy.getEye(),
				kimiy.getMouth(),kimiy.getNose());
		System.out.println(kimiy.eat());
		System.out.println(kimiy.eat("냉모밀과 돈까스",7500));
		
	}//main

}//class