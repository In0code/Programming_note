package day0821;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class LoginFormEvt extends WindowAdapter implements ActionListener {

	private LoginForm lf;

	public LoginFormEvt(LoginForm lf) {
		this.lf = lf;
	}// LoginFormEvt

	@Override
	public void windowClosing(WindowEvent e) {
		lf.dispose();
	}// windowClosing

	@Override
	public void actionPerformed(ActionEvent ae) {

		chkEmpty();

	}// actionPerformed

	private void chkEmpty() {
		String id = lf.getJtfId().getText().trim();
		// 아이디가 비어있다면 경고창으로 아이디 입력을 보여준다
		if ("".equals(id)) {
			JOptionPane.showMessageDialog(lf, "아이디는 필수 입력!!");
			lf.getJtfId().requestFocus();
			return;
		} // end if

		// 비밀번호가 비어있다면 경고창으로 비밀번호 입력을 보여준다
		String pass = new String(lf.getJpfPass().getPassword());
		if ("".equals(pass)) {
			JOptionPane.showMessageDialog(lf, "비밀번호는 필수 입력!!");
			lf.getJpfPass().requestFocus();
			return;
		} // end if

		// 그렇지 않으면 loginCheck() 를 호출한다.
//		id = injectionBlock(id); //id와 비밀번호에 SQLInjection에 해당하는 값이 존재하면 삭제
//		pass = injectionBlock(pass);
		LoginVO lVO = new LoginVO(id, pass);
		loginCheck(lVO);

	}// chkEmpty

	public String injectionBlock(String sql) {
		String resultSql = sql;
		// 공백을 허용하지 않음, SQL주석 막기, 쿼리문에 해당하는 문자열 막기
		resultSql = sql.replaceAll(" ", "").replaceAll("--", "").replaceAll("select", "").replaceAll("insert", "")
				.replaceAll("delete", "").replaceAll("update", "");

		return resultSql;
	}// injectionBlock

	private void loginCheck(LoginVO lVO) {

		InjectionTestDAO ltDAO = InjectionTestDAO.getInstance();

		try {
//			LoginResultVO lrVO = ltDAO.useStatementLogin(lVO);
			LoginResultVO lrVO = ltDAO.usePreparedStatementLogin(lVO);

			if (lrVO == null) {
				JOptionPane.showMessageDialog(lf, "아이디나 비밀번호를 확인해주세요");
				lf.getJlblOutput().setText("");
				return;
			} // end if

			lf.getJlblOutput().setText(lrVO.getName() + "님 로그인 하셨습니다");

		} catch (SQLException e) {
			JOptionPane.showMessageDialog(lf, "아이디나 비밀번호를 확인해주세요");
			e.printStackTrace();
		} // end catch

	}// loginCheck

}// class
