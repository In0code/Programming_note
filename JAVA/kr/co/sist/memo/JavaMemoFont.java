package kr.co.sist.memo;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class JavaMemoFont extends JDialog {
	private DefaultListModel<String> dlmFont;
	private DefaultListModel<String> dlmStyle;
	private DefaultListModel<String> dlmSize;

	private JList<String> JFont;
	private JList<String> JStyle;
	private JList<String> JSize;

	private JScrollPane jspFont;
	private JScrollPane jspStyle;
	private JScrollPane jspSize;

	private JLabel jlbFont;
	private JLabel jlbStyle;
	private JLabel jlbSize;
	private JLabel jlbPreview;

	private JTextField jtfFont;
	private JTextField jtfStyle;
	private JTextField jtfSize;

	private JButton jbtnOk;
	private JButton jbtnCancle;

	private JavaMemo jm;

	public JavaMemoFont(JavaMemo jm) {
		super(jm, "글꼴", true);
		this.jm = jm;
		// 모듈
		dlmFont = new DefaultListModel<String>();
		dlmStyle = new DefaultListModel<String>();
		dlmSize = new DefaultListModel<String>();

		// 리스트
		JFont = new JList<String>(dlmFont);
		JStyle = new JList<String>(dlmStyle);
		JSize = new JList<String>(dlmSize);

		// 리스트 스크롤
		jspFont = new JScrollPane(JFont);
		jspStyle = new JScrollPane(JStyle);
		jspSize = new JScrollPane(JSize);

		// 라벨
		jlbFont = new JLabel("글꼴(F):");
		jlbStyle = new JLabel("글꼴 스타일(Y):");
		jlbSize = new JLabel("크기(S):");
		jlbPreview = new JLabel("AaBbYyZz");

		// 텍스트 필드
		jtfFont = new JTextField();
		jtfStyle = new JTextField();
		jtfSize = new JTextField();

		// 확인 취소버튼
		jbtnOk = new JButton("확인");
		jbtnCancle = new JButton("취소");

		// Preview 타이틀보더, 가운데 정렬
		jlbPreview.setBorder(new TitledBorder("보기"));
		jlbPreview.setHorizontalAlignment(SwingConstants.CENTER);

		setLayout(null);

		// 라벨 추가
		add(jlbFont);
		add(jlbStyle);
		add(jlbSize);
		add(jlbPreview);

		// 텍스트필드 추가
		add(jtfFont);
		add(jtfStyle);
		add(jtfSize);

		// JList추가
		add(jspFont);
		add(jspStyle);
		add(jspSize);

		// 버튼 추가
		add(jbtnOk);
		add(jbtnCancle);

		// 라벨 위치,크기설정
		jlbFont.setBounds(10, 15, 170, 15);
		jlbStyle.setBounds(200, 15, 140, 15);
		jlbSize.setBounds(350, 15, 70, 15);
		jlbPreview.setBounds(200, 200, 220, 80);

		// 텍스트필드 위치, 크기설정
		jtfFont.setBounds(10, 30, 170, 20);
		jtfStyle.setBounds(200, 30, 140, 20);
		jtfSize.setBounds(350, 30, 70, 20);

		// JList 위치, 크기설정
		jspFont.setBounds(10, 50, 170, 120);
		jspStyle.setBounds(200, 50, 140, 120);
		jspSize.setBounds(350, 50, 70, 120);

		// JButton 위치, 크기설정
		jbtnOk.setBounds(200, 440, 100, 30);
		jbtnCancle.setBounds(310, 440, 100, 30);

		// FontEvt 이벤트 등록
		JavaMemoFontEvt jmfe = new JavaMemoFontEvt(this, jm);
		JFont.addListSelectionListener(jmfe);
		JStyle.addListSelectionListener(jmfe);
		JSize.addListSelectionListener(jmfe);
		jbtnOk.addActionListener(jmfe);
		jbtnCancle.addActionListener(jmfe);

		setBounds(jm.getX() + 100, jm.getY() + 100, 450, 520);
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

	}

	public DefaultListModel<String> getDlmFont() {
		return dlmFont;
	}

	public DefaultListModel<String> getDlmStyle() {
		return dlmStyle;
	}

	public DefaultListModel<String> getDlmSize() {
		return dlmSize;
	}

	public JScrollPane getJspFont() {
		return jspFont;
	}

	public JScrollPane getJspStyle() {
		return jspStyle;
	}

	public JScrollPane getJspSize() {
		return jspSize;
	}

	public JButton getJbtnOk() {
		return jbtnOk;
	}

	public JButton getJbtnCancle() {
		return jbtnCancle;
	}

	public JList<String> getJFont() {
		return JFont;
	}

	public JList<String> getJStyle() {
		return JStyle;
	}

	public JList<String> getJSize() {
		return JSize;
	}

	public JLabel getJlbFont() {
		return jlbFont;
	}

	public JLabel getJlbStyle() {
		return jlbStyle;
	}

	public JLabel getJlbSize() {
		return jlbSize;
	}

	public JLabel getJlbPreview() {
		return jlbPreview;
	}

	public JTextField getJtfFont() {
		return jtfFont;
	}

	public JTextField getJtfStyle() {
		return jtfStyle;
	}

	public JTextField getJtfSize() {
		return jtfSize;
	}

	public JavaMemo getJm() {
		return jm;
	}

}
