package day0706;

import javax.swing.JOptionPane;

public class TestInputDialog {

	public static void main(String[] args) {

		// 사용자가 입력하는 입력값을 받기 위한 Dialog
		// 입력값은 문자열로만 입력된다.
		// 사용법) String data= JOptionPane.showInputDialog("메시지");
		String name=JOptionPane.showInputDialog("당신의 이름을 이력해주세요");
		System.out.println("입력한 이름 : "+name);

	}// main

}// class