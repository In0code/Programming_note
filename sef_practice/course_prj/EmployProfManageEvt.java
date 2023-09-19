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

/**
 * 인영 교수 관리 Event
 * 
 * @author user
 *
 */
public class EmployProfManageEvt extends WindowAdapter implements ActionListener, MouseListener {
	private EmployProfManageDialog epmd;

	public EmployProfManageEvt(EmployProfManageDialog epmd) {
		this.epmd = epmd;
		searchAllProfInfo();
	}// EmployProfManageEvt

	/**
	 * JTable에 모든 교수 정보 조회하여 추가
	 */
	public void searchAllProfInfo() {

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
					prof.getEmpno(), prof.getEname(), prof.getDptName(), prof.getMajorName(), prof.getPhone(),
					prof.getEmail() });
		} // end for
	}// selectAllProfinfo

	/**
	 * 교수 한 명의 정보를 조회해서 JTable에 보여주는 일
	 * 
	 * @param searchValue
	 */
	public void searchOneProfInfo(String searchValue) {
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
			} // else
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		if (prof != null) {
			dtmProf.addRow(new Object[] { 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					prof.getEmpno(), prof.getEname(), prof.getDptName(), prof.getMajorName(), prof.getPhone(),
					prof.getEmail() });

			// JTable 갱신
			epmd.getJtProf().repaint();
		} else {
			JOptionPane.showMessageDialog(epmd, "교수를 찾을 수 없습니다\n입력한 정보를 확인하세요", "조회실패", JOptionPane.ERROR_MESSAGE);
		} // end else
	}// selectOneProfInfo

	/**
	 * JTable에서 선택한 행을 얻어오는 일
	 */
	public void selectionProfInfo() {
		JTable jtProf = epmd.getJtProf();
		DefaultTableModel dtm = epmd.getDtmProf();
		int row = jtProf.getSelectedRow();

		String empno = String.valueOf(dtm.getValueAt(row, 1));
		String ename = String.valueOf(dtm.getValueAt(row, 2));
		String dptname = String.valueOf(dtm.getValueAt(row, 3));
		String majorname = String.valueOf(dtm.getValueAt(row, 4));
		String phone = String.valueOf(dtm.getValueAt(row, 5));
		String email = String.valueOf(dtm.getValueAt(row, 6));

		ProfVO pVO = new ProfVO(ename, phone, email, majorname, dptname, empno);

		new EmployProfEditManageDialog(epmd, pVO);

	}// selectionProfInfo

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == epmd.getJbtnAdd()) { // 추가 버튼 누르면 동작
			new EmployProfAddManageDialog(epmd);
		} // end if

		if (ae.getSource() == epmd.getJbtnEdit()) { // 수정 버튼 누르면 동작
			selectionProfInfo();
		} // end if

		// 교수 정보 조회 텍스트 필드에 입력된 값 얻어오기
		String searchValue = epmd.getJtfSearch().getText().trim().toUpperCase();
		if (!searchValue.isEmpty()) { // 교수 정보 조회 텍스 필드가 비어있지 않으면 정보를 조회하는 일
			searchOneProfInfo(searchValue);
		} // end if
	}// actionPerformed

	@Override
	public void mouseClicked(MouseEvent me) {
		switch (me.getButton()) {
		// JTable에서 교수를 클릭하고 수정 버튼을 누르면 수정 창이 나오게

		case MouseEvent.BUTTON1:
			selectionProfInfo();
			break;
		}// end switch

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
