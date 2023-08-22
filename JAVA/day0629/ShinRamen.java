package day0629;

public class ShinRamen extends Ramen {

	@Override
	public String type() {
		return "면";
	}// type

	@Override
	public String soup() {
		return "매콤한 신라면 스프";
	}// drinkingSound

	@Override
	public String ingredients() {
		return "건더기 스프";
	}// useTool

	@Override
	public String paperbag() {
		return "봉지라면";

	}// nationality

	public String hotSpicy() {
		return "너무 매운데 맛있다 ㅠㅠ 기영이 기철이도 울고가는 신라면";
	}

}
