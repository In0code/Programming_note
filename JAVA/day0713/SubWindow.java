package day0713;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

@SuppressWarnings("serial")
public class SubWindow extends JDialog {

	private MainWindow mw;
	private SubWindow sw;
	public SubWindow() {
		
	}

	public SubWindow(MainWindow mw) {
		super(mw, "자식창 타이틀바", false);
		this.mw = mw;
		// 기본 Layout은 BorderLayout
		JLabel jlbl = new JLabel(new ImageIcon("E:/dev/workspace/java_se/src/day0713/img5.jpg"));
		sw=this;
		JButton jbtn = new JButton("클릭");

		jbtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JOptionPane.showMessageDialog(sw, "집에갈 때 비 안오면 좋겠다");
			}
		});
		setLayout(null); // BorderLayout 해제

		jlbl.setBounds(0, 0, 644, 960);
		
		jbtn.setBounds(300, 500, 80, 30);

		add(jlbl);
		add(jbtn);

//		setBounds(0, 0, 644, 960);
		//부모창의 좌표를 얻어와서 자식창 띄우기
		setBounds(mw.getX()+100, mw.getY()+100, 644, 960);
		setVisible(true);
		
		//Dialog는 setVisible 전에 이벤트가 등록되어야 한다.

		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// SubWindow

}// class
