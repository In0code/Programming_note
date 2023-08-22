package day0821;

import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class LoginForm extends JFrame {

	private JTextField jtfId;
	private JPasswordField jpfPass;
	private JLabel jlblOutput;

	public LoginForm() {
		super("로그인");
		jtfId = new JTextField();
		jpfPass = new JPasswordField();
		jlblOutput = new JLabel("출력창");

		jtfId.setBorder(new TitledBorder("아이디"));
		jpfPass.setBorder(new TitledBorder("비밀번호"));
		jlblOutput.setBorder(new TitledBorder("결과"));

		setLayout(new GridLayout(3, 1));

		Font font = new Font("맑은 고딕", Font.BOLD, 25);
		jtfId.setFont(font);
		jpfPass.setFont(font);
		jlblOutput.setFont(font);

		add(jtfId);
		add(jpfPass);
		add(jlblOutput);

		LoginFormEvt lfe = new LoginFormEvt(this);
		jtfId.addActionListener(lfe);
		jpfPass.addActionListener(lfe);

		addWindowListener(lfe);

		setBounds(100, 100, 400, 250);
		setVisible(true);

	}// LoginForm

	public JTextField getJtfId() {
		return jtfId;
	}

	public JPasswordField getJpfPass() {
		return jpfPass;
	}

	public JLabel getJlblOutput() {
		return jlblOutput;
	}

	public static void main(String[] args) {
		new LoginForm();
	}// main

}// class
