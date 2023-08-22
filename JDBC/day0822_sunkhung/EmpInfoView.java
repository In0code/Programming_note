package day0822_sunkhung;

import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class EmpInfoView extends JDialog{
	
	private JTextField jtfEmpno;
	private JTextField jtfEname;
	private JTextField jtfHiredate;
	private JTextField jtfJob;
	private JTextField jtfSal;
	
	public EmpInfoView(JFrame parent, EmpVO eVO) {
		
		super(parent,"사원 정보",true);
		
		JLabel jlblEmpno = new JLabel("사원번호");
		JLabel jlblEname = new JLabel("사원명");
		JLabel jlblHiredate = new JLabel("입사일");
		JLabel jlblJob = new JLabel("직무");
		JLabel jlblSal = new JLabel("연봉");
		
		jtfEmpno = new JTextField(15);
		jtfEname = new JTextField(15);
		jtfHiredate = new JTextField(15);
		jtfJob= new JTextField(15);
		jtfSal = new JTextField(15);
		
		setLayout(null);
		
		jlblEmpno.setBounds(30,60,50,20);
		jlblEname.setBounds(30,130,50,20);
		jlblHiredate.setBounds(30,200,50,20);
		jlblJob.setBounds(30,270,50,20);
		jlblSal.setBounds(30,340,50,20);
		
		jtfEmpno.setBounds(90,60,150,20);
		jtfEname.setBounds(90,130,150,20);
		jtfHiredate.setBounds(90,200,150,20);
		jtfJob.setBounds(90,270,150,20);
		jtfSal.setBounds(90,340,150,20);
		
		add(jlblEmpno);
		add(jlblEname);
		add(jlblHiredate);
		add(jlblJob);
		add(jlblSal);
		add(jtfEmpno);
		add(jtfEname);
		add(jtfHiredate);
		add(jtfJob);
		add(jtfSal);
		
		EmpInfoViewEvt eive=new EmpInfoViewEvt(this);
		eive.setEmpData(eVO);
		addWindowListener(eive);
		
		setSize(300,500);
		setVisible(true);
		
		
	}

	public JTextField getJtfEmpno() {
		return jtfEmpno;
	}

	public JTextField getJtfEname() {
		return jtfEname;
	}

	public JTextField getJtfHiredate() {
		return jtfHiredate;
	}

	public JTextField getJtfJob() {
		return jtfJob;
	}

	public JTextField getJtfSal() {
		return jtfSal;
	}

	public void setJtfEmpno(JTextField jtfEmpno) {
		this.jtfEmpno = jtfEmpno;
	}

	public void setJtfEname(JTextField jtfEname) {
		this.jtfEname = jtfEname;
	}

	public void setJtfHiredate(JTextField jtfHiredate) {
		this.jtfHiredate = jtfHiredate;
	}

	public void setJtfJob(JTextField jtfJob) {
		this.jtfJob = jtfJob;
	}

	public void setJtfSal(JTextField jtfSal) {
		this.jtfSal = jtfSal;
	}

}
