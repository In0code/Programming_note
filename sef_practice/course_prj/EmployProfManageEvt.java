package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

public class EmployProfManageEvt extends WindowAdapter implements ActionListener, MouseListener {
//////////////인영 ///////////////
/////////// 교수관리 Event ///////////
	private EmployProfManageDialog epmd;

	public EmployProfManageEvt(EmployProfManageDialog epmd) {
		this.epmd = epmd;
		selectAllProfinfo();
	}//EmployProfManageEvt

	public void selectAllProfinfo() { // JTable에 모든 교수 정부 추가

		ProfDAO profDAO = ProfDAO.getInstance();
		List<ProfVO> dataList = null;
		try {
			dataList = profDAO.selectAllProf();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList.size(); i++) {
			ProfVO prof = dataList.get(i);
			epmd.getDtmProf().addRow(new Object[] { i + 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					prof.getEmpno(), prof.getEname(), prof.getDptname(),  prof.getMajorname(),prof.getPhone(),
					prof.getEmail() });
		} // end for
	}// selectAllProfinfo

	public void selectOneProfInfo(String searchValue) { // 교수 한 명 조회
		if (searchValue.isEmpty()) {
			return;
		} // end if

		DefaultTableModel dtmProf = (DefaultTableModel) epmd.getJtProf().getModel();
		dtmProf.setRowCount(0); // JTable의 정보 초기화

		ProfDAO profDAO = ProfDAO.getInstance();

		ProfVO prof = null;
		try {
			if (epmd.getJcbSearch().getSelectedItem().equals("사번")) {
				prof = profDAO.selectOneProfEmpno(searchValue);
			} else if (epmd.getJcbSearch().getSelectedItem().equals("이름")) {
				prof = profDAO.selectOneProfEname(searchValue);
			} //
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		if (prof != null) {
			dtmProf.addRow(new Object[] { 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					prof.getEmpno(), prof.getEname(),  prof.getDptname(),prof.getMajorname(), prof.getPhone(),
					prof.getEmail() });

			// JTable 갱신
			epmd.getJtProf().repaint();
		} else {
			JOptionPane.showMessageDialog(epmd, "교수를 찾을 수 없습니다\n입력한 정보를 확인하세요", "조회실패", JOptionPane.ERROR_MESSAGE);
		} // end else
	}// selectOneProfInfo
	
	public void selectionProfInfo() { 
		//JTable에서 선택한 행을 얻어오는 일
		EmployProfEditManageDialog epemd=new EmployProfEditManageDialog(epmd);
		JTable jtProf=epmd.getJtProf();
		DefaultTableModel dtm=epmd.getDtmProf();
		int row=jtProf.getSelectedRow();
		
//		epemd.get
		
	}//selectionProfInfo

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == epmd.getJbtnAdd()) {
			new EmployProfAddManageDialog(epmd);
		} // end if

		if (ae.getSource() == epmd.getJbtnEdit()) {
			selectionProfInfo() ;
		} // end if

		String searchValue = epmd.getJtfSearch().getText().trim().toUpperCase();
		if (!searchValue.isEmpty()) {

			selectOneProfInfo(searchValue);
		} // end if
	}// actionPerformed
	
	

	@Override
	public void mouseClicked(MouseEvent me) {
	}

	public void mousePressed(MouseEvent e) {
	}

	@Override
	public void mouseReleased(MouseEvent e) {
	}

	@Override
	public void mouseEntered(MouseEvent e) {
	}

	@Override
	public void mouseExited(MouseEvent e) {
	}

	@Override
	public void windowClosing(WindowEvent we) {
		epmd.dispose();
	}

}// class
