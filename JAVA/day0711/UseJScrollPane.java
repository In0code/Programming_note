package day0711;

import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

@SuppressWarnings("serial")
public class UseJScrollPane extends JFrame {

	public UseJScrollPane() {
		super("JScrollPane 연습");

		JTextArea jta = new JTextArea();
		JTextArea jta2 = new JTextArea();
		JTextArea jta3 = new JTextArea();

		// Container Component인 JScrollPane 생성
		JScrollPane jsp = new JScrollPane(jta);
		JScrollPane jsp2 = new JScrollPane(jta3);
		// 입력문자열을 줄단위로 처리
		jta3.setLineWrap(true);
	// 입력 문자열에대해 단어로 보호( 단어를 인식하지는 않고 띄어쓰기를 단어로 인식)
		//한글은 안됨
//		jta3.setWrapStyleWord(true);

		setLayout(new GridLayout(1, 3));

		add(jsp);
		add(jta2);
//		add(jta3);  // 컴포넌트를 붙이면 스크롤바가 나오지 않는다.
		add(jsp2); // 컴포넌트가 아닌 스크롤바를 붙인다.

		setBounds(200, 100, 500, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// UseJScrollPane

	public static void main(String[] args) {
		new UseJScrollPane();
	}

}
