package kr.co.sist.course;


import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;


import javax.swing.table.DefaultTableModel;

public class StudentSubjectEvt extends WindowAdapter implements MouseListener{
	private StudentSubjectDialog ssDialog;
	public String subjectCode;
	
	

	



	public StudentSubjectEvt (StudentSubjectDialog ssDialog) {
		this.ssDialog = ssDialog;
		showContents();
	}

	//JTable에 값 셋팅
	public void showContents ()  {
		StudentSubjectDAO ssDAO = StudentSubjectDAO.getInstance();
		DefaultTableModel dtmtn = ssDialog.getDtmtn();
		try {
			List<StudentSubjectVO> list;
			list = ssDAO.selectSubject(StudentMainFrame.sVO.getId());
             ssDialog.getDtmtn().setRowCount(0);
			
			String[] rowData=new String[5];
			 
			for(StudentSubjectVO ssVO : list) {
				
				
				rowData[0] = ssVO.getSubjectCode();
				rowData[1] = ssVO.getSubjectname();
				rowData[2] = ssVO.getProfName();
				rowData[3] = String.valueOf(ssVO.getSubType());
				rowData[4] = String.valueOf(ssVO.getCredit());
				dtmtn.addRow(rowData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
	}
	

	
	//클릭 됐을 때 강의계획서 
	@Override
	public void mouseClicked(MouseEvent e) {
		 if (e.getButton() == MouseEvent.BUTTON1) {
		        int row = ssDialog.getJtss().getSelectedRow();
		     
		        Object value = ssDialog.getJtss().getValueAt(row, 0);
		         subjectCode = String.valueOf(value);
		        System.out.println(subjectCode);
		      
//		        try {
//		        	  LecturePlanDao lpDAO = LecturePlanDao.getInstance();
//		        	  lpVO=lpDAO.selectedContents(subjectCode);
					 new LecturePlanDialog(ssDialog,subjectCode);// -> 매개변수?
					 
//				} catch (SQLException e1) {
//				
//					e1.printStackTrace();
//				}
		       
		    }
		
		  }
		
	
	@Override
	public void mousePressed(MouseEvent e) {
	
		      
		 
		
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




}
