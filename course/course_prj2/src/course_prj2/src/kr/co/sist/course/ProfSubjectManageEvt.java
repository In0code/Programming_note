package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;

import javax.swing.DefaultComboBoxModel;
import javax.swing.table.DefaultTableModel;

public class ProfSubjectManageEvt extends WindowAdapter implements ActionListener, MouseListener {
	
	private ProfSubjectManageDialog psmd;
	
	public ProfSubjectManageEvt(ProfSubjectManageDialog psmd) {
		this.psmd=psmd;
		searchDpt();
	}
	
	//조회 버튼이 클릭되었을 때
	public void jcbSearch() {
		
		SubjectManageDAO smDAO = SubjectManageDAO.getInstance();
		DefaultTableModel dtmt =  psmd.getDtmSub();
		String dptname = psmd.getDcbmDpt().getElementAt(psmd.getJcbDpt().getSelectedIndex());
		
		try {
			List<SubjectManageVO> list = smDAO.selectAllSubject(dptname, /*EmployMainFrame.eVO.getMajorName()*/"컴퓨터과학과");
			psmd.getDtmSub().setRowCount(0);
			
			String[] rowData=null;
			int no=1;

			for(SubjectManageVO smVO : list) {
			 //1.검색된 행을 채울 1차원 배열 생성
	         rowData = new String[9];
	         //2.생성된 배열에 값을 설정
	         rowData[0] = String.valueOf(no++);
	         rowData[1] = smVO.getSubCode();
	         rowData[2] = smVO.getSubName();
	         rowData[3] = smVO.getDptName();
	         rowData[4] = smVO.getMajorName();
	         rowData[5] = smVO.geteName();
	         rowData[6] = String.valueOf(smVO.getCredit());
	         rowData[7] = smVO.getSubType();
	         rowData[8] = String.valueOf("Y");
	         
	         //값을 가진 일차원 배열을 JTable에 설정하기 위해
	         //Model 객체를 사용 - addRow
	         psmd.getDtmSub().addRow(rowData);
	       
			}//end for
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
	}//jcbSearch
	
	//학부콤보박스
public void searchDpt() {
		DefaultComboBoxModel<String> dcbm = psmd.getDcbmDpt();
		try {
			List<String> list = SubjectManageDAO.getInstance().selectAllDpt();
			
			dcbm.removeAllElements();
			
			for(int i = 0; i < list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}//searchDpt

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == psmd.getJbtnSearch()) {
	        	jcbSearch();
	    }
	}


	@Override
	public void mouseClicked(MouseEvent e) {
		//클릭하면 창 띄우기
				switch(e.getButton()) {
				case MouseEvent.BUTTON1 :
					int row = psmd.getJtLecture().getSelectedRow();
//					int col = psmd.getJtLecture().getSelectedColumn();
					Object value = psmd.getJtLecture().getValueAt(row, 1);
					String subCode = String.valueOf(value);
					System.out.println(subCode);
					
					try {
						new LecturePlanProfEditDialog(psmd, subCode);
					} catch (Exception e2) {
						e2.printStackTrace();
					}//end catch
				}//end if
	}//mouseClicked
	
	@Override
	public void mousePressed(MouseEvent e) {
	}
	@Override
	public void mouseReleased(MouseEvent e) {
	}
	@Override
	public void mouseEntered(MouseEvent e) {
	}
	public void mouseExited(MouseEvent e) {
	}

}
