package day0629;

public class NeoguriRamen extends Ramen {

	@Override
	public String type() {
		return "면을 호로록";
	}// type

	@Override
	public String soup() {
		return "매콤한 너구리스프";
	}// drinkingSound

	@Override
	public String ingredients() {
		return "건더기 스프";
	}// useTool

	@Override
	public String paperbag() {
		return "봉지라면";

	}// nationality

	public String kelp() {
		return "농심에 따르면 이 다시마는 전남 완도산 다시마!!";
	}

}
