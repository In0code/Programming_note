package day1013;

public class CounterVO {
	private int cnt;
	
	public CounterVO() {
		System.out.println("CounterVO의 기본 생성자");
	}

	public CounterVO(int cnt) {
		super();
		this.cnt = cnt;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}

	@Override
	public String toString() {
		return "CounterVO [cnt=" + cnt + "]";
	}
	
	
}
