package day0711;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 * Hungarian Nortation<br>
 * 컴포넌트의 종류 + 하는일의 형식으로 이름을 부여할 수 있다.<br>
 * ex) <br>
 * jbtnInput<br>
 * intAge<br>
 * StringName<br>
 * <br>
 * 여러 개의 Layout을 복합하여 사용 <br>
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
//1. Window Component를 상속
public class ComplexLayout extends JFrame {

	public ComplexLayout() {
		super("여러 레이아웃의 사용");

		// 2. Component 생성
		JLabel jlblName = new JLabel("이름");
		JTextField jtfName = new JTextField(14);
		JComboBox<String> jcbClass = new JComboBox<String>();
		jcbClass.addItem("A클래스");
		jcbClass.addItem("B클래스");
		jcbClass.addItem("C클래스");
		jcbClass.addItem("D클래스");
		JButton jbtnAdd = new JButton("입력");
		JTextArea jtaNameDisp = new JTextArea();

		// 3. 배치
		// 패널에 배치
		JPanel jpNorth = new JPanel(); // FlowLayout 기본 설정
//		jpNorth.setLayout(new FlowLayout());
		jpNorth.add(jlblName); // 이름은 컴포넌트의 종류와 하는 일
		jpNorth.add(jtfName); // 헝가리안 네이밍 이라고 한다.
		jpNorth.add(jcbClass);
		jpNorth.add(jbtnAdd);
		// Frame에 배치
		add("North",jpNorth);
		add("Center",jtaNameDisp);
		
		// 4. 윈도우 크기 설정
		setSize(450, 400);
		// 5. 가시화
		setVisible(true);
		// 6. 종료처리
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}// ComplexLayout
	
	public static void main(String[] args) {
		new ComplexLayout();
	}// main

}// class
