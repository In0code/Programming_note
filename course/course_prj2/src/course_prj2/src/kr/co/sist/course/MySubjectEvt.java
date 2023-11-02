package kr.co.sist.course;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import java.sql.SQLException;

import java.util.List;

import javax.swing.table.DefaultTableModel;



public class MySubjectEvt implements MouseListener{
	
	private MySubjectDialog msDialog;

//	private LecturePlanVO lpVO;
	public MySubjectEvt (MySubjectDialog msDialog) {
		this.msDialog=msDialog;
		showContents();
	}

	public void showContents ()  {
		MySubjectDAO msDAO = MySubjectDAO.getInstance();
		DefaultTableModel dtmtn = msDialog.getDtmtn();
		try {
			List<MySubjectVO> list;
			list = msDAO.selectedContents(StudentMainFrame.sVO.getId());
			msDialog.getDtmtn().setRowCount(0);
			
			String[] rowData=new String[6];
			 
			for(MySubjectVO msVO : list) {
				
				
				rowData[0] = msVO.getMajorName();
				rowData[1] = msVO.getSubName();
				rowData[2] = msVO.getSubCode();
				rowData[3] = msVO.getProfname();
				rowData[4] = String.valueOf(msVO.getSubType());
				rowData[5] = String.valueOf(msVO.getCredit());
				dtmtn.addRow(rowData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
	}
	
	
	@Override
	public void mouseClicked(MouseEvent e) {
	
		 if (e.getButton() == MouseEvent.BUTTON1) {
		        int row = msDialog.getJtMySub().getSelectedRow();
		        
		        Object value = msDialog.getJtMySub().getValueAt(row, 2);
		      String subjectCode = String.valueOf(value);
		        System.out.println(subjectCode);
		      
//		        try {
//		        	  LecturePlanDao lpDAO = LecturePlanDao.getInstance();
//					lpVO = lpDAO.selectedContents(subjectCode);
					
					 new LecturePlanDialog(msDialog,subjectCode);
//				} catch (SQLException e1) {
//					// TODO Auto-generated catch block
//					e1.printStackTrace();
//				}
		        // Check if the selected cell is not empty (assuming your table model has data)
//		        if (row >= 0 && col == 0 && value != null) { // Check if it's the first column (subject code)
//		            String subjectCode = String.valueOf(value);
//		            try {
//		                // Use the subject code to fetch the lecture plan
//		                LecturePlanDao lpDAO = LecturePlanDao.getInstance();
//		                LecturePlanVO lpVO = lpDAO.selectedContents(subjectCode);
//		                
//		                // Pass the retrieved lecture plan to LecturePlanDialog
//		                new LecturePlanDialog(msDialog); // You may need to modify the constructor of LecturePlanDialog to accept lpVO
//		            } catch (SQLException ex) {
//		                ex.printStackTrace();
//		            }
//		        }
//		        } 
	}
		 }
	

	
	
	@Override
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

}
