package day0713;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

/**
 * 1.아이디에서 엔터가 눌려지면 아이디가 존재하는지 확인 한 후 존재한다면 비밀번호로 이동한다. 사용 method requestFocus()
 * 
 * 2.비밀번호에서 엔터가 눌려지면 아이디와 비밀번호가가 존재하는지 확인 한 후 존재한다면 로그인 작업을 수행한다. 아래 아이디로 인증된다면
 * 출력 라벨에 “xxxx님 yyyy-mm-dd hh:mm:ss 초에 로그인 하셨습니다.” 를 넣어 보여주세요
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
public class Work0713 extends JFrame {

	private JTextField jtfID;
	private JPasswordField jpfPW;
	private String Id;
	private JLabel jlbInput;

	public Work0713() {
		super("Login");

		JLabel jlblID = new JLabel("아이디 :");
		JLabel jlblPW = new JLabel("비밀번호 :");
		jlbInput = new JLabel();
		jtfID = new JTextField();
		jpfPW = new JPasswordField();
		jtfID.setBorder(new LineBorder(Color.ORANGE));
		jpfPW.setBorder(new LineBorder(Color.BLUE));

		setLayout(null);
		jtfID.setBackground(Color.magenta);
		jpfPW.setBackground(Color.magenta);

		jlblID.setBounds(10, -8, 90, 90);
		jlblPW.setBounds(5, 34, 90, 90);
		jtfID.setBounds(90, 23, 180, 34);
		jpfPW.setBounds(90, 63, 180, 34);
		jlbInput.setBounds(10, 135, 400, 50);
		add(jtfID);
		add(jpfPW);
		add(jlbInput);
		add(jlblID);
		add(jlblPW);

		Font font = new Font("궁서체", Font.BOLD, 15);
		Font font2 = new Font("Serif", Font.BOLD | Font.ITALIC, 11);
		jlbInput.setFont(font);
		jlblID.setFont(font);
		jlblPW.setFont(font);
		jlbInput.setFont(font2);

		jtfID.addKeyListener(new KeyAdapter() {

			@Override
			public void keyPressed(KeyEvent ke) {
				Id = jtfID.getText().trim();
				if (ke.getKeyCode() == KeyEvent.VK_ENTER) {
					if (!Id.isEmpty()) {
						jpfPW.requestFocus();
					} // end if
				} // end if

			}// keyPressed

		});

		jpfPW.addKeyListener(new KeyAdapter() {

			@Override
			public void keyPressed(KeyEvent ke) {

				Date date = new Date();
				String value = "";
				SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
				String[] id = "admin,kang,kim,lee".split(",");
				String[] pw = "1234,test1234,4321,sunkyung".split(",");
				value = sdfTime.format(date);
				if (ke.getKeyCode() == KeyEvent.VK_ENTER) {
					for (int i = 0; i < id.length; i++) {
						if (id[i].equals(jtfID.getText()) && pw[i].equals(new String(jpfPW.getPassword()))) {
							jlbInput.setText(id[i] + "님 " + value + "초에 로그인 하셨습니다.");
						} else {
							JOptionPane.showMessageDialog(jlblPW, "아이디와 비밀번호를 다시 확인하세요");
							break;
						} // end if
					} // end for
				} // end if

			}// keyPressed

		});

		setSize(300, 250);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// Work0713

	public static void main(String[] args) {
		new Work0713();
	}// main

}// class