package day0627;

/**
 * 1. 자신이 생각했을 때 다른 사람과 차별화되는 점을 한가지 뽑고 <br>
 * day0727.Person 클래스를 상속받아 자신의 클래스를 만드는 일<br>
 * 객체화 하고 자신의 장점을 사용하는 일<br>
 * 
 * @author user
 *
 */
public class Inyoung extends Person {

	public int workingInNatual;

	public Inyoung() {
		super();
		workingInNatual = 6;
	}// Inyoung

	public int getWorkingInNatual() {
		return workingInNatual;
	}// getCoding

	public void setWorkingInNatual(int workingInNatual) {
		this.workingInNatual = workingInNatual;
	}// setCoding

	public String workingInNatual(String health) {
		String result = "";
		if (health.equals("건강")) {
			workingInNatual = 10;
			result = "자연에서 일 하는 거 너무 좋음 룰루~ ^ㅁ^";
		} else if (health.equals("약간 빈혈")) {
			workingInNatual = 5;
			result = "일 하는 건 재밌지만 약간 힘듬(ㅠ_ㅠ)";
		} else {
			workingInNatual = 2;
			result = "퇴사 마려움~(_-_)~";
		}
		return result;

	}// coding

	@Override
	public String eat() {
		return getName() + "이가 음식을 안가리고 골구로 잘 먹는다";
	}// eat

	public String eat(String hatemanu) {
		return getName() + "이가 " + hatemanu + "은 빼고 다 잘 먹는다";
	}// eat

}// class