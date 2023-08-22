package kr.co.sist.memo;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

@SuppressWarnings("serial")
public class JavaMemo extends JFrame {

	private JTextArea jta;
	private JMenuItem jmiNew;
	private JMenuItem jmiOpen;
	private JMenuItem jmiSave;
	private JMenuItem jmiNewSave;
	private JMenuItem jmiClose;
	private JMenuItem jmiWrap;
	private JMenuItem jmiFont;
	private JMenuItem jmiHelp;
	private JScrollPane jspText;

	public JavaMemo() {
		super("메모장");

		// 메뉴
		JMenu jmFile = new JMenu("파일");

		jmiNew = new JMenuItem("새글");
		jmiOpen = new JMenuItem("열기");
		jmiSave = new JMenuItem("저장");
		jmiNewSave = new JMenuItem("다른이름으로저장");
		jmiClose = new JMenuItem("닫기");

		jmFile.add(jmiNew);
		jmFile.addSeparator();
		jmFile.add(jmiOpen);
		jmFile.add(jmiSave);
		jmFile.add(jmiNewSave);
		jmFile.addSeparator();
		jmFile.add(jmiClose);

		// 서식
		JMenu jmForm = new JMenu("서식");
		jmiWrap = new JMenuItem("자동 줄 바꿈");
		jmiFont = new JMenuItem("글꼴");
		jmForm.add(jmiWrap);
		jmForm.add(jmiFont);

		// 도움말
		JMenu jmHelp = new JMenu("도움말");
		jmiHelp = new JMenuItem("메모장정보");
		jmHelp.add(jmiHelp);

		// 메뉴바
		JMenuBar jmbText = new JMenuBar();
		jmbText.add(jmFile);
		jmbText.add(jmForm);
		jmbText.add(jmHelp);

		// TextArea
		jta = new JTextArea();
		jspText = new JScrollPane(jta);

		// 이벤트 생성
		JavaMemoEvn jme = new JavaMemoEvn(this);
		jmiNew.addActionListener(jme);
		jmiOpen.addActionListener(jme);
		jmiSave.addActionListener(jme);
		jmiNewSave.addActionListener(jme);
		jmiClose.addActionListener(jme);
		jmiWrap.addActionListener(jme);
		jmiFont.addActionListener(jme);
		jmiHelp.addActionListener(jme);

		addWindowListener(jme);

		// 추가
		setJMenuBar(jmbText);
		add("Center", jspText);

		setBounds(300, 100, 1000, 800);
		setVisible(true);

	}

	public JScrollPane getJspText() {
		return jspText;
	}

	public JTextArea getJta() {
		return jta;
	}

	public JMenuItem getJmiNew() {
		return jmiNew;
	}

	public JMenuItem getJmiWrap() {
		return jmiWrap;
	}

	public JMenuItem getJmiOpen() {
		return jmiOpen;
	}

	public JMenuItem getJmiSave() {
		return jmiSave;
	}

	public JMenuItem getJmiNewSave() {
		return jmiNewSave;
	}

	public JMenuItem getJmiClose() {
		return jmiClose;
	}

	public JMenuItem getJmiFont() {
		return jmiFont;
	}

	public JMenuItem getJmiHelp() {
		return jmiHelp;
	}

}
