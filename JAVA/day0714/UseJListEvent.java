package day0714;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JScrollBar;
import javax.swing.JTextField;

public class UseJListEvent extends WindowAdapter implements ActionListener, MouseListener {

	private UseJList ujl;

	public UseJListEvent(UseJList ujl) {
		this.ujl = ujl;
		// 기본 친구 세팅
		setFriends();

	}// UseJListEvent

	public void setFriends() {
		DefaultListModel<String> dlm = ujl.getDlmFriends();
		dlm.addElement("강다연");
		dlm.addElement("김다영");
		dlm.addElement("김선경");
		dlm.addElement("김인영");
		dlm.addElement("김주민");
		dlm.addElement("박상준");
	}// setFriends

	public void addFriend() {
		JTextField jtfName = ujl.getJtfInputName();
		String name = jtfName.getText().trim();
		if (!name.isEmpty()) {
			DefaultListModel<String> dlm = ujl.getDlmFriends();
			dlm.addElement(name);
			jtfName.setText("");
			// 수직 스크롤 바를 얻고
			JScrollBar jsb = ujl.getJspFriends().getVerticalScrollBar();
			// 수직 스크롤바의 최고값으로 수직 스크롤 바의 값을 설정한다
			jsb.setValue(jsb.getMaximum());
		} // end if

	}// addFriend

	public void moveblockFriend() {
		// jlFriends가 클릭되면 아이템의 값을 가져와서
		// ConfirmDialog로 물어본 후 "예"가 눌리면
		// jlFriends에서 삭제하고 jlBlockFriends에 추가한다
		// 값을 관리하는 Model 객체를 가져온다.
		DefaultListModel<String> dlmFrined = ujl.getDlmFriends();
		DefaultListModel<String> dlmBlockFrined = ujl.getDlmBlockFriends();

		// 디자인을 제공하는 View 객체를 가져온다.
		JList<String> jlFriends = ujl.getJlFriends();

//		String name = dlmFrined.getElementAt(jlFriends.getSelectedIndex());
		String name = jlFriends.getSelectedValue();
		if (name != null) {
			int selectionValue = JOptionPane.showConfirmDialog(ujl, name + "을 차단하겠습니까?", "친구도 아님",
					JOptionPane.YES_NO_OPTION);

			switch (selectionValue) {
			case JOptionPane.OK_OPTION:
				dlmFrined.removeElement(name);
				dlmBlockFrined.addElement(name);
			}// end switch
		} // end if
	}// moveblockFriend

	public void moveFriend() {
		// jlblockFriends가 클릭되면 아이템의 값을 가져와서
		// ConfirmDialog로 물어본 후 "예"가 눌리면
		// jlblockFriends에서 삭제하고 jlFriends에 추가한다
		DefaultListModel<String> dlmFrined = ujl.getDlmFriends();
		DefaultListModel<String> dlmBlockFrined = ujl.getDlmBlockFriends();

		// 디자인을 제공하는 View 객체를 가져온다.
		JList<String> jlBlockFriends = ujl.getJlBlockFriends();

		String name = dlmBlockFrined.getElementAt(jlBlockFriends.getSelectedIndex());
//		String name = dlmFriend();
		if (name != null) {
			int selectionValue = JOptionPane.showConfirmDialog(ujl, name + "을 차단해제하겠습니까?", "친구둥록",
					JOptionPane.YES_NO_OPTION);

			switch (selectionValue) {
			case JOptionPane.OK_OPTION:
				dlmBlockFrined.removeElement(name);
				dlmFrined.addElement(name);
			}// end switch
		} // end if
	}// moveFriend

	@Override
	public void actionPerformed(ActionEvent e) {
		addFriend();
	}// actionPerformed

	@Override
	public void windowClosing(WindowEvent e) {
		ujl.dispose();
	}// windowClosing

	@Override
	public void mouseClicked(MouseEvent me) {
		switch (me.getButton()) {
		case MouseEvent.BUTTON1:
			if (me.getSource() == ujl.getJlFriends()) {
				moveblockFriend(); // 친구에서 차단으로
			} // end if
			if (me.getSource() == ujl.getJlBlockFriends()) {
				moveFriend(); // 차단에서 친구로
			} // end if
		}// end switch
	}// mouseClicked

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {

	}

	@Override
	public void mousePressed(MouseEvent e) {

	}

	@Override
	public void mouseReleased(MouseEvent e) {

	}

}// class
