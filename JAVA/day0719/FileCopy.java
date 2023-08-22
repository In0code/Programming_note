package day0719;

import java.awt.BorderLayout;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class FileCopy extends JFrame implements ActionListener {
	private JLabel jlblOutput;
	private JProgressBar jpb;
	int value;

	public FileCopy() {
		super("파일 복사");

		jpb = new JProgressBar();
//		jpb.setValue();
		jlblOutput = new JLabel("출력창");
		jlblOutput.setBorder(new TitledBorder("출력창"));

		JButton jbtnFileSelect = new JButton("파일선택");
		JPanel jpCenter = new JPanel();
		jpCenter.setLayout(new BorderLayout());

		jpCenter.add("North", jbtnFileSelect);
		jpCenter.add("South", jpb);

		add("Center", jpCenter);
		add("South", jlblOutput);

		jbtnFileSelect.addActionListener(this);
		setBounds(100, 100, 400, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}// FileCopy

	public void selectFile() {
		FileDialog fdOpen = new FileDialog(this, "복사할 파일 선택", FileDialog.LOAD);
		fdOpen.setVisible(true);

		String path = fdOpen.getDirectory();
		String name = fdOpen.getFile();
		if (path != null) {
//			jpb.setValue(0);
//			for (int i = 0; i < jpb.getMaximum() + 1; i++) {
//				jpb.setValue(i);
//			} // end for
			value = 0;

			try {
				fileCopy(path + name);
				JOptionPane.showMessageDialog(this, "파일을 복사하였습니다");
			} catch (IOException e) {
				JOptionPane.showMessageDialog(this, "죄송합니다. \n파일을 복사하는 도중 문제 발생");
				e.printStackTrace();
			} // end catch

		} // end if
	}// selectFile

	public void fileCopy(String path) throws IOException {

		// 1.파일을 생성
		File orignalFile = new File(path);
		// 복사할 파일명은 원본파일명에 _bak붙은 이름으로 생성
		// 예) a.txt => a_bak.txt
		StringBuilder tempPath = new StringBuilder(orignalFile.getAbsolutePath());
		tempPath.insert(tempPath.lastIndexOf("."), "_bak");

		File copyFile = new File(tempPath.toString());

		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			// 2. 입력스트림을 생성
			fis = new FileInputStream(orignalFile);
			// 3. 출력스트림을 생성
			fos = new FileOutputStream(copyFile);
			// 4. 파일에서 읽어들인 내용을 출력스트림을 통해 내보낸다
			int readCnt = 0;
			int cnt = 0;
			byte[] readData = new byte[512]; // 일어들인 값을 저장할 배열
			byte[] readData1 = new byte[512]; // 일어들인 값을 저장할 배열
			while ((readCnt = fis.read(readData1)) != -1) {
				// 방의 값을 저장하고, 저장한 방의 개수를 반환
				cnt++; // 512byte씩 읽어들였을 때 총 갯수
			} // end while
			fis.close(); // 스트림은 한 번 진행하면 뒤로 돌아가지 않는다.
			fis = new FileInputStream(orignalFile); // 파일 포인터를 처음으로 옮기기 위해서 재연결
			int temp = 0;
			readCnt = 0;
			System.out.println(cnt);
			while ((readCnt = fis.read(readData)) != -1) {
				temp++;
				// 방에 값을 저장하고, 저장한 방의 개수를 반환
				jpb.setValue((temp * 100) / cnt); // 현재 반복수가 전체수의 몇 %인지 연산하여 설정
				fos.write(readData, 0, readCnt);
			}
			System.out.println(temp + "번 읽어들임");
			// 5.스트림의 내용을 분출
			fos.flush();
		} finally {
			// 6. 연결끊기
			if (fis != null) {
				fis.close();
			} // end if
			if (fos != null) {
				fos.close();
			} // end if
		} // end finally
	}// fileCopy

	@Override
	public void actionPerformed(ActionEvent e) {
		selectFile();
//		value++;
	}// actionPerformed

	public static void main(String[] args) {
		new FileCopy();
	}// main

}// class
