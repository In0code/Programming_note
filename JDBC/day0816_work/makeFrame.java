package day0816_work;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

@SuppressWarnings("serial")
public class makeFrame extends JFrame {
	JButton jbtnInsert;
	JButton jbtnSelect;
	JTextField jtfName;
	JComboBox<Integer> jtfImg;
	JTextField jtfAge;
	JTextField jtfNum;
	JLabel jlblName;
	JLabel jlblImg;
	JLabel jlblAge;
	JLabel jlblNum;
	ImageIcon iiDefault;
	ImageIcon iiOne;
	ImageIcon iiTwo;
	ImageIcon iiThree;
	ImageIcon iiFour;
	JLabel jlblInputImg;

	public makeFrame() {

		jtfName = new JTextField();
		jtfImg = new JComboBox<Integer>();
		jtfImg.addItem(1);
		jtfImg.addItem(2);
		jtfImg.addItem(3);
		jtfImg.addItem(4);
		jtfAge = new JTextField();
		jtfNum = new JTextField();
		jlblName = new JLabel("이름");
		jlblImg = new JLabel("이미지");
		jlblAge = new JLabel("나이");
		jlblNum = new JLabel("번호");
		jbtnInsert = new JButton("정보추가");
		jbtnSelect = new JButton("정보검색");
		iiDefault = new ImageIcon("E:/dev/workspace/jdbc_prj/src/kr/co/sist/work/img/defualt.png");
		iiOne = new ImageIcon("E:/dev/workspace/jdbc_prj/src/kr/co/sist/work/img/img1.png");
		iiTwo = new ImageIcon("E:/dev/workspace/jdbc_prj/src/kr/co/sist/work/img/img2.png");
		iiThree = new ImageIcon("E:/dev/workspace/jdbc_prj/src/kr/co/sist/work/img/img3.png");
		iiFour = new ImageIcon("E:/dev/workspace/jdbc_prj/src/kr/co/sist/work/img/img4.png");
		jlblInputImg = new JLabel(iiDefault);

		workEvent we = new workEvent(this);
		jbtnInsert.addActionListener(we);
		jbtnSelect.addActionListener(we);

		setLayout(null);

		jbtnInsert.setBackground(Color.pink);
		jbtnSelect.setBackground(Color.pink);
		jtfAge.setBorder(new LineBorder(Color.pink));
		jtfNum.setBorder(new LineBorder(Color.pink));
		jtfImg.setBorder(new LineBorder(Color.pink));
		jtfName.setBorder(new LineBorder(Color.pink));

		jlblName.setBounds(10, 10, 90, 90);
		jlblImg.setBounds(10, 70, 90, 90);
		jlblAge.setBounds(10, 130, 90, 90);
		jlblNum.setBounds(10, 190, 90, 90);
		jtfName.setBounds(100, 35, 190, 40);
		jtfImg.setBounds(100, 95, 190, 40);
		jtfAge.setBounds(100, 155, 190, 40);
		jtfNum.setBounds(100, 215, 190, 40);
		jbtnInsert.setBounds(100, 280, 90, 36);
		jbtnSelect.setBounds(200, 280, 90, 36);
		jlblInputImg.setBounds(350, 50, 170, 190);
		getContentPane().setBackground(Color.green);

		add(jlblName);
		add(jlblImg);
		add(jlblAge);
		add(jlblNum);
		add(jtfName);
		add(jtfImg);
		add(jtfAge);
		add(jtfNum);
		add(jbtnInsert);
		add(jbtnSelect);
		add(jlblInputImg);

		Font fort = new Font("Serif", Font.BOLD, 18);
		jlblName.setFont(fort);
		jlblImg.setFont(fort);
		jlblAge.setFont(fort);
		jlblNum.setFont(fort);

		setBounds(500, 500, 550, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// makeFrame

	public JButton getJbtnInsert() {
		return jbtnInsert;
	}

	public void setJbtnInsert(JButton jbtnInsert) {
		this.jbtnInsert = jbtnInsert;
	}

	public JButton getJbtnSelect() {
		return jbtnSelect;
	}

	public void setJbtnSelect(JButton jbtnSelect) {
		this.jbtnSelect = jbtnSelect;
	}

	public JTextField getJtfName() {
		return jtfName;
	}

	public void setJtfName(JTextField jtfName) {
		this.jtfName = jtfName;
	}

	public JComboBox<Integer> getJtfImg() {
		return jtfImg;
	}

	public void setJtfImg(JComboBox<Integer> jtfImg) {
		this.jtfImg = jtfImg;
	}

	public JTextField getJtfAge() {
		return jtfAge;
	}

	public void setJtfAge(JTextField jtfAge) {
		this.jtfAge = jtfAge;
	}

	public JTextField getJtfNum() {
		return jtfNum;
	}

	public void setJtfNum(JTextField jtfNum) {
		this.jtfNum = jtfNum;
	}

	public JLabel getJlblName() {
		return jlblName;
	}

	public void setJlblName(JLabel jlblName) {
		this.jlblName = jlblName;
	}

	public JLabel getJlblImg() {
		return jlblImg;
	}

	public void setJlblImg(JLabel jlblImg) {
		this.jlblImg = jlblImg;
	}

	public JLabel getJlblAge() {
		return jlblAge;
	}

	public void setJlblAge(JLabel jlblAge) {
		this.jlblAge = jlblAge;
	}

	public JLabel getJlblNum() {
		return jlblNum;
	}

	public void setJlblNum(JLabel jlblNum) {
		this.jlblNum = jlblNum;
	}

	public ImageIcon getIiDefault() {
		return iiDefault;
	}

	public void setIiDefault(ImageIcon iiDefault) {
		this.iiDefault = iiDefault;
	}

	public ImageIcon getIiOne() {
		return iiOne;
	}

	public void setIiOne(ImageIcon iiOne) {
		this.iiOne = iiOne;
	}

	public ImageIcon getIiTwo() {
		return iiTwo;
	}

	public void setIiTwo(ImageIcon iiTwo) {
		this.iiTwo = iiTwo;
	}

	public ImageIcon getIiThree() {
		return iiThree;
	}

	public void setIiThree(ImageIcon iiThree) {
		this.iiThree = iiThree;
	}

	public ImageIcon getIiFour() {
		return iiFour;
	}

	public void setIiFour(ImageIcon iiFour) {
		this.iiFour = iiFour;
	}

	public JLabel getJlblInputImg() {
		return jlblInputImg;
	}

	public void setJlblInputImg(JLabel jlblInputImg) {
		this.jlblInputImg = jlblInputImg;
	}

	public static void main(String[] args) {
		new makeFrame();

	}

}// class
