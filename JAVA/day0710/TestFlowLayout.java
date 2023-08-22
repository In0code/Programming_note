package day0710;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

/**
 * FlowLayout -Container Component의 기본 레이아웃<br>
 * -컴포넌트는 고유크기를 유지하고, add하는 순서대로<br>
 * 왼쪽에서 오른쪽으로 순서대로 배치된다<br>
 * -윈도우의 크기가 늘어나거나 줄어들면 컴포넌트가 위치가 변경된다.
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
//1. Window Component 상속
public class TestFlowLayout extends JFrame {

	public TestFlowLayout() {
		super("FlowLayout 연습");

		// 2. 컴포넌트 생성
		JLabel jlblName = new JLabel("이름");
		JTextField jtfName = new JTextField(10); // 10이 별 의미가 없음
		JCheckBox jcbSave = new JCheckBox("이름을 저장");
		JButton jbtnInput = new JButton("입력");

		// 3. 배치관리자 설정 및 생성 : BorderLayout => FlowLayout
		setLayout(new FlowLayout());
		// 이거를 빼면 BorderLayout이 됨. 고유크기를 무시함.
		// JButton밖에 안보임. 내가 볼때는

		// 4. 배치
		add(jlblName);
		add(jtfName);
		add(jcbSave);
		add(jbtnInput);

		// 5. 윈도우 크기설정
		setSize(500, 200);
		// 6. 가시화
		setVisible(true);
		// 7. 종료처리
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// TestFlowLayout

	public static void main(String[] args) {
		new TestFlowLayout();

	}// main

}// class
