package day0712;

import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class UseJList extends JFrame {

	public UseJList() {
		super("MVC Pattern이 도입된 클래스");

		// 1. Model 생성
		DefaultListModel<String> dlmLunch = new DefaultListModel<String>();
		// 2. View 생성 - Model과 has a
		JList<String> jlLunch = new JList<String>(dlmLunch);
		// 3. 값 사용
		// 값추가 ->  Model 사용
		dlmLunch.addElement("오징어볶음");
		dlmLunch.addElement("오징어젓갈");
		dlmLunch.addElement("김치");
		dlmLunch.addElement("김자반");
		dlmLunch.addElement("도넛");
		dlmLunch.addElement("요구르트");

		// 지정한 index 값 삭제
		dlmLunch.removeElementAt(2);
		
		// JList는 Scrollbar가 없음
		JScrollPane jspCenter = new JScrollPane(jlLunch);
		jspCenter.setBorder(new TitledBorder("점심메뉴"));


		add("Center", jspCenter);

		setSize(300, 300);
		setVisible(true);
		
		//값얻기
		JOptionPane.showMessageDialog(this, dlmLunch.getElementAt(0));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// UseJList

	public static void main(String[] args) {
		new UseJList();
	}// main

}// class