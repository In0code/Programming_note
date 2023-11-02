package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.List;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.TableModel;

public class LectureEditManageEvt extends WindowAdapter implements ActionListener{
	
	private SubjectManageDialog smd;
	private SubjectEditManageDialog semd;
	
	public LectureEditManageEvt(SubjectEditManageDialog semd) {
		this.semd=semd;
		initDptJcb();
		initMajorJcb();
		searchProf();
		searchSubType();
	}//LectureEditManageEvt
	
	public void initDptJcb() {
		DefaultComboBoxModel<String> dcbm = semd.getDcbmDept();
		try {
			List<String> list = LectureEditManageDAO.getInstance().selectAllDpt();
			dcbm.removeAllElements();
			
			for(int i=0; i<list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
	}//initDptJcb
	
	public void initMajorJcb() {
		DefaultComboBoxModel<String> dcbm = semd.getDcbmMajor();
		String dptname=semd.getDcbmDept().getElementAt(semd.getJcbDept().getSelectedIndex());
		semd.getDcbmMajor().removeAllElements();
		try {
			List<String> list = LectureEditManageDAO.getInstance().selectAllMajor(dptname);
			
			dcbm.removeAllElements();
			
			for(int i=0; i<list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
	}//initMajorJcb
	
	public void searchProf() {
		DefaultComboBoxModel<String> dcbm = semd.getDcbmProf();
		try {
			List<String> list = LectureEditManageDAO.getInstance().selectAllProf();
			dcbm.removeAllElements();
			
			for(int i=0; i<list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
	}//searchProf
	
	public void searchSubType() {
		DefaultComboBoxModel<String> dcbm = semd.getDcbmSubType();
		try {
			List<String> list = LectureEditManageDAO.getInstance().selectSubType();
			dcbm.removeAllElements();
			
			for(int i=0; i<list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}//end catch
	}//searchSubType
	
	//과목 수정
		public void editDpt() {
			//선택한 셀의 행번호
		    int row=smd.getJtLecture().getSelectedRow();
		    
		    //테이블의 모델 객체얻기
		    TableModel data=smd.getJtLecture().getModel();
		   
		    String subCode=(String)data.getValueAt(row, 1);
		    String subName=(String)data.getValueAt(row, 2);
		    String dptName=(String)data.getValueAt(row, 3);
		    String majorName=(String)data.getValueAt(row, 4);
		    String eName=(String)data.getValueAt(row, 5);
		    int credit=(int)data.getValueAt(row, 6);
		    String subType=(String)data.getValueAt(row, 7);
		    
		    SubjectManageVO smVO = 
		    	new SubjectManageVO(subCode, subName, dptName, majorName,eName,credit,subType);
		    
		    //새창으로 VO객체 넘기기
		    new SubjectEditManageDialog(smd, smVO);
		    
		}//editDpt
	
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
			if(e.getSource() == semd.getJbtnEdit()) {
				System.out.println("버튼눌림");
				 editDpt();
			}//end if
		
	        if(e.getSource() == semd.getJcbDept()) {
	        	initMajorJcb();
	        }//end if
	       
	        
	}//actionPerformed

	@Override
	public void windowClosing(WindowEvent e) {
		super.windowClosing(e);
	}
	
	
	
}
