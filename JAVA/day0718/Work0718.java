package day0718;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JOptionPane;

/**
 * 1. InputDialog를 사용하여 경로를 입력 받는다. 2. 입력된 문자열에 해당하는 경로가 존재하면 아래와 같이 디렉토리내 모든
 * 디렉토리와 파일명을 콘솔에 출력하는 프로그램을 작성.
 * 
 * 3. 디렉토리는 크기를 출력하지 않고 파일에 대해서만 byte로 크기를 출력해주세요.
 * 
 * @author user
 *
 */
public class Work0718 {

	public void inputFile() {

		String directoryPath = JOptionPane.showInputDialog("경로를 입력하세요", "e:/dev/temp");
		File file = new File(directoryPath);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		System.out.print("이름\t\t|수정한날짜\t\t|유형\t\t|크기\n");
		File[] files = file.listFiles();
		Date date = new Date(file.lastModified());
//		sdf.format(date);
		String fileCategory = null;
		if (file.exists()) {
			for (File filed : files) {
				if (filed.isFile()) {
					fileCategory = "파일";
				} else /* if (file.isDirectory()) */ {
					fileCategory = "폴더";
				} // end else
				System.out.printf("%s\t\t%s\t%s\t%dbyte\n", filed.getName(), sdf.format(date), fileCategory,
						filed.length());
			} // end for
		} // end if
	}// input

	public static void main(String[] args) {
		Work0718 w = new Work0718();
		w.inputFile();
	}// main
}// class
