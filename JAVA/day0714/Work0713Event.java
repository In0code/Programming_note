package day0714;

import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JOptionPane;

public class Work0713Event extends KeyAdapter {

	private Work0713 w;
	private Map<String, String> mapAuth;

	public Work0713Event(Work0713 w) {
		this.w = w;
		mapAuth = new HashMap<String, String>();
		mapAuth.put("admin", "1234");
		mapAuth.put("kang", "test1234");
		mapAuth.put("kim", "4321");
		mapAuth.put("lee", "sunkyung");
	}// Work0713Event

	@Override
	public void keyPressed(KeyEvent ke) {
		String id = w.getJtfId().getText();
		// ID확인
		if (ke.getSource() == w.getJtfId() && ke.getKeyCode() == KeyEvent.VK_ENTER) {
			if (mapAuth.containsKey(id)) {
				w.getJpfPw().requestFocus();
			} else {
				JOptionPane.showMessageDialog(w, "ID가 존재하지 않습니다");
				w.getJtfId().setText("");
			} // end else
		} // end if

		// PW확인
		if (ke.getSource() == w.getJpfPw() && ke.getKeyCode() == KeyEvent.VK_ENTER) {
			//String 클래스의 생성자중 char[] 를 받는 생성자를 사용하여 객체를 생성한다
//			String strPw = new String(w.getJpfPw().getPassword());
			String strPw = String.valueOf(w.getJpfPw().getPassword());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			
			if (mapAuth.get(id).equals(strPw)) {
				w.getJlblOutput().setText(id + "님 " + sdf.format(new Date()) + "초에 로그인 하셨습니다.");
			} else {
				JOptionPane.showMessageDialog(w, "비밀번호를 확인하세요!!");
				w.getJpfPw().setText("");
			} // end else
		} // end if

	}// keyPressed

}// class
