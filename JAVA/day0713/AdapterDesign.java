package day0713;

import javax.swing.JFrame;

@SuppressWarnings("serial")
public class AdapterDesign extends JFrame {

	public AdapterDesign() {
		super("XxxAdapter class를 사용한 윈도우 이벤트 처리");

		// 이벤트에 등록
		AdapterEvent ae = new AdapterEvent(this); //has a
		addWindowListener(ae);

		setSize(800, 800);
		setVisible(true);

	}// AdapterDesign

	public static void main(String[] args) {
		new AdapterDesign();
	}// main

}// class
