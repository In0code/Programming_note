package day0713;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;

@SuppressWarnings("serial")
//1. 윈도우 컴포넌트를 상속받고, 이벤트 처리 리스너를 구현한다
public class Work0712 extends JFrame implements ActionListener {
	// 2. 이벤트에 관련된 컴포넌트를 선언
	private JTextField nameField;
	private JTextArea jta;

	public Work0712() {
		super("숙제");
		// 이름
		// 이벤트에 관련없는 컴포넌트는 지역에서 선언
		JLabel nameLabel = new JLabel("이름");
		nameField = new JTextField(10);

		// 입력
		JButton inputBtn = new JButton("입력");

		// 출력
		jta = new JTextArea();
		jta.setLineWrap(true);
		JScrollPane jsp = new JScrollPane(jta);
		jta.setBorder(new LineBorder(new Color(0xdfbff0), 2));

		JPanel jp = new JPanel();
		jp.add(nameLabel);
		jp.add(nameField);
		jp.add(inputBtn);
		jp.setBorder(new LineBorder(Color.PINK, 2));

		add("North", jp);
		add(jsp);

		inputBtn.addActionListener(this); // 버튼을 액션이벤트에 등록
		nameField.addActionListener(this); // TextField를 액션 이벤트에 등록

		setSize(300, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String name = nameField.getText().trim(); // 앞뒤 공백만 제거
		if (!name.isEmpty()) {
			// jTextArea에 이름을 추가
			jta.append(name + "님\n");
			// J.T.F에 값을 초기화
			nameField.setText("");
		} // end if
	}// actionPerformed
}
