package day0712;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

//1. Window Component 상속, 이벤트를 처리할 Listener 구현
@SuppressWarnings("serial")
public class HasADesign extends JFrame {

	public HasADesign() {
		super("안녕? 스윙스~");

		// 2. 컴포넌트 생성
		JButton jbtn = new JButton("has a 이벤트 헬로 스윙스!");

		// 3. 이벤트 등록
		HasAEvent hae = new HasAEvent(this); // 다지인 클래스와 이벤트 클래스가 has a 관계
		jbtn.addActionListener(hae); // 이벤트를 등록하고 처리될 객체를 설정
		
		// 3. 배치 -Layout Manager 사용
		add(jbtn);

		// 4. 윈도우 크기 설정
		setSize(300, 250);

		// 5. 사용자에게 보여주기
		setVisible(true);

		// 6. 윈도우 종료처리
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// HelloSwing

//	//2. 이벤트를 처리할 수 있는 abstract method를 Override
//	@Override
//	public void actionPerformed(ActionEvent e) {
//		//3. 이벤트 처리코드를 기술
//		JOptionPane.showMessageDialog(this, "안녕하세요? 이벤트입니다");
//		
//	}//actionPerformed

	public static void main(String[] args) {
		new HasADesign();

	}// main

}// class
