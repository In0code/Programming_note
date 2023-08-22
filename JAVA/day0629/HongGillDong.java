package day0629;

/**
 * 사람 클래스를 상속받아 사람의 공통 기능(눈,코,입,이름,먹는 일)을 사용하며 <br>
 * 자신만의 특징(싸움 잘함)을 정의하는 클래스 <br>
 * 싸움 레벨은 1~10까지 이며 <br>
 * 2는 일반인이다.<br>
 * 
 * 
 * @author user
 *
 */
public class HongGillDong extends Person { // 홍길동은 사람과 is a 관계가 된다. 홍길동은 사람이다.

	private int level; // 싸움의 레벨

	/**
	 * 기본생성자 눈 2, 코 1, 입 1개가 설정되어 홍길동 클래스가 생성된다. <br>
	 * 싸움 level이 6으로 설정된다. <br>
	 */
	public HongGillDong() {
		super(); // 모든 생성자의 첫 번째 줄에는 super() 가 숨어있다
		level = 6;

	}// HongGillDong

	public void setLevel(int level) {
		this.level = level;
	}// setLevel

	public int getLevle() {
		return level;
	}// getLevle

	/**
	 * 싸움하는 일 <br>
	 * 이기거나 지거나 비김<br>
	 * 
	 * @param yourLevel 상대방의 레벨<br>
	 * @return 싸움의 결과<br>
	 */
	public String fight(int yourLevel) {
		String result = ""; // empty라고 한다

		if (yourLevel < level) { // 이기는 경우
			result = "이겼음 s( ^o^)V 포항항";
			level++;
			if (level > 10) {
				level = 10;
			} // end if
		} else if (yourLevel > level) { // 지는 경우
			result = "졌음 ~(_-_)~";
			level--;
			if (level < 1) {
				level = 1;
			} // end if
		} else { // 비기는 경우
			result = "비겼음 Orz";
		} // end if

		return result;
	}// fight

	@Override
	public String eat() {
		return getName() + "이 집에서 밥을 먹는다";
	}

	/**
	 * 주막에서 음식을 푼 내고 사먹는 일
	 */
	@Override
	public String eat(String manu, int prive) {
		// name 변수는 접근 지정자가 private이므로 직접접근이 되지 않는다
		// 자식클래스에서 부모 클래스의 name을 사용하고 싶다면
		// getter method를 사용하여 부모의 변수를 사용한다.
		return getName() + "이 주막에서" + manu + "인 음식을" + prive + "푼 내고 사먹는다";
	}

	@Override
	public String[] language() {
		String[] lang = "한국어, 중국어,율도어".split(",");
		return lang;
	}

}// class
