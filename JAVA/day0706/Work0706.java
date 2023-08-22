package day0706;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.swing.JOptionPane;

public class Work0706 {

	public void studentScore() {
		
		String score=JOptionPane.showInputDialog("이름, 자바점수, 오라클점수를 입력\n\"출력\"을 입력하시면 출력합니다.\n그만두실려면 Y/y를 입력해주세요");
		String csvData=score;
		System.out.print("이름\t자바\t오라클\t총점");
		System.out.println();
		StringTokenizer st=new StringTokenizer(csvData,",");
//    	System.out.println(st);
//		System.out.print(score);
		String name="";
		while(st.hasMoreTokens()) {
			name=st.nextToken();
			System.out.print(name+"\t");
		}
		System.out.println();
		
		List<String> set=new ArrayList<String>();
		String[] nameArr=new String[4];
		set.toArray(nameArr);
		
		if(score.equals("y")||score.equals("Y")) {
//			JOptionPane.
		}
		
		
		
		
	}//studentScore
	public static void main(String[] args) {
		Work0706 w=new Work0706();
		w.studentScore();
	}//main

}//class
