package day0627;

public class UseInyoung {

	public static void main(String[] args) {

		Inyoung iy = new Inyoung();
		iy.setName("인영");
		System.out.printf("눈 : %d , 코 : %d , 입 : %d, 이름 : %s\n", iy.getEye(), iy.getNose(), iy.getMouth(),
				iy.getName());
		System.out.println(iy.eat());
		System.out.println(iy.eat("팥"));
		System.out.println();

		String health = "건강";
		System.out.println(health + "해서 " + iy.workingInNatual(health));
		health = "약간 빈혈";
		System.out.println(health + "와서 " + iy.workingInNatual(health));
		health = "너무 힘들어";
		System.out.println(health + "서 " + iy.workingInNatual(health));
	}//main

}//class