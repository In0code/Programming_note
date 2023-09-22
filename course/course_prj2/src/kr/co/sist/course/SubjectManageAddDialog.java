package kr.co.sist.course;

import java.awt.Color;
import java.awt.Container;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class SubjectManageAddDialog extends JDialog {
	
	private SubjectManageDialog smd;
	private DefaultComboBoxModel<String>dcbmDept;
	private JComboBox<String>jcbDept;
	private DefaultComboBoxModel<String>dcbmMajor;
	private JComboBox<String>jcbMajor;
	private DefaultComboBoxModel<String>dcbmProf;
	private JComboBox<String>jcbProf;
	private DefaultComboBoxModel<String>dcbmDiv;
	private JComboBox<String>jcbDiv;
	private JTextField jtfLec;
	private JTextField jtfGrade;
	private JButton jbtnAdd;
	
	//과목 등록 창
	public SubjectManageAddDialog(SubjectManageDialog smd) {
		super(smd, "과목등록", true);
		this.smd=smd;
		
		//라벨
		JLabel jlblTitle = new JLabel("과목 등록");
		JLabel jlblDept = new JLabel("학부");
		JLabel jlblMajor = new JLabel("학과명");
		JLabel jlblLec = new JLabel("강의명");
		JLabel jlblProf = new JLabel("교수명");
		JLabel jlblGrade = new JLabel("학점");
		JLabel jlblDiv = new JLabel("이수 구분");
		
		//텍스트필드
		jtfLec = new JTextField();
		jtfGrade = new JTextField();
		
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
		dcbmDiv = new DefaultComboBoxModel<String>();
		jcbDiv = new JComboBox<String>(dcbmDiv);
		
		//버튼
		jbtnAdd = new JButton("등록");
		
		dcbmDept.addElement("컴퓨터공학부");
		dcbmDept.addElement("인문사회부");
		dcbmDept.addElement("연극학부");
		dcbmDept.addElement("건축학부");
		dcbmDept.addElement("체육학부");
		
		dcbmMajor.addElement("컴퓨터과학과");
		dcbmMajor.addElement("국어국문학과");
		dcbmMajor.addElement("연극영화과");
		dcbmMajor.addElement("건축공학과");
		dcbmMajor.addElement("사회체육학과");
		
		dcbmProf.addElement("김교수");
		dcbmProf.addElement("강엘린");
		dcbmProf.addElement("장석원");
		dcbmProf.addElement("정우성");
		
		dcbmDiv.addElement("전필");
		dcbmDiv.addElement("전선");
		dcbmDiv.addElement("교양");
		
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
        jlblLec.setBounds(148, 190, 60, 30);
        jlblProf.setBounds(148, 240, 80, 30);
        jlblGrade.setBounds(148, 290, 100, 30);
        jlblDiv.setBounds(148, 340, 80, 30);
        
        
        
	}
	
	
	
	
	

}// class
