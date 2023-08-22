package day0626;

/**
 * 최고 학생의 정보를 저장하기 위한 객체<br>
 * 최고 학생의 번호와 이름을 저장
 * 
 * @author user
 *
 */
public class TopStudentVO {
	private int num;
	private String name;

	// 기본생성자
	public TopStudentVO() {

	}// TopStudentVO

	// 생성자의 Overload
	public TopStudentVO(int num, String name) {
		this.num = num;
		this.name = name;

	}// TopStudentVO

	// getter method
	// getter method
	public int getNum() {
		return num;
	}// getNum

	public void setNum(int num) {
		this.num = num;
	}// setNum

	public String getName() {
		return name;
	}// getName

	public void setName(String name) {
		this.name = name;
	}// setName

}// class
