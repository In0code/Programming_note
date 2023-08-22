package day0714;

import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

@SuppressWarnings("serial")
public class UseFileDialog extends JFrame implements ActionListener {

	private JMenuItem jmiOpen;
	private JMenuItem jmiSave;

	public UseFileDialog() {
		super("파일 다이얼로그 연습");

		JMenuBar jmb = new JMenuBar();
		JMenu jmFileDialog = new JMenu("파일다이얼로그");

		jmiOpen = new JMenuItem("열기 다이얼로그");
		jmiSave = new JMenuItem("저장 다이얼로그");

		jmiOpen.addActionListener(this);
		jmiSave.addActionListener(this);

		jmFileDialog.add(jmiOpen);
		jmFileDialog.add(jmiSave);

		jmb.add(jmFileDialog);

		setJMenuBar(jmb);

		setBounds(100, 100, 800, 600);
		setVisible(true);

//		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		addWindowListener(new WindowAdapter() {

			@Override
			public void windowClosing(WindowEvent we) {
				dispose();
			}// windowClosing

		});

	}// UseFileDialog

	@Override
	public void actionPerformed(ActionEvent ae) {

		if (ae.getSource() == jmiOpen) {
			// 1. 파일 다이얼로그를 열기 모드로 생성
			FileDialog fdOpen = new FileDialog(this, "Java - 파일열기", FileDialog.LOAD);
			// 2. 가시화
			fdOpen.setVisible(true);
			// 3. 선택한 경로명 얻기
			String path = fdOpen.getDirectory();
			// 4. 선택한 파일명 얻기
			String file = fdOpen.getFile();
			// 선택한 파일이 있을 때 경로와 파일명을 JFrame의 타이틀바에 설정해보세요
			// 파일 다이얼로그연습 - 경로파일명
			if (path != null) {
				setTitle("파일 다이얼로그 연습-" + path + file);
			} // end if
		}

			if (ae.getSource() == jmiSave) {
				// 1. 파일 다이얼로그를 열기 모드로 생성
				FileDialog fdSave = new FileDialog(this, "Java - 파일열기", FileDialog.LOAD);
				// 2. 가시화
				fdSave.setVisible(true);
				// 3. 선택한 경로명 얻기
				String path = fdSave.getDirectory();
				// 4. 선택한 파일명 얻기
				String file = fdSave.getFile();
				// 선택한 파일이 있을 때 경로와 파일명을 JFrame의 타이틀바에 설정해보세요
				// 파일 다이얼로그연습 - 경로파일명
				if (path != null) {
					setTitle("파일 다이얼로그 연습-" + path + file);
				} // end if
			
		} // end if

	}// actionPerformed

	public static void main(String[] args) {
		new UseFileDialog();
	}// main

}// class
