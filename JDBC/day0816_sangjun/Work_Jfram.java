package day0816_sangjun;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class Work_Jfram extends JFrame {
	private JButton jbtnInsert; 
	private JButton jbtnSelect; 
	private JTextField jtfName;
	private JComboBox<Integer> jcbImg;
	private JTextField jtfAge;
	private JTextField jtfNum;
	private JLabel jlblDefaultImg;
	private String fileLocation;
	
	public Work_Jfram() {
		super("만드세요");
		JLabel jlblName = new JLabel("이름");
		JLabel jlblImg = new JLabel("이미지");
		JLabel jlblAge = new JLabel("나이");
		JLabel jlblNum = new JLabel("번호");
		fileLocation = "E:/dev/workspace/jdbc_prj/src/kr/co/sist/work/img/";
		ImageIcon def = new ImageIcon(fileLocation+"defualt.png");
		jlblDefaultImg = new JLabel(def);
		
		jtfName = new JTextField();
		
		jcbImg = new JComboBox<Integer>();
		jcbImg.addItem(1);
		jcbImg.addItem(2);
		jcbImg.addItem(3);
		jcbImg.addItem(4);
		
		jtfNum = new JTextField();
		
		jtfAge = new JTextField();
		
		jbtnInsert = new JButton("정보추가");
		jbtnSelect = new JButton("정보검색");
		
		setLayout(null);
		
		
		add(jlblName);
		add(jlblImg );
		add(jlblAge );
		add(jlblNum );
		add(jlblDefaultImg);
		add(jtfName);
		add(jcbImg);
		add(jtfNum);
		add(jtfAge);
		add(jbtnInsert);
		add(jbtnSelect);
		
		jlblName.setBounds(30,30,200,30);
		jtfName.setBounds(80,30,150,30);
		
		jlblImg.setBounds(30,75,200,30);
		jcbImg.setBounds(80,75,150,30);
		
		jlblAge.setBounds(30,120,200,30);
		jtfAge.setBounds(80,120,150,30);
		
		jlblNum.setBounds(30,165,200,30);
		jtfNum.setBounds(80,165,150,30);
		
		jlblDefaultImg.setBounds(270,10,200,200);
		
		jbtnInsert.setBounds(40,200,100,30);
		jbtnSelect.setBounds(150,200,100,30);
		
		Work_event event = new Work_event(this);
		addWindowListener(event);
		jbtnInsert.addActionListener(event);
		jbtnSelect.addActionListener(event);
		jcbImg.addActionListener(event);
		
		setVisible(true);
		setBounds(500, 300, 500, 300);
	}//constructor
	
	
	
	public JButton getJbtnInsert() {
		return jbtnInsert;
	}



	public JButton getJbtnSelect() {
		return jbtnSelect;
	}



	public JTextField getJtfName() {
		return jtfName;
	}



	public JComboBox<Integer> getJcbImg() {
		return jcbImg;
	}



	public JTextField getJtfAge() {
		return jtfAge;
	}



	public JTextField getJtfNum() {
		return jtfNum;
	}



	public JLabel getJlblDefaultImg() {
		return jlblDefaultImg;
	}



	public String fileLocation() {
		return fileLocation;
	}



	public static void main(String[] args) {
		new Work_Jfram();
	}//main
}//class
