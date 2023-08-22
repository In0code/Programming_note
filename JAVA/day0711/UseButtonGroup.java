package day0711;

import java.awt.FlowLayout;

import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JRadioButton;

@SuppressWarnings("serial")
public class UseButtonGroup extends JFrame {

	public UseButtonGroup() {
		super("버튼 그룹 연습");

		JLabel jlbl = new JLabel("성별");
		JRadioButton jrb = new JRadioButton("남자",true);
		JRadioButton jrb2 = new JRadioButton("여자");

		//버튼 그룹으로 묶기
		//버튼 그룹 생성
		ButtonGroup bg=new ButtonGroup();  //기본생성자만 있음
		//추가
		//얘네 부모가 abstract button이기때문에 jrb를 넣을 수 있음
		bg.add(jrb);
		bg.add(jrb2);   
		
		
		setLayout(new FlowLayout());

		add(jlbl);
		add(jrb);
		add(jrb2);

		setBounds(100, 200, 300, 120);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// UseButtonGroup

	public static void main(String[] args) {
		new UseButtonGroup();
	}// main

}// class
