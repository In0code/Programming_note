package day0710;


public class Work0707VO {
	private int stuNum;
	private String name;
	private int javaScore;
	private int oracleScore;
	
	public Work0707VO() {
	}

	public Work0707VO(int stuNum, String name, int javaScore, int oracleScore) {
		this.stuNum = stuNum;
		this.name = name;
		this.javaScore = javaScore;
		this.oracleScore = oracleScore;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getJavaScore() {
		return javaScore;
	}

	public void setJavaScore(int javaScore) {
		this.javaScore = javaScore;
	}

	public int getOracleScore() {
		return oracleScore;
	}

	public void setOracleScore(int oracleScore) {
		this.oracleScore = oracleScore;
	}

	@Override
	public String toString() {
		return "Work0707VO [stuNum=" + stuNum + ", name=" + name + ", javaScore=" + javaScore + ", oracleScore="
				+ oracleScore + "]";
	}

	public int getStuNum() {
		return stuNum;
	}

	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}

	
	
	
	
}