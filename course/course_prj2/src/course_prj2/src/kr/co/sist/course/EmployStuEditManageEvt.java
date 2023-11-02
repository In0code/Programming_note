package kr.co.sist.course;

import java.awt.FileDialog;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import kr.co.sist.dao.ClientImageIO;

public class EmployStuEditManageEvt extends WindowAdapter implements ActionListener {

	private EmployStuEditManageDialog esemd;
	private String imgPath;
	private String imgType;
	private String dptName;

	public EmployStuEditManageEvt(EmployStuEditManageDialog esemd, String dptName) {
		this.esemd = esemd;
		this.dptName = dptName;
		imgPath = "E:/dev/workspace/course_ysy/src/kr/co/sist/course/images/user.png";
		imgType = ".png";
		
		setDept();
		setMajor();
	}
	
	public EmployStuEditManageEvt(EmployStuEditManageDialog esemd) {
		this.esemd = esemd;
		//dptName = "컴퓨터공학부";
		imgPath = "E:/dev/workspace/course_ysy/src/kr/co/sist/course/images/user.png";
		imgType = ".png";
		
		setDept();
		setMajor();
	}

	/**
	 * 학부 설정
	 */
	public void setDept() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		try {
			List<String> dptList = esmDAO.selectDept();
			for (String dpt : dptList) {
				esemd.getDcbmDept().addElement(dpt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 학과 설정
	 */
	public void setMajor() {
		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		esemd.getDcbmMajor().removeAllElements();
		String dptNameAdd = esemd.getDcbmDept().getElementAt(esemd.getJcbDept().getSelectedIndex());
		System.out.println(dptName);
		try {
			List<String> majorList = esmDAO.selectMajor(dptName==null ? dptNameAdd : dptName);
			for (String major : majorList) {
				esemd.getDcbmMajor().addElement(major);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 학생 등록/수정
	 */
	public void editStudent() {
		int cnt = 0;
		String email = esemd.getJtfEmail().getText().replace(" ", "");

		EmployStuManageDAO esmDAO = EmployStuManageDAO.getInstance();
		EmployStuManageVO esmVO = new EmployStuManageVO(0, esemd.getJlblImg().getText(),
				esemd.getJtfName().getText().replace(" ", ""),
				esemd.getDcbmDept().getElementAt(esemd.getJcbDept().getSelectedIndex()),
				esemd.getDcbmMajor().getElementAt(esemd.getJcbMajor().getSelectedIndex()),
				esemd.getDcbmLevel().getElementAt(esemd.getJcbLevel().getSelectedIndex()),
				esemd.getJtfPhone().getText().replace(" ", ""),
				email.isEmpty() ? "-" : email.toLowerCase().concat(esemd.getDcbmEmail().getElementAt(esemd.getJcbEmail().getSelectedIndex())),
				esemd.getJtfAddr().getText());

		if (checkInputData(esmVO)) {
			if (esemd.getJbtnEdit().getText().equals("등록")) {
				try {
					// 등록
					int stuno = esmDAO.insertStudent(esmVO);
					ClientImageIO.writeImage(imgPath, imgType, String.valueOf(stuno));
					JOptionPane.showMessageDialog(esemd, "학생 정보가 정상적으로 등록되었습니다.");
				} catch (SQLException e) {
					e.printStackTrace();
					JOptionPane.showMessageDialog(esemd, "등록에 실패하였습니다.");
				} catch (IOException io) {
					
					io.printStackTrace();
				}
			} else {
				try {
					// 수정
					esmVO.setStuno(Integer.parseInt(esemd.getJtfStuNo().getText()));
					esmVO.setEmail(email.equals("-") || email.isEmpty() ? "-"
							: email.concat(esemd.getDcbmEmail().getElementAt(esemd.getJcbEmail().getSelectedIndex())));
					cnt = esmDAO.updateStudent(esmVO);
					if (cnt == 1) {
						JOptionPane.showMessageDialog(esemd, "학생 정보가 정상적으로 수정되었습니다.");
					}
				} catch (SQLException e) {
					e.printStackTrace();
					JOptionPane.showMessageDialog(esemd, "수정에 실패하였습니다.");
				}
			}
		}
	}

	public void editImg() {
		FileDialog fd = new FileDialog(esemd);
		fd.setVisible(true);
		
		if(fd.getFile() == null) {
			return;
		}

		imgPath = fd.getDirectory().concat(fd.getFile());
		imgType = fd.getFile().substring(fd.getFile().lastIndexOf("."));
		
		Image image = new ImageIcon(fd.getDirectory()+fd.getFile()).getImage();
		ImageIcon newImg = new ImageIcon(image);
		
		esemd.getJlblImg().setIcon(newImg);
	}

	/**
	 * 입력 값 검사
	 * 
	 * @param esmVO
	 * @return
	 */
	public boolean checkInputData(EmployStuManageVO esmVO) {
		if (esmVO.getsName().replace(" ","").isEmpty()) {
			showErrorMsg("이름은 필수 입력 사항입니다.", esemd.getJtfName());
			return false;
		}

		if ((esmVO.getsName().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*") && esmVO.getsName().length() > 6) || 
			(esmVO.getsName().matches(".*[a-zA-Z].*") && esmVO.getsName().length() > 20)) {
			showErrorMsg("이름 : 한글 6자, 영문 20자를 초과할 수 없습니다.", esemd.getJtfName());
			return false;
		}

		if(esmVO.getPhone().replace(" ","").isEmpty()) {
			showErrorMsg("전화번호는 필수 입력 사항입니다.", esemd.getJtfPhone());
			return false;
		}
		
		String[] phoneArr = esmVO.getPhone().split("-");
		if (phoneArr.length != 3 ||  phoneArr[0].length() != 3 || phoneArr[1].length() != 4 || phoneArr[2].length() != 4) {
			showErrorMsg("전화번호의 형식은 010-1234-5678 입니다.", esemd.getJtfPhone());
			return false;
		}

		if (!esmVO.getEmail().equals("-") && 
			(esmVO.getEmail().length() > 30 || esmVO.getEmail().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*"))) {
			showErrorMsg("이메일 : @주소 포함 최대 30글자, 한글은 사용 할 수 없습니다.", esemd.getJtfEmail());
			return false;
		}

		if (esmVO.getAddr().replace(" ", "").isEmpty()) {
			showErrorMsg("주소는 필수 입력 사항입니다.", esemd.getJtfAddr());
			return false;
		}

		if ((esmVO.getAddr().matches(".*[a-zA-Z].*") && esmVO.getAddr().length() > 600)	|| 
			(esmVO.getAddr().matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*") && esmVO.getAddr().length() > 200)) {
			showErrorMsg("주소 : 한글 200자, 영문 600자를 초과할 수 없습니다.", esemd.getJtfAddr());
			return false;
		}

		return true;
	}

	/**
	 * 에러 메시지 표시
	 * 
	 * @param msg - 에러 문구
	 * @param jtf - 에러 발생한 jTextfield
	 */
	public void showErrorMsg(String msg, JTextField jtf) {
		JOptionPane.showMessageDialog(esemd, msg);
		jtf.setText("");
		jtf.requestFocus();
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		// 학부에 맞게 학과 셋
		if (ae.getSource() == esemd.getJcbDept()) {
			setMajor();
		}

		// 등록/수정
		if (ae.getSource() == esemd.getJbtnEdit()) {
			editStudent();
		}

		if (ae.getSource() == esemd.getJbtnEditImg()) {
			editImg();
		}

	}

	@Override
	public void windowClosing(WindowEvent e) {
		esemd.dispose();
	}

}
