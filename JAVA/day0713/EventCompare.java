package day0713;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

@SuppressWarnings("serial")
public class EventCompare extends JFrame implements ActionListener {
	private JButton jbtn1;
	private JButton jbtn2;

	public EventCompare() {
		super("이벤트 비교");
		jbtn1 = new JButton("버튼 1");
		jbtn2 = new JButton("버튼 2");

		setLayout(new GridLayout(2, 1));

		add(jbtn1);
		add(jbtn2);

		// 컴포너트를 이벤트에 등록
		jbtn1.addActionListener(this);
		jbtn2.addActionListener(this);

		setBounds(100, 100, 250, 200);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// EventCompare

	@Override
	public void actionPerformed(ActionEvent ae) {

		System.out.println(ae.getSource());
		// 이벤트 비교
		// 버튼 1이 눌렸을 때는 콘솔에 "안녕"을 출력
//		if (ae.getActionCommand().equals("버튼 1")) { //ActionEvent만 사용가능
		if (ae.getSource() == jbtn1) { // ActionEvent만 사용가능
			System.out.println("안녕");
		} // end if

//		if (ae.getActionCommand().equals("버튼 2")) {
		if (ae.getSource() == jbtn2) {
			JOptionPane.showMessageDialog(this, "오늘은 비오는 목요일");
		} // end if

		// 버튼2가 눌렸을 때는 MessageDialog로 "오늘은 목요일"을 출력

	}// actionPerformed

	public static void main(String[] args) {
		new EventCompare();
	}// main

}// class
