package kr.co.sist.menu;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

@SuppressWarnings("serial")
public class JavaMemo extends JFrame {

	public JavaMemo() {
		super("JavaMemo");

		JMenuBar jmb = new JMenuBar();

		JMenu jmFile = new JMenu("  파 일  ");
		JMenu jmHelp = new JMenu("도 움 말");

		JMenuItem jbiNewPost = new JMenuItem(" 새 글 ");
		JMenuItem jbiOpen = new JMenuItem(" 열 기 ");
		JMenuItem jbiSave = new JMenuItem(" 저 장 ");
		JMenuItem jbiEnd = new JMenuItem(" 종 료 ");

		JMenuItem jbiNoteInfor = new JMenuItem(" 메모장 정보 ");

		JTextArea jta = new JTextArea();
		JScrollPane jsp = new JScrollPane(jta);

		jmFile.add(jbiNewPost);
		jmFile.addSeparator();
		jmFile.add(jbiOpen);
		jmFile.add(jbiSave);
		jmFile.addSeparator();
		jmFile.add(jbiEnd);

		jmHelp.add(jbiNoteInfor);

		jmb.add(jmFile);
		jmb.add(jmHelp);

		add(jsp);
		setJMenuBar(jmb);
		
		jta.setLineWrap(true);
		jta.setWrapStyleWord(true);
		setBounds(500, 400, 420, 330);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// JavaMemo

}// class
