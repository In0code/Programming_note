package kr.co.sist.course;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;

import javax.swing.JOptionPane;
//돼라
public class LoginEvt extends WindowAdapter implements ActionListener {
	
	private LoginFrame lf;
	
	public LoginEvt(LoginFrame lf) {
		this.lf = lf;
		bringId();
	}
	
	/**
	 * 아이디와 비밀번호를 확인하여 로그인을 한다.
	 * @param id 아이디(사번, 학번)
	 * @param pw 비밀번호
	 */
	public void accountCheck(String id, char[] pw) {
		String strId = id.trim();
		String pass = String.valueOf(pw);
		
		if("".equals(id) || "".equals(pass)) {
			JOptionPane.showMessageDialog(lf, "아이디와 비밀번호는 필수 입력입니다.");
			return;
		} 
			
		try {
			if(isAdmin()) { //관리자 또는 학생 계정으로 로그인하는지 확인한다.
				new EmployMainFrame(LoginDAO.getInstnace().selectEmp(strId, pass));
		
			} else {
				new StudentMainFrame(LoginDAO.getInstnace().selectStu(strId, pass));
			}
			
			idSave(strId);
			lf.dispose();
			
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			JOptionPane.showMessageDialog(lf, "서버 오류!\n잠시 후에 다시 시도해 주세요.");
		} catch (NumberFormatException nfe) {
			nfe.printStackTrace();
			JOptionPane.showMessageDialog(lf, "아이디, 비밀번호를 올바르게 입력해주세요.");
		} catch (NullPointerException npe) {
			npe.printStackTrace();
			JOptionPane.showMessageDialog(lf, "아이디, 비밀번호를 올바르게 입력해주세요.\"");
		}
		
	}
	
	/**
	 * 관리자 계정으로 로그인하는지 확인하는 작업이다.
	 * @return 관리자 계정에 체크되어 있으면 true 아니면 false를 반환
	 */
	public boolean isAdmin() {
		boolean flag = lf.getJcbChangeAdmin().isSelected();
		return flag;
	}
	
	/**
	 * 아이디를 저장할지 체크박스에 체크하면 파일을 사용자 컴퓨터에 저장한다.
	 * @param id 아이디(사번, 학번)
	 */
	public void idSave(String id) {
		File file = new File("e:/dev/temp/id.dmp");
		
		if(lf.getJcbIdSave().isSelected()) {
			
			try {
				BufferedWriter bw = new BufferedWriter(new FileWriter(file));
				bw.write(id);
				bw.close();
				
				
			} catch (IOException e) {
			}
			
		} else {
			file.delete();
		}
	}
	
	public void bringId() {
		File file = new File("e:/dev/temp/id.dmp");
		try {
			BufferedReader br = new BufferedReader(new FileReader(file));
			String id = br.readLine();
			
			lf.getJtfId().setText(id);
			
			br.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void actionPerformed(ActionEvent ae) {
		//로그인 버튼 하나만 구분하여 작동
		if(ae.getSource() == lf.getJbtnLogin() || ae.getSource() == lf.getJpPw()) {
			accountCheck(lf.getJtfId().getText(), lf.getJpPw().getPassword());
		}
	}

	@Override
	public void windowClosing(WindowEvent we) {
		lf.dispose();
	}

	/**
	 * 실행이 되면 아이디 JTextField에 커서가 자동으로 가도록 설정하기 위한 메서드
	 */
	@Override
	public void windowOpened(WindowEvent we) {
		lf.getJtfId().requestFocus();
	}

}
