package kr.co.sist.course;

public class LecturePlanVO {
	private String subName ; 
	private String subGoal ;  
	private String subInfo ;
	/**
	 * @return the subTitle
	 */
	/**
	 * @return the subName
	 */
	
	public LecturePlanVO() {
		
	}
	public String getSubName() {
		return subName;
	}
	/**
	 * @param subName the subName to set
	 */
	public void setSubName(String subName) {
		this.subName = subName;
	}
	/**
	 * @return the subGoal
	 */
	public String getSubGoal() {
		return subGoal;
	}
	/**
	 * @param subGoal the subGoal to set
	 */
	public void setSubGoal(String subGoal) {
		this.subGoal = subGoal;
	}
	/**
	 * @return the subInfo
	 */
	public String getSubInfo() {
		return subInfo;
	}
	/**
	 * @param subInfo the subInfo to set
	 */
	public void setSubInfo(String subInfo) {
		this.subInfo = subInfo;
	}
	@Override
	public String toString() {
		return "LecturePlanVO [subName=" + subName + ", subGoal=" + subGoal + ", subInfo=" + subInfo + "]";
	}
	public LecturePlanVO(String subName, String subGoal, String subInfo) {
		super();
		this.subName = subName;
		this.subGoal = subGoal;
		this.subInfo = subInfo;
	}
	
}