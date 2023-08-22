package day0710;

import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

@SuppressWarnings("serial")
public class TestNumberBtn extends JFrame {

	public TestNumberBtn() {
		super("번호를 눌러보세요");
		String[] numArr = "1,2,3,4,5,6,7,8,9,*,0,#".split(",");

		setLayout(new GridLayout(4, 3));

		JButton[] jbtnNumPad = new JButton[numArr.length];

		for (int i = 0; i < numArr.length; i++) {
			jbtnNumPad[i] = new JButton(numArr[i]);
			add(jbtnNumPad[i]);

		} // end if

		setSize(300, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// TestNumberBtn

	public static void main(String[] args) {
		new TestNumberBtn();
	}// main

}// class
