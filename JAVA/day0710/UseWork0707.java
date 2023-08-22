package day0710;

import java.util.Hashtable;
import java.util.Map;

import javax.swing.JOptionPane;

public class UseWork0707 {
	private Map<Integer, Work0707VO> studentMap;

	public UseWork0707() {
		studentMap = new Hashtable<Integer, Work0707VO>();
	}

	public void selectMenu() {
		boolean exitFlag = false;
		String menuSelect = "";
		String serchNum = "";

		do {
			menuSelect = JOptionPane.showInputDialog("메뉴\n1.입력 2.검색 3.종료");
			if (menuSelect.equals("1")) {
				dataInput();
			} else if (menuSelect.equals("2")) {
				serchNum = JOptionPane.showInputDialog("검색하려는 학생 번호를 입력해주세요.");
				printdataInput(serchNum);
			} else if (menuSelect.equals("3")) {
					exitFlag = exitProgram();
					JOptionPane.showMessageDialog(null, "사용해주셔서 감사합니다.!!");
			}

		} while (!exitFlag);
	}

	public void dataInput() {
		// 입력된 배열을 사용하여 VO를 생성하고
		// 리스트에 추가
		String inputData = "";
		String[] tempData = null;
		int stuNum=0;
		String name="";
		int javaScore=0;
		int oracleScore=0;

		inputData = JOptionPane.showInputDialog("학생의 정보를 아래 처럼 입력해주세요.\n예) 학생번호, 이름, 자바, 오라클");
		if (inputData != null && !inputData.equals("")) {

			inputData = inputData.replace(" ", "");// White Space 처리

			tempData = inputData.split(",");
			if (tempData.length == 4) {
				stuNum = Integer.parseInt(tempData[0]);
				name = tempData[1];
				javaScore = Integer.parseInt(tempData[2]);
				oracleScore = Integer.parseInt(tempData[3]);
				Work0707VO student = new Work0707VO(stuNum, name, javaScore, oracleScore);
				studentMap.put(stuNum, student);
			}
		}

	}

	public void printdataInput(String serchNum) {
		Work0707VO student = studentMap.get(Integer.parseInt(serchNum));
		System.out.println("학생번호\t이름\t자바\t오라클\t총점\t평균");
		if (studentMap.containsKey(Integer.parseInt(serchNum))) {
			System.out.printf("%d\t\t%s\t%d\t%d\t%d\t%d\n", student.getStuNum(), student.getName(), student.getJavaScore(),
					student.getOracleScore(), student.getJavaScore() + student.getOracleScore(),
					(student.getJavaScore() + student.getOracleScore()) / 2);
		}

	}

	public boolean exitProgram() {
		return true;
	}

	public static void main(String[] args) {
		UseWork0707 w = new UseWork0707();
		w.selectMenu();

	}
}
