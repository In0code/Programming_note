package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 * 인영 학과 관리 Event
 * 
 * @author user
 *
 */
public class MajorManageEvt extends WindowAdapter implements ActionListener {

	private MajorManageDialog mmd;

	public MajorManageEvt(MajorManageDialog mmd) {
		this.mmd = mmd;
		searchAllMajorInfo();
		setDptNameCombo();
//		setDptNameCombo();
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
		
	}//searchDpt
	
	public void setDptNameCombo() {
		MajorManageDAO majorDAO = MajorManageDAO.getInstance();
		List<MajorManageVO> dataList=null;
		try {
			dataList=majorDAO.setDptComboBox();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		for(int i=0; i<dataList.size(); i++) {
			MajorManageVO major=dataList.get(i);
			mmd.getDcbmDpt().addElement(major.getDptName());
			mmd.getDcbmDptAdd().addElement(major.getDptName());
		}//end for
	}//setDptNameCombo

	public void searchOneMajorInfo(String searchValue) {
		if (searchValue.isEmpty()) {
			return;
		} // end if

		DefaultTableModel dtmDpt = (DefaultTableModel) mmd.getJtMajor().getModel();
		dtmDpt.setRowCount(0); // JTable의 정보 초기화

		MajorManageDAO majorDAO = MajorManageDAO.getInstance();

		MajorManageVO major= null;
		try {
			if (mmd.getJcbDpt().getSelectedItem() != null) {
				major = majorDAO.selectOneMajorDpt(searchValue);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		if (major != null) {
			dtmDpt.addRow(new Object[] { 1, // No 컬럼은 1부터 시작하는 순번으로 설정
					major.getDptName(), major.getmajorCode(), major.getMajorName() });

			// JTable 갱신
			mmd.getJtMajor().repaint();
		} else {
			JOptionPane.showMessageDialog(mmd, "를 찾을 수 없습니다\n입력한 정보를 확인하세요", "조회실패", JOptionPane.ERROR_MESSAGE);
		} // end else

	}//search
	
	/**
	 * JTable에서 선택한 행을 얻어오는 일
	 */
	public void selectionMajorInfo() {
		JTable jtMajor = mmd.getJtMajor();
		DefaultTableModel dtm = mmd.getDtmMajor();
		int row = jtMajor.getSelectedRow();

//		String empno = String.valueOf(dtm.getValueAt(row, 1));
//		String ename = String.valueOf(dtm.getValueAt(row, 2));
//		String dptname = String.valueOf(dtm.getValueAt(row, 3));
//		String majorname = String.valueOf(dtm.getValueAt(row, 4));
//		String phone = String.valueOf(dtm.getValueAt(row, 5));
//		String email = String.valueOf(dtm.getValueAt(row, 6));
//
//		ProfVO pVO = new ProfVO(ename, phone, email, majorname, dptname, empno);
//
//		new EmployProfEditManageDialog(mmd, pVO);

	}// selectionProfInfo


	public void addMajor() {
		int flag=JOptionPane.showConfirmDialog(mmd, "학과를 등록하겠습니끼?","학과등록",JOptionPane.YES_NO_OPTION);
		if(flag != JOptionPane.YES_OPTION) {
			return;
		}//end if
		
		MajorManageVO mmVO=new MajorManageVO(mmd.getJcbDpt().getSelectedItem().toString(),"",mmd.getJtfMajor().getText().trim());
		
		
		MajorManageDAO mmDAO=MajorManageDAO.getInstance();
		try {
		mmDAO.insertMajor(mmVO);
		}catch (SQLException e) {
			e.printStackTrace();
		}//end catch
	}//addDpt

	public void EditMajorName() {

		int flag = JOptionPane.showConfirmDialog(mmd, "학과 이름을 수정하겠습니까?", "교수수정", JOptionPane.YES_NO_OPTION);
		if (flag != JOptionPane.OK_OPTION) {
			return;
		}
//		String selectedMajor = epad.getJcbMajor().getSelectedItem() != null
//				? epad.getJcbMajor().getSelectedItem().toString()
//				: "";
//		String selectedDept = epad.getJcbDept().getSelectedItem() != null
//				? epad.getJcbDept().getSelectedItem().toString()
//				: "";

//		MajorManageVO mmVO = new MajorManageVO(mmd.getJtfName().getText().trim(), epemd.getJtfPhone().getText().trim(),
//				epemd.getJtfEmail().getText().trim().concat(epemd.getJcbEmail().getSelectedItem().toString()),
//				epemd.getJcbMajor().getSelectedItem().toString(), epemd.getJcbDept().getSelectedItem().toString(), epemd.getJlblSetEmpno().getText().trim());

		MajorManageDAO majorDAO = MajorManageDAO.getInstance();
		try {
//			majorDAO.updateMajor(mmVO);
			majorDAO.selectAllMajor();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}// EditMajorName

	@Override
	public void actionPerformed(ActionEvent ae) {
		if(ae.getSource()== mmd.getJbtnAdd()) {
			addMajor();
		}//end if
		if(ae.getSource()== mmd.getJbtnChange()) {
			EditMajorName();
		}//end if
		
		String searchValue=mmd.getJcbDpt().getSelectedItem().toString();
		if(!searchValue.isEmpty()) {
			searchOneMajorInfo(searchValue);
		}//end if
	}

}// class
