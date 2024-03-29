package day0710;

import java.awt.BorderLayout;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;

/**
 * BorderLayout<br>
 * -Window Component의 기본 레이아웃<br>
 * -East, West, North, South, Center로 구성되고,<br>
 * 각영역에는 하나의 컴포넌트만 배치된다.<br>
 * setLayout(new BorderLayout()); 코드로 Layout을 적용한다
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
//1. Window Component를 상속
public class TestBorderLayout extends JFrame {

	public TestBorderLayout() {
		super("BorderLayout 연습");

		// 2. 컴포넌트 생성
		// Label은 정보 전달을 하기 위한 이름표 컴포넌트
		JLabel jlblWest = new JLabel("서쪽");
		JLabel jlblEast = new JLabel("JLable 동쪽");

		// Button은 클랙했을 때 동작을 하기 위한 컴포넌트임
		JButton jbtnNorth = new JButton("북쪽");
		JButton jbtnSouth = new JButton("남쪽");
		// 여러줄의 문자열을 입력받기 위한 컴포넌트
		JTextArea jtaCenter = new JTextArea("가운데");
		
		
		
		// 3. 배치관리자 설정 : borderLayout => BorderLayout
		setLayout(new BorderLayout()); // 이건 딱히 의미있는 짓이 아니였음
		// 주석으로 날려도 상관없음. BorderLayout을 BorderLayout으로 바꾸는 짓

		// 4. 위치를 설정하여 배치 (BorderLayout인 경우에는 생략가능)
		// String
		add("North", jbtnNorth);
		add("East", jlblEast);
		// Constant
		add(jtaCenter, BorderLayout.CENTER);
		add(jlblWest, BorderLayout.WEST);
		add(BorderLayout.SOUTH, jbtnSouth);

		// 5. 윈도우 크기 설정
		setSize(500, 500);
		// 6. 사용자에게 보여주기
		setVisible(true);
		// 7. 윈도우 종료처리
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}// TestBorderLayout

	public static void main(String[] args) {
		new TestBorderLayout();

	}// main

}// class
