package day0711;

import java.awt.MenuBar;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

@SuppressWarnings("serial")
public class TestJMenu extends JFrame {

	public TestJMenu() {
		super("메뉴바 연습");

		// 1. 메뉴바 생성
		JMenuBar jmb = new JMenuBar();

		// 2. 메뉴 생성
		JMenu jm = new JMenu("ㄱ씨");
		JMenu jm2 = new JMenu("ㅂ씨");
		JMenu jm3 = new JMenu("ㅅ씨");

		// 3. 메뉴아이템 생성
		JMenuItem jmi = new JMenuItem("강다연"); // ㄱ씨에 추가
		JMenuItem jmi2 = new JMenuItem("김다영"); // ㄱ씨에 추가
		JMenuItem jmi3 = new JMenuItem("김선경"); // ㄱ씨에 추가
		JMenuItem jmi4 = new JMenuItem("김인영"); // ㄱ씨에 추가
		JMenuItem jmi5 = new JMenuItem("김주민"); // ㄱ씨에 추가

		JMenuItem jmi6 = new JMenuItem("박상준"); // ㅂ씨에 추가
		JMenuItem jmi7 = new JMenuItem("박서현"); // ㅂ씨에 추가

		JMenuItem jmi8 = new JMenuItem("서효민"); // ㅅ씨에 추가
		JMenuItem jmi9 = new JMenuItem("송지하"); // ㅅ씨에 추가

		// 4. 메뉴아이템을 메뉴에 배치
		jm.add(jmi);
		jm.add(jmi2);
		jm.addSeparator(); // 구분선
		jm.add(jmi3);
		jm.addSeparator();
		jm.add(jmi4);
		jm.addSeparator();
		jm.add(jmi5); // ㄱ씨 추가

		jm2.add(jmi6);
		jm2.add(jmi7); // ㅂ씨 추가

		jm3.add(jmi8);
		jm3.add(jmi8); // ㅅ씨 추가

		// 5. 메뉴를 메뉴아이템 배치
		jmb.add(jm);
		jmb.add(jm2);
		jmb.add(jm3);

		// 6. 메뉴바를 Frame에 설정
		setJMenuBar(jmb);

		setSize(600, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// TestJMenu

	public static void main(String[] args) {
		new TestJMenu();
	}// main

}// class
