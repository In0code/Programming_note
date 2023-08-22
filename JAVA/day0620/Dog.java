package day0620;

public class Dog {

	private int legs;
	private int tail;
	private int eye;
	private String species;
	
	/**
	 * 생성된 강아지 다리의 개수를 설정하는 일
	 * @param legs 설정할 다리의 수
	 */
	public void setLegs(int legs) {
		this.legs=legs;
	}//setLegs
	
	/**
	 * 생설된 강아지 꼬리의 개수를 설정하는 일
	 * @param tail 설정할 꼬리의 개수
	 */
	public void setTail(int tail) {
		this.tail=tail;
	}//setTail
	
	/**
	 *생성된 강아지 눈 개수를 설정하는 일
	 * @param eye 설정할 눈의 개수
	 */
	public void setEye(int eye) {
		this.eye=eye;
	}//setEye
	
	/**
	 * 생성된 강아지의 종을 설정하는 일
	 * @param species 강아지의 종
	 */
	public void setSpecies(String species) {
		this.species=species;
	}//setSpecies
	
	/**
	 * 생성된 강아지의 다리 개수를 얻는 일
	 * @return 다리의 개수
	 */
	public int getLegs() {
		return legs;
	}//getLegs
	
	/**
	 * 생성된 강아지의 꼬리 개수를 얻는일
	 * @return 꼬리의 개수
	 */
	public int getTail() {
		return tail;
	}//getTail
	
	/**
	 * 생성된 강아지의 눈 개수를 얻는일
	 * @return 눈의 개수
	 */
	public int getEye() {
		return eye;
	}//getEye
	
	/**
	 * 생성된 강아지의 종을 얻는일
	 * @return 강아지의 종
	 */
	public String getSpecies() {
		return species;
	}//getSpecies
	
	
	/**
	 * 생성된 강아지가 집에서 짖는일
	 * @return 짖는일
	 */
	public String bark() {
		return species+"가 집에서 짖는다 \n";
	}
	/**
	 * 생성된 강아지가 밖에서 짖는일
	 * @param stage 장소 이름
	 * @param fine 낼 벌금
	 * @return 짖는일
	 */
	public String bark(String stage, int fine) {
			return species+"가 "+stage+"에서 계속 짖어서 벌금 "+fine+"원을 냈다. \n";
	}
	
	/**
	 * 생성된 강아지가 집에서 냄새 맡는 일
	 * @return 냄새맡는 일
	 */
	public String smell() {
		return species+"가 집에서 사람들이 밥 먹을 때 음식을 냄새 맡는다 \n";
	}
	/**
	 * 생성된 강아지가 밖에서 냄새맡는일
	 * @param stage 장소 이름
	 * @param price 가격
	 * @return 냄새맡는일
	 */
	public String smell(String food, int price) {
		return species+"가 "+food+"를 계속 냄새 맡아서 "+price+"원을 주고 사줬다. \n";
}
}//class
