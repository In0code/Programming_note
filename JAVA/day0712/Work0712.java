package day0712;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

@SuppressWarnings("serial")
public class Work0712 extends JFrame implements ActionListener {
	private JTextArea jta;
	private JTextField jtEmpty;

	public Work0712() {
		super("숙제");

		JLabel jlName = new JLabel("  이름  ");

		jta = new JTextArea();
		JScrollPane jsp = new JScrollPane(jta);
		jtEmpty = new JTextField(20); // 입력받을 글자 수
		JButton jbInput = new JButton("입력");
		setLayout(new BorderLayout());
		JPanel jpNorth = new JPanel();
		jbInput.addActionListener(this);
		jpNorth.add(jlName);
		jpNorth.add(jtEmpty);
		jpNorth.add(jbInput);

		add(jpNorth, "North");
		add(jsp, "Center");

		jta.setLineWrap(true);
		jta.setWrapStyleWord(true);
		setSize(500, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// Work0712

	@Override
	public void actionPerformed(ActionEvent e) {

		if (!jtEmpty.getText().isEmpty()) {

			jta.setText("\n  강다연님\n  김다영님\n  김선경님");
			jta.getText();
		}//end if
	}// actionPerformed

	public static void main(String[] args) {
		new Work0712();
	}// main

}// class