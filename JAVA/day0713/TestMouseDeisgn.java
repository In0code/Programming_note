package day0713;

import java.awt.TextArea;

import javax.swing.JFrame;
import javax.swing.JTextArea;

@SuppressWarnings("serial")
public class TestMouseDeisgn extends JFrame {

	private JTextArea jta;

	public TestMouseDeisgn() {
		super("마우스 이벤트");

		jta = new JTextArea();

		add(jta); // BorderLayout은 컴포넌트를 배치하는 위치를 설정하지 않으면 Center에 배치

		TestMouseEvent tme = new TestMouseEvent(this);
		jta.addMouseListener(tme);

		setSize(500, 500);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// TestMouseDeisgn

	public JTextArea getJta() {
		return jta;
	}

	public static void main(String[] args) {
		new TestMouseDeisgn();
	}// main

}// class
