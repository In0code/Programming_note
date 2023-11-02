package kr.co.sist.course;

import java.awt.FileDialog;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.sql.SQLException;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import kr.co.sist.dao.ClientImageIO;

/**
 * 사용자의 내정보(마이 페이지)를 확인하고 비밀번호, 사진, 이메일, 주소를 수정하는 클래스
 */
public class EmployProfileEvt extends WindowAdapter implements ActionListener {
	
	private EmployProfileDialog epf;
	private String path;
	private String fileType;
	
	/**
	 * 사용자의 기본 정보와 이메일 컴보박스를 객체를 생성한 동시에 실행해서 초기화를 진행한다.
	 * @param epf EmployProfileDialog
	 */
	public EmployProfileEvt(EmployProfileDialog epf) {
		this.epf = epf;
		initProfile();
		setEmailComboBox();
	}
	
	/**
	 * 처음 EmployProfileDialog에 표시되는 정보를 표시하는 화면.
	 */
	public void initProfile() {
		EmployVO eVO = EmployMainFrame.eVO;
		String[] email = eVO.getEmail().split("@");
		epf.getDcbmEmail().setSelectedItem(email[1]);
		
		epf.getJlblEmpno().setText(eVO.getEmpno());
		epf.getJtfName().setText(eVO.getName());
		epf.getJlblDpt().setText(eVO.getDptName());
		epf.getJlblMajor().setText(eVO.getMajorName());
		epf.getJtfPhone().setText(eVO.getPhone());
		epf.getJtfEmail().setText(email[0]);
		epf.getJlblMyImg().setIcon(epf.getEmf().getJlblMyPhoto().getIcon());
		
	}
	
	/**
	 * 비밀번호를 변경하는 버튼을 누르면 실행되는 메서드<br>
	 * 사용자가 입력한 새 비밀번호와 확인용 비밀번호를 비교하여 같으면 데이터베이스에 저장한다.<br>
	 * Error가 발생하면 비밀번호가 틀렸다는 JOptionPane을 보여준다.
	 * @param eVO EmployVO 
	 */
	public void changePw(EmployVO eVO) {
		String pw = new String(epf.getJpfPw().getPassword());
		String pw2 = new String(epf.getJpfCheckPw().getPassword());
		
		if(!pw.equals(pw2)) {
			JOptionPane.showMessageDialog(epf, "새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return;
		}
		
		try {
			int cnt = EmployDAO.getInstance().updatePw(eVO.getEmpno(), pw);
			if(cnt == 0) {
				JOptionPane.showMessageDialog(epf, "비밀번호 업데이트 실패!\n나중에 시도해주세요.", "서버오류", JOptionPane.ERROR_MESSAGE);
				return;
			}
			
			JOptionPane.showMessageDialog(epf, "비밀번호가 변경되었습니다.");
			
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(epf, "비밀번호 업데이트 실패!\n나중에 시도해주세요.", "서버오류", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}
	}
	
	/**
	 * 사용자가 수정 버튼을 누르면 실행되는 메서드이다. 임시 StudentVO에 변경할 수 있는 정보들을 담은 다음에 DAO 클래스에 보낸다.
	 * @param eVO EmployVO
	 */
	public void updateProfile(EmployVO eVO) {
		//내 정보를 정말로 수정할 건지 확인
		int flag = JOptionPane.showConfirmDialog(epf, "내 정보를 수정하시겠습니까?", "내 정보 수정", JOptionPane.YES_NO_OPTION);
		if(flag != JOptionPane.OK_OPTION) {
			return;
		}
		
//		변경할 정보들을 저장하는 VO class
		//교수 UI로 만듬
		EmployVO tempVO = new EmployVO();
		
		String email = epf.getJtfEmail()+"@"+epf.getDcbmEmail().getSelectedItem(); //이메일을 서식에 맞게 대입
		tempVO.setName(epf.getJtfName().getText());
		tempVO.setEmail(email);
		tempVO.setPhone(epf.getJtfPhone().getText());
		tempVO.setImage(eVO.getImage());
		
		try {
			int cnt = EmployDAO.getInstance().updateProfile(tempVO);
			if(cnt == 0) {
				JOptionPane.showMessageDialog(epf, "정보 수정 실패!\n나중에 시도해주세요.", "서버오류", JOptionPane.ERROR_MESSAGE);
				return;
			}
			
			if(!(path != null || "".equals(path))) {
				ClientImageIO.writeImage(path, fileType, EmployMainFrame.eVO.getEmpno());
			}
			
			//변경에 성공하면 기존에 있는 EmployVO를 업데이트 한다.
			EmployMainFrame.eVO = EmployDAO.getInstance().selectEmp(EmployMainFrame.eVO.getEmpno());
			
			JOptionPane.showMessageDialog(epf, "내 정보가 수정되었습니다.");
			
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(epf, "정보 수정 실패!\n나중에 시도해주세요.", "서버오류", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		} catch (IOException e) {
			JOptionPane.showMessageDialog(epf, "사진을 불러오는 중에 문제 발생!", "오류", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}
	}
	
	/**
	 * 사용자가 편집 버튼을 누르면 실행되는 메서드. 사용자가 원하는 사진으로 변경해주고 파일의 경로와 파일 확장자를 전역변수 path, fileType에 저장한다.<br>
	 * 전역변수는 사용자가 수정 버튼을 누르면 사용하여 사진을 저장한다.
	 */
	public void changeImg() {
		FileDialog fd = new FileDialog(epf);
		fd.setVisible(true);
		
		if(fd.getFile() == null) {
			return;
		}
		
		System.out.println(fd.getFile());
		Image image = new ImageIcon(fd.getDirectory()+fd.getFile()).getImage();
		ImageIcon newImg = new ImageIcon(image.getScaledInstance(190, 250, Image.SCALE_SMOOTH));
		
//		EmployMainFrame.eVO.setImage(fd.getFile()); //업데이트 하기 전까지는 서버에 저장되거나 하지 않음
		String temp = fd.getFile();
		path = fd.getDirectory()+temp;
		fileType = temp.substring(temp.lastIndexOf("."));
		epf.getJlblMyImg().setIcon(newImg);
	}
	
	/**
	 * 이메일 콤보박스를 초기화하는 메서드, editable은 가능하도록 설정되어 있다.
	 */
	public void setEmailComboBox() {
		DefaultComboBoxModel<String> dcbm = epf.getDcbmEmail();
		dcbm.addElement("직접입력");
		dcbm.addElement("gmail.com");
		dcbm.addElement("naver.com");
		dcbm.addElement("nate.com");
		dcbm.addElement("daum.com");
		dcbm.addElement("hotmail.com");
		
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		if(ae.getSource() == epf.getJbtnUpdatePw()) {
			changePw(EmployMainFrame.eVO);
		}
		if(ae.getSource() == epf.getJbtnEdit()) {
			updateProfile(EmployMainFrame.eVO);
		}
		if(ae.getSource() == epf.getJbtnEditImg()) {
			changeImg();
		}
	}

	@Override
	public void windowClosing(WindowEvent we) {
		epf.dispose();
	}

}
