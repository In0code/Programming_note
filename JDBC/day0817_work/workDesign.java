package day0817_work;

import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableModel;

@SuppressWarnings("serial")
public class workDesign extends JFrame {

	private DefaultTableModel dtmTable;
	private JTable jtTable;
	private JComboBox<String> jcbTableName;
	private JScrollPane jspTable;

	public workDesign() {
		super("테이블 구조");

		String[] columnNames = { "컬럼명", "데이터형", "크기", "널허용", "default여부" };
		dtmTable = new DefaultTableModel(null, columnNames);
		jtTable = new JTable(dtmTable);
		jcbTableName.addItem(getName());

		jspTable = new JScrollPane(jtTable);
		jspTable.setBorder(new TitledBorder("테이블 구조 검색"));
		
		

//		jtTable.getColumnModel().getColumn(0).setPreferredWidth(80);
//		jtTable.getColumnModel().getColumn(1).setPreferredWidth(42);
//		jtTable.getColumnModel().getColumn(2).setPreferredWidth(42);
//		jtTable.getColumnModel().getColumn(3).setPreferredWidth(42);
//		jtTable.getColumnModel().getColumn(4).setPreferredWidth(42);

		jtTable.setRowHeight(25);

		JPanel jpNorth= new JPanel();
		jpNorth.add(jtTable);
		
		JPanel jpSouth=new JPanel();
		jcbTableName=new JComboBox<String>();
		jpSouth.add(jcbTableName);
		
		add(jspTable);
		add("North",jpNorth);
		add("South",jpSouth);
		
		
		setBounds(100, 100, 500, 600);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}// workDesign

//	public void RunCombo() {
//		try {
//			
//			TableInfoDAO dao=TableInfoDAO.getInstance();
//			List<String> TableNames=dao.();
//			
//		}catch(SQLException e) {
//			
//		}
//	}
	
	public DefaultTableModel getDtmTable() {
		return dtmTable;
	}

	public JTable getJtTable() {
		return jtTable;
	}

	public JComboBox<String> getJcbTableName() {
		return jcbTableName;
	}

	public JScrollPane getJspTable() {
		return jspTable;
	}
	
	public static void main(String[] args) {
		new workDesign();
	}
	

}// workEvt
