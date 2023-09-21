package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 * 인영 학과 관리 Event
 * 
 * @author user
 *
 */
public class MajorManageEvt extends WindowAdapter implements ActionListener, MouseListener {

	private MajorManageDialog mmd;

	public MajorManageEvt(MajorManageDialog mmd) {
		this.mmd = mmd;
		searchAllMajorInfo();
		setDptNameCombo();
	}

	/**
	 * JTable에 모든 학과 정보 조회하여 추가
	 */
	public void searchAllMajorInfo() {

		MajorManageDAO majorDAO = MajorManageDAO.getInstance();
		List<MajorManageVO> dataList = null;
		try {
			dataList = majorDAO.selectAllMajor();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList.size(); i++) {
			MajorManageVO major = dataList.get(i);
			mmd.getDtmMajor().addRow(new Object[] { i + 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					major.getDptName(), major.getmajorCode(), major.getMajorName() });
		} // end for

	}// searchDpt

	/**
	 * 콤보박스에서 원하는 학부를 선택하여 조회 버튼을 누르면 그 학부에 해당하는 학과를 JTable에 추가하는 일
	 * 
	 * @param searchValue
	 */
	public void searchOneMajorInfo(String searchValue) {

		DefaultTableModel dtmDpt = (DefaultTableModel) mmd.getJtMajor().getModel();
		dtmDpt.setRowCount(0); // JTable의 정보 초기화

		MajorManageDAO majorDAO = MajorManageDAO.getInstance();
		List<MajorManageVO> dataList2 = null;
		try {
			dataList2 = majorDAO.selectOneMajorDpt(searchValue);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList2.size(); i++) {
			MajorManageVO major = dataList2.get(i);
			mmd.getDtmMajor().addRow(new Object[] { i + 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					major.getDptName(), major.getmajorCode(), major.getMajorName() });
		} // end for

		// JTable 갱신
		mmd.getJtMajor().repaint();
		mmd.getJtMajor().setModel(dtmDpt);

	}// search

	/**
	 * JTable에서 선택한 행을 얻어오는 일
	 */
	public void selectionMajorInfo() {
		JTable jtMajor = mmd.getJtMajor();
		DefaultTableModel dtm = mmd.getDtmMajor();
		int row = jtMajor.getSelectedRow();

		if (row != -1) {
			String dptname = String.valueOf(dtm.getValueAt(row, 1));
			String majorcode = String.valueOf(dtm.getValueAt(row, 2));
			String majorname = String.valueOf(dtm.getValueAt(row, 3));

			mmd.getJcbDptAdd().setSelectedItem(dptname);
			mmd.getJtfMajor().setText(majorname);
		} // end if
	}// selectionProfInfo

	/**
	 * 학부의 새로운 학과를 등록하는 일
	 */
	public void addMajor() {
		MajorManageVO mmVO = new MajorManageVO(mmd.getJcbDptAdd().getSelectedItem().toString(), "",
				mmd.getJtfMajor().getText().trim());
		if (checkInputData(mmVO)) {
			int flag = JOptionPane.showConfirmDialog(mmd, "학과를 등록하겠습니끼?", "학과등록", JOptionPane.YES_NO_OPTION);
			if (flag != JOptionPane.YES_OPTION) {
				return;
			} // end if

			MajorManageDAO mmDAO = MajorManageDAO.getInstance();
			searchAllMajorInfo();
			try {
				mmDAO.insertMajor(mmVO);
			} catch (SQLException e) {
				e.printStackTrace();
			} // end catch
			searchAllMajorInfo();
		} // end if
	}// addDpt

	/**
	 * 존재하는 학과의 이름을 수정하는 일
	 */
	public void EditMajorName() {
		JTable jtMajor = mmd.getJtMajor();
		DefaultTableModel dtm = mmd.getDtmMajor();
		int row = jtMajor.getSelectedRow();

		if (row != -1) {
			String majorcode = String.valueOf(dtm.getValueAt(row, 2));
			String newMajorName = mmd.getJtfMajor().getText().trim();

			// 수정된 학과 정보를 MajorManageVO에 설정
			MajorManageVO mmVO = new MajorManageVO(mmd.getJcbDptAdd().getSelectedItem().toString(), majorcode,
					newMajorName);

			if (checkInputData(mmVO)) {
				int flag = JOptionPane.showConfirmDialog(mmd, "학과 이름을 수정하겠습니까?", "학과 수정", JOptionPane.YES_NO_OPTION);
				if (flag != JOptionPane.OK_OPTION) {
					return;
				} // end if

				// 수정된 학과 정보를 데이터베이스에 업데이트
				MajorManageDAO majorDAO = MajorManageDAO.getInstance();
				try {
					majorDAO.updateMajor(mmVO);
					// 업데이트 이후에 JTable을 다시 갱신해줄 필요가 있을 수 있습니다.
					searchAllMajorInfo();
				} catch (SQLException e) {
					e.printStackTrace();
				} // end catch
			} // end if
		} // end if
	}// EditMajorName

	/**
	 * 학부를 불러와서 콤보박스에 넣는 일
	 */
	public void setDptNameCombo() {
		ProfDAO pDAO = ProfDAO.getInstance();
		List<ProfVO> dataList = null;
		try {
			dataList = pDAO.selectDptComboBox();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		for (int i = 0; i < dataList.size(); i++) {
			ProfVO prof = dataList.get(i);
			mmd.getDcbmDpt().addElement(prof.getDptName());
			mmd.getDcbmDptAdd().addElement(prof.getDptName());
		} // end for
	}// setDptNameCombo

	/**
	 * 입력 값 검사
	 * 
	 * @param esmVO
	 * @return
	 */
	public boolean checkInputData(MajorManageVO mmVO) {
		if (mmVO.getMajorName().replace(" ", "").isEmpty()) {
			showErrorMsg("학과는 필수 입력 사항입니다.", mmd.getJtfMajor());
			return false;
		} // end if

		if ((mmVO.getMajorName().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*") && mmVO.getMajorName().length() > 20)
				|| (mmVO.getMajorName().matches(".*[a-zA-Z].*") && mmVO.getMajorName().length() > 60)) {
			showErrorMsg("이름 : 한글 20자, 영문 60자를 초과할 수 없습니다.", mmd.getJtfMajor());
			return false;
		} // end if
		return true;
	}// checkInputData

	/**
	 * 에러 메시지 표시
	 * 
	 * @param msg - 에러 문구
	 * @param jtf - 에러 발생한 jTextfield
	 */
	public void showErrorMsg(String msg, JTextField jtf) {
		JOptionPane.showMessageDialog(mmd, msg);
		jtf.setText("");
		jtf.requestFocus();
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == mmd.getJbtnAdd()) {
			addMajor();

		} // end if
		if (ae.getSource() == mmd.getJbtnChange()) {
			EditMajorName();
		} // end if

		String searchValue = mmd.getJcbDpt().getSelectedItem().toString();
		if (ae.getSource() == mmd.getJbtnSearch()) {
			if (!searchValue.isEmpty()) {
				searchOneMajorInfo(searchValue);
			} // end if
		} // end if
	}// actionPerformed

	@Override
	public void mouseClicked(MouseEvent e) {
		switch (e.getButton()) {
		case MouseEvent.BUTTON1:
			selectionMajorInfo();
			break;
		}// end switch
	}

	@Override
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

}// class
