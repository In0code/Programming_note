package kr.co.sist.course;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class SubjectAddManageDialog extends JDialog {
	
	private SubjectManageDialog smd;
	private DefaultComboBoxModel<String>dcbmDept;
	private JComboBox<String>jcbDept;
	private DefaultComboBoxModel<String>dcbmMajor;
	private JComboBox<String>jcbMajor;
	private DefaultComboBoxModel<String>dcbmProf;
	private JComboBox<String>jcbProf;
	private DefaultComboBoxModel<String>dcbmSubType;
	private JComboBox<String>jcbSubType;
	private JTextField jtfLecture;
	private JTextField jtfCredit;
	private JButton jbtnAdd;
	
	
	//과목 등록 창
	public SubjectAddManageDialog(SubjectManageDialog smd) {
		super(smd, "과목등록", true);
		this.smd=smd;
		
		//라벨
		JLabel jlblTitle = new JLabel("과목 등록");
		JLabel jlblDept = new JLabel("학부");
		JLabel jlblMajor = new JLabel("학과명");
		JLabel jlblLecture = new JLabel("강의명");
		JLabel jlblProf = new JLabel("교수명");
		JLabel jlblCredit = new JLabel("학점");
		JLabel jlblSubType = new JLabel("이수 구분");
		
		//텍스트필드 
		jtfLecture = new JTextField();
		jtfCredit = new JTextField();
		
		//콤보박스
		//학부
		dcbmDept = new DefaultComboBoxModel<String>();
		jcbDept = new JComboBox<String>(dcbmDept);
		//학과
		dcbmMajor = new DefaultComboBoxModel<String>();
		jcbMajor = new JComboBox<String>(dcbmMajor);
		//교수명
		dcbmProf = new DefaultComboBoxModel<String>();
		jcbProf = new JComboBox<String>(dcbmProf);
		//이수구분
		dcbmSubType = new DefaultComboBoxModel<String>();
		jcbSubType = new JComboBox<String>(dcbmSubType);
		
		//버튼
		jbtnAdd = new JButton("등록"); //("수정")
		
		//배경색
		Color backgroundColor = Color.decode("#FCF7F5");
		
		// getContentPane() 메서드를 사용하여 배경색 설정
        Container contentPane = getContentPane();
        contentPane.setBackground(backgroundColor);
        
        setLayout(null);

        //Bounds
   		// 라벨
        jlblTitle.setBounds(20, 10, 210, 50);
        jlblDept.setBounds(148, 90, 100, 30);
        jlblMajor.setBounds(148, 140, 140, 30);
        jlblLecture.setBounds(148, 190, 60, 30);
        jlblProf.setBounds(148, 240, 80, 30);
        jlblCredit.setBounds(148, 290, 100, 30);
        jlblSubType.setBounds(148, 340, 80, 30); 
        
        //콤보박스
        jcbDept.setBounds(260, 90, 150, 30);
        jcbMajor.setBounds(260, 140, 140, 30);
        jcbProf.setBounds(260, 240, 150, 30);
        jcbSubType.setBounds(260, 340, 140, 30);
        
        //텍스트필드
        jtfLecture.setBounds(260, 190, 150, 30);
        jtfCredit.setBounds(260, 290, 140, 30);
        
        //버튼
        jbtnAdd.setBounds(274, 414, 80, 30);
        
        //버튼색
        jbtnAdd.setBackground(new Color(0xE0E0E0));
        
        //글꼴
   		Font font = new Font("Pretendard", Font.BOLD, 19);
   		jlblTitle.setFont(new Font("Pretendard", Font.BOLD, 22));
   		jlblDept.setFont(font);
   		jlblMajor.setFont(font);
   		jlblLecture.setFont(font);
   		jlblProf.setFont(font);
   		jlblCredit.setFont(font);
   		jlblSubType.setFont(font);
   		jbtnAdd.setFont(new Font("Pretendard", Font.BOLD, 14));
   		jcbDept.setFont(new Font("Pretendard", Font.BOLD, 14));
   		jcbMajor.setFont(new Font("Pretendard", Font.BOLD, 14));
        jcbProf.setFont(new Font("Pretendard", Font.BOLD, 14));
        jcbSubType.setFont(new Font("Pretendard", Font.BOLD, 14));
        
        //Event
        LectureAddManageEvt lemEvt = new LectureAddManageEvt(this);
        jcbDept.addActionListener(lemEvt);
        jcbMajor.addActionListener(lemEvt);
        jcbProf.addActionListener(lemEvt);
        jcbSubType.addActionListener(lemEvt);
        jbtnAdd.addActionListener(lemEvt);
   		
        //add
        add(jlblTitle);
        add(jlblDept);
        add(jlblMajor);
        add(jlblLecture);
        add(jlblProf);
        add(jlblCredit);
        add(jlblSubType);
        add(jcbDept);
        add(jcbMajor);
        add(jcbProf);
        add(jcbSubType);
        add(jtfLecture);
        add(jtfCredit);
        add(jbtnAdd);
        
        setBounds(550, 180, 700, 500);
        setVisible(true);
        setResizable(false);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
	}//SubjectManageAddDialog
	
	public SubjectManageDialog getSmd() {
		return smd;
	}

	public DefaultComboBoxModel<String> getDcbmDept() {
		return dcbmDept;
	}

	public JComboBox<String> getJcbDept() {
		return jcbDept;
	}

	public DefaultComboBoxModel<String> getDcbmMajor() {
		return dcbmMajor;
	}

	public JComboBox<String> getJcbMajor() {
		return jcbMajor;
	}

	public DefaultComboBoxModel<String> getDcbmProf() {
		return dcbmProf;
	}

	public JComboBox<String> getJcbProf() {
		return jcbProf;
	}

	public DefaultComboBoxModel<String> getDcbmSubType() {
		return dcbmSubType;
	}

	public JComboBox<String> getJcbSubType() {
		return jcbSubType;
	}

	public JTextField getJtfLecture() {
		return jtfLecture;
	}

	public JTextField getJtfCredit() {
		return jtfCredit;
	}

	public JButton getJbtnAdd() {
		return jbtnAdd;
	}

	
}// class
