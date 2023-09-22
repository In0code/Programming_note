package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class StudentScoreEvt extends WindowAdapter implements ActionListener {
	
	private StudentScoreDialog ssd;

	/**
	 * 객체가 생성되면 학기 정보가 들어있는 컴보박스를 초기화한다.
	 * @param ssd StudentScoreDialog
	 */
	public StudentScoreEvt(StudentScoreDialog ssd) {
		this.ssd = ssd;
		setSearchBox(StudentMainFrame.sVO.getId());
	}
	
	/**
	 * 학생의 학번으로 학생이 들었거나 듣고있는 학기를 가져와 컴보박스에 설정한다.
	 * @param stuNum 학생의 학번
	 */
	public void setSearchBox(int stuNum) {
		//다오 연결해서 해당 학생이 들은 학기 가져오
		
		DefaultComboBoxModel<String> dcbm = ssd.getDcbmSemester();
		try {
			List<String> list = StudentScoreDAO.getInstance().selectSemester(stuNum);
			
			dcbm.addElement("학기 선택");
			for(int i = 0; i < list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 컴보박스에 선택한 학기의 성적을 가져와서 DefaultTableModel에 넣어서 JTable에 보여준다.
	 */
	public void searchSemester() {
		String temp = (String)(ssd.getJcbSemester().getSelectedItem());
		int sLevel = Character.getNumericValue(temp.charAt(0)); //학년을 가져온다.
		int semester = Character.getNumericValue(temp.charAt(6)); //학기를 가져온다.
		
		try {
			List<StudentScoreVO> list = StudentScoreDAO.getInstance().selectScore(sLevel, semester);
			
			if(list == null) {
				JOptionPane.showMessageDialog(ssd, "성적 조회 불가\n학과에 문의해주세요.");
				return;
			}
			
			DefaultTableModel dtm = ssd.getDtmScore();
			dtm.setNumRows(0); //초기화
			
			String[] arr = new String[5];
			
			for(StudentScoreVO ssVO : list) {
				arr[0] = ssVO.getMajorName();
				arr[1] = ssVO.getLectureName();
				arr[2] = String.valueOf(ssVO.getCredit());
				arr[3] = ssVO.getGrade();
				arr[4] = ssVO.getSubType();
				
				dtm.addRow(arr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void actionPerformed(ActionEvent ae) {
		searchSemester();
	}

	@Override
	public void windowClosing(WindowEvent we) {
		ssd.dispose();
	}

}
