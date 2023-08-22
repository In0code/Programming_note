package day0718;

import java.awt.FileDialog;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class UseFileInputStream {

	public UseFileInputStream() throws IOException{

		// 8bit stream을 사용하여 File에 연결하고 파일내용을 읽기
		JFrame jframe = new JFrame();
		FileDialog fdOpen = new FileDialog(jframe, "파일을 선택해 주세요", FileDialog.LOAD);
		fdOpen.setVisible(true);

		String path = fdOpen.getDirectory();

		if (path != null) {
			File file = new File(path + fdOpen.getFile());
			if (file.exists()) { // 파일이 존재하면
				// 1. Stream을 파일에 연결해야함.
				FileInputStream fis = new FileInputStream(file);
				// 2. 반복문을 사용하여 파일에서 데이터를 읽어온 후 데이터를 출력
				int data=0;
				while((data=fis.read()) != -1) {
					System.out.print((char)data);
				}
				// 3.스트림 연결 끊기
				fis.close();
			} else {
				JOptionPane.showMessageDialog(null, "파일이 존재하지 않습니다");
			} // end else
		} // end if

		System.exit(0);

	}// UseFileInputStream

	public static void main(String[] args) throws IOException {
		try {
			new UseFileInputStream();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}// main

}// class
