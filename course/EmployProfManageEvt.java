package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import oracle.jdbc.AdditionalDatabaseMetaData;

public class EmployProfManageEvt extends WindowAdapter implements ActionListener, MouseListener {
//////////////인영 ///////////////
/////////// 교수관리 Event ///////////
	private EmployProfManageDialog epmd;

	public EmployProfManageEvt(EmployProfManageDialog epmd) {
		this.epmd = epmd;
		selectProfinfo();
	}

	public void selectProfinfo() {
		DefaultTableModel dtmProf = new DefaultTableModel();
		// 컬럼 이름 추가
		dtmProf.addColumn("No");
		dtmProf.addColumn("사번");
		dtmProf.addColumn("이름");
		dtmProf.addColumn("학부명");
		dtmProf.addColumn("학과명");
		dtmProf.addColumn("전화번호");
		dtmProf.addColumn("이메일");

		ProfDAO profDAO = ProfDAO.getInstance();
		List<ProfVO> dataList = null;
		try {
			dataList = profDAO.selectAllProf();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		for (int i = 0; i < dataList.size(); i++) {
			ProfVO prof = dataList.get(i);
			dtmProf.addRow(new Object[] { i + 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					prof.getEmpno(), prof.getEname(), prof.getMajorname(), prof.getDptname(), prof.getPhone(),
					prof.getEmail() });
		}

		epmd.setJtProf(new JTable(dtmProf));
	}

	@Override
	public void mouseClicked(MouseEvent me) {

	}

	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == epmd.getJbtnAdd()) {
			new EmployProfAddManageDialog(epmd);
		}

	}

	@Override
	public void windowClosing(WindowEvent we) {
		epmd.dispose();
	}

}
