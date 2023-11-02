package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.List;

import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.JTable;

public class LectureAddManageEvt extends WindowAdapter implements ActionListener{
	
	private SubjectAddManageDialog samd;
	private SubjectManageDialog smd;
	private SubjectEditManageDialog semd;
	
	public LectureAddManageEvt(SubjectAddManageDialog samd) {
		this.samd=samd;
		initDptJcb();
		initMajorJcb();
		searchProf();
		searchSubType();
	}//LectureEditManageEvt
	
	public LectureAddManageEvt(SubjectEditManageDialog semd) {
		this.semd=semd;
		initEditDptJcb();
		initEditMajorJcb();
		searchEditProf();
		searchEditSubType();
	}//LectureEditManageEvt
	
	public void initDptJcb() {
		DefaultComboBoxModel<String> dcbm = samd.getDcbmDept();
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
	
	public void initEditDptJcb() {
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
		DefaultComboBoxModel<String> dcbm = samd.getDcbmMajor();
		String dptname=samd.getDcbmDept().getElementAt(samd.getJcbDept().getSelectedIndex());
		samd.getDcbmMajor().removeAllElements();
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
	
	public void initEditMajorJcb() {
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
		DefaultComboBoxModel<String> dcbm = samd.getDcbmProf();
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
	
	public void searchEditProf() {
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
		DefaultComboBoxModel<String> dcbm = samd.getDcbmSubType();
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
	
	public void searchEditSubType() {
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
	
	
	public void addDpt() {
		try {
            // 필요한 정보를 가져와서 LectureEditManageVO 객체에 저장합니다.
            String dptName = (String) samd.getJcbDept().getSelectedItem();
            String majorName = (String) samd.getJcbMajor().getSelectedItem();
            String lectureName = samd.getJtfLecture().getText();
            String profName = (String) samd.getJcbProf().getSelectedItem();
            int credit = Integer.parseInt(samd.getJtfCredit().getText());
            String subType = (String) samd.getJcbSubType().getSelectedItem();

            LectureEditManageVO lemVO = new LectureEditManageVO();
            lemVO.setDptName(dptName);
            lemVO.setMajorName(majorName);
            lemVO.setLectureName(lectureName);
            lemVO.setProfName(profName);
            lemVO.setCredit(credit);
            lemVO.setSubType(subType);

            // 데이터베이스에 등록 메소드 호출
            LectureEditManageDAO.getInstance().insertLecture(lemVO);

            // 등록이 성공하면 메시지를 띄우고 창 닫기
            JOptionPane.showMessageDialog(samd, "과목이 등록되었습니다.");
            samd.dispose();
        } catch (NumberFormatException ex) {
            // 학점 입력이 올바르지 않은 경우 에러 메시지
            JOptionPane.showMessageDialog(samd, "올바른 학점을 입력하세요.", "입력 오류", JOptionPane.ERROR_MESSAGE);
        } catch (Exception ex) {
            ex.printStackTrace();
            // 등록에 실패한 경우 에러 메시지
            JOptionPane.showMessageDialog(samd, "과목 등록에 실패했습니다. 다시 시도해주세요.");
        }
    }
	
	public void editDpt() {
		try {
			// 필요한 정보를 가져와서 LectureEditManageVO 객체에 저장합니다.
			String dptName = (String) semd.getJcbDept().getSelectedItem();
			String majorName = (String) semd.getJcbMajor().getSelectedItem();
			String lectureName = semd.getJtfLecture().getText();
			String profName = (String) semd.getJcbProf().getSelectedItem();
			int credit = Integer.parseInt(semd.getJtfCredit().getText());
			String subType = (String) semd.getJcbSubType().getSelectedItem();
			
			LectureEditManageVO lemVO = new LectureEditManageVO();
			lemVO.setDptName(dptName);
			lemVO.setMajorName(majorName);
			lemVO.setLectureName(lectureName);
			lemVO.setProfName(profName);
			lemVO.setCredit(credit);
			lemVO.setSubType(subType);
			
			// 데이터베이스에 등록 메소드 호출
			LectureEditManageDAO.getInstance().updateLecture(lemVO);
			
			// 등록이 성공하면 메시지를 띄우고 창 닫기
			JOptionPane.showMessageDialog(samd, "과목이 등록되었습니다.");
			semd.dispose();
		} catch (NumberFormatException ex) {
			// 학점 입력이 올바르지 않은 경우 에러 메시지
			JOptionPane.showMessageDialog(samd, "올바른 학점을 입력하세요.", "입력 오류", JOptionPane.ERROR_MESSAGE);
		} catch (Exception ex) {
			ex.printStackTrace();
			// 등록에 실패한 경우 에러 메시지
			JOptionPane.showMessageDialog(samd, "과목 등록에 실패했습니다. 다시 시도해주세요.");
		}
	}
	
	
	@Override
	public void actionPerformed(ActionEvent e) {
			if(samd != null) {
				if(e.getSource() == samd.getJbtnAdd()) {
					addDpt();
				}//end if
				
				if(e.getSource() == samd.getJcbDept()) {
					initMajorJcb();
				}//end if
				
			}
			
			if(semd != null) {
				if(e.getSource() == semd.getJbtnEdit()) {
					editDpt();
				}
				
			}
	        
	}//actionPerformed

	@Override
	public void windowClosing(WindowEvent e) {
		super.windowClosing(e);
	}
	
	
	
}
