package day0714;

import java.awt.Font;

import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class UseJList extends JFrame {

	private JList<String> jlFriends;
	private JList<String> jlBlockFriends;

	private DefaultListModel<String> dlmFriends;
	private DefaultListModel<String> dlmBlockFriends;

	private JTextField jtfInputName;

	private JScrollPane jspFriends;
	private JScrollPane jspBlockFriends;

	private UseJList() {
		super("내 친구인가?");

		dlmFriends = new DefaultListModel<String>();
		dlmBlockFriends = new DefaultListModel<String>();

		jlFriends = new JList<String>(dlmFriends);
		jlBlockFriends = new JList<String>(dlmBlockFriends);

		jtfInputName = new JTextField();
		Font font = new Font("맑은 고딕", Font.BOLD, 15);
		jtfInputName.setFont(font);
		jlFriends.setFont(font);
		jlBlockFriends.setFont(font);

		jspFriends = new JScrollPane(jlFriends);
		jspBlockFriends = new JScrollPane(jlBlockFriends);

		jspFriends.setBorder(new TitledBorder("친구"));
		jspBlockFriends.setBorder(new TitledBorder("차단된 친구"));
		jtfInputName.setBorder(new TitledBorder("친구추가"));

		setLayout(null);

		jtfInputName.setBounds(10, 10, 200, 45);
		jspFriends.setBounds(10, 70, 200, 260);
		jspBlockFriends.setBounds(250, 70, 200, 260);

		// 다자인 클래스에서 이벤트 클래스를 생성
		UseJListEvent ujle = new UseJListEvent(this);

		jtfInputName.addActionListener(ujle);

		jlFriends.addMouseListener(ujle);
		jlBlockFriends.addMouseListener(ujle);

		addWindowListener(ujle);

		add(jtfInputName);
		add(jspFriends);
		add(jspBlockFriends);

		setSize(500, 400);
		setVisible(true);

		setResizable(false);

	}// UseJList

	public JList<String> getJlFriends() {
		return jlFriends;
	}

	public JList<String> getJlBlockFriends() {
		return jlBlockFriends;
	}

	public DefaultListModel<String> getDlmFriends() {
		return dlmFriends;
	}

	public DefaultListModel<String> getDlmBlockFriends() {
		return dlmBlockFriends;
	}

	public JTextField getJtfInputName() {
		return jtfInputName;
	}

	public JScrollPane getJspFriends() {
		return jspFriends;
	}

	public JScrollPane getJspBlockFriends() {
		return jspBlockFriends;
	}

	public static void main(String[] args) {
		new UseJList();
	}// main

}// class
