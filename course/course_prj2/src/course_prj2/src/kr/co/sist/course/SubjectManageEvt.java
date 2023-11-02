package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JTable;
import javax.swing.table.TableModel;

public class SubjectManageEvt extends WindowAdapter implements ActionListener, MouseListener{
	
	private SubjectManageDialog smd;
	private SubjectAddManageDialog semd;
	
	public SubjectManageEvt(SubjectManageDialog smd) {
		this.smd=smd;
		searchDpt();
		searchMajor();
	}//SubjectManageEvt
	
	//조회 버튼이 클릭되었을 때
	public void jcbSearch() {
		
		SubjectManageDAO smDAO = SubjectManageDAO.getInstance();
		String dptname = smd.getDcbmDpt().getElementAt(smd.getJcbDpt().getSelectedIndex());
		String majorname = smd.getDcbmMajor().getElementAt(smd.getJcbMajor().getSelectedIndex());
		
		try {
			List<SubjectManageVO> list = smDAO.selectAllSubject(dptname, majorname);
			smd.getDtmSub().setRowCount(0);
			
			String[] rowData=null;
			int no=1;

			for(SubjectManageVO smVO : list) {
			 //1.검색된 행을 채울 1차원 배열 생성
	         rowData = new String[8];
	         //2.생성된 배열에 값을 설정
	         rowData[0] = String.valueOf(no++);
	         rowData[1] = smVO.getSubCode();
	         rowData[2] = smVO.getSubName();
	         rowData[3] = smVO.getDptName();
	         rowData[4] = smVO.getMajorName();
	         rowData[5] = smVO.geteName();
	         rowData[6] = String.valueOf(smVO.getCredit());
	         rowData[7] = smVO.getSubType();
	         
	         //값을 가진 일차원 배열을 JTable에 설정하기 위해
	         //Model 객체를 사용 - addRow
	         smd.getDtmSub().addRow(rowData);
	       
			}//end for
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
	}//jcbSearch
	
	
public void searchDpt() {
		
		DefaultComboBoxModel<String> dcbm = smd.getDcbmDpt();
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
	
	public void searchMajor() {
		DefaultComboBoxModel<String> dcbm = smd.getDcbmMajor();
		String dptname = smd.getDcbmDpt().getElementAt(smd.getJcbDpt().getSelectedIndex());
		smd.getDcbmMajor().removeAllElements();
		
		try {
			List<String> list = SubjectManageDAO.getInstance().selectAllMajor(dptname);
			
			dcbm.removeAllElements();
			
			for(int i=0; i<list.size(); i++) {
				dcbm.addElement(list.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//searchMajor
	
	//등록 버튼 클릭
	public void addDpt() {
		new SubjectAddManageDialog(smd);
	}

	
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
	    int credit=Integer.parseInt((String)data.getValueAt(row, 6));
	    String subType=(String)data.getValueAt(row, 7);
	    
	    SubjectManageVO smVO = 
	    	new SubjectManageVO(subCode, subName, dptName, majorName,eName,credit,subType);
	    
	    //새창으로 VO객체 넘기기
	    new SubjectEditManageDialog(smd, smVO);
	    
	}//editDpt
	
	
	
	
	
	@Override
	public void mouseClicked(MouseEvent e) {
		if(e.getSource() == smd.getJbtnAdd()) {
			SubjectAddManageDialog semd = new SubjectAddManageDialog(smd);
		}//end if
		
		if(e.getSource() == smd.getJbtnSearch()) {
			jcbSearch();
		}//end if
		
		
	}//mouseClicked

	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == smd.getJbtnAdd()) {
			addDpt();
		}//end if
		
		if(e.getSource() == smd.getJbtnEdit()) {
			editDpt();
		}
		
		if(e.getSource() == smd.getJbtnSearch()) {
			jcbSearch();
		}//end if
			
		if(e.getSource() == smd.getJcbDpt()) {
			searchMajor();
		}//end if
	    
	}//actionPerformed
	
	
	@Override
	public void windowClosing(WindowEvent we) {
		smd.dispose();
	}//windowClosing

	
	@Override
	public void mousePressed(MouseEvent e) {}
	@Override
	public void mouseReleased(MouseEvent e) {}
	@Override
	public void mouseEntered(MouseEvent e) {}
	@Override
	public void mouseExited(MouseEvent e) {}
	
}//SubjectManageEvt
