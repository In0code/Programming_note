package day0712;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

//1. Window Component 상속, 이벤트를 처리할 Listener 구현
@SuppressWarnings("serial")
public class HelloEvent extends JFrame implements ActionListener{

	public HelloEvent() {
		super("안녕? 스윙스~");

		// 2. 컴포넌트 생성
		JButton jbtn = new JButton("헬로 스윙스!");

		//3. 이벤트 등록
		jbtn.addActionListener(this);  //인터페이스의 Override된 method를 호출
		
		
		// 3. 배치  -Layout Manager 사용
		add(jbtn);

		// 4. 윈도우 크기 설정
		setSize(300, 250);

		// 5. 사용자에게 보여주기
		setVisible(true);

		// 6. 윈도우 종료처리
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// HelloSwing

	//2. 이벤트를 처리할 수 있는 abstract method를 Override
	@Override
	public void actionPerformed(ActionEvent e) {
		//3. 이벤트 처리코드를 기술
		JOptionPane.showMessageDialog(this, "안녕하세요? 이벤트입니다");
		
	}//actionPerformed
	
	
	public static void main(String[] args) {
		new HelloEvent();

	}// main


}// class
