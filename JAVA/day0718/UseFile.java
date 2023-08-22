package day0718;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JOptionPane;

public class UseFile {

	public void fileInfo() {

//		File file = new File("e:/dev/temp");
		File file = new File("e:/dev/temp/java_read.txt");
		System.out.println(file);

		if (file.exists()) {
			System.out.println(file.isFile() ? "파일" : "디렉토리");
			System.out.println(file.isDirectory() ? "디렉토리" : "파일");
			System.out.println("읽기" + (file.canRead() ? "가능" : "불가능"));
			System.out.println("쓰기" + (file.canWrite() ? "가능" : "불가능"));
			System.out.println(file.isHidden() ? "숨김파일" : "일반파일");
			System.out.println("파일의 길이(크기) : " + file.length() + "byte");
			System.out.println("파일의 절대경로 : " + file.getAbsolutePath());
			try {
				System.out.println("파일의 규범경로 : " + file.getCanonicalPath());
			} catch (IOException e) {
				e.printStackTrace();
			} // end catch
			System.out.println(file.canExecute() ? "실행가능" : "실행불가능");
			System.out.println("파일이 위치하는 디렉토리명 : " + file.getParent());
			System.out.println("파일명 : " + file.getName());
			System.out.println("파일dl 마지막으로 수정된 날자 : " + file.lastModified());

			Date date = new Date(file.lastModified());
			System.out.println(new SimpleDateFormat("yyy-MM-dd hh:mm:ss").format(date));
		} else {

			System.out.println("파일이 존재하지 않습니다");
		} // end if

	}// fileInfo

	public void createDirectory() {
		// 상위 디렉토리가 존재하면 file.mkdirs()와 file.mkdir()가 동일한 동작을 함
//		File file = new File("e:/dev/temp/kiy");
//		if (file.mkdirs()) {
//			System.out.println("디렉토리 생성");
//		} else {
//			System.out.println("디렉토리 실패");
//		} // end else

		// mkdirs()는 부모 디렉토리가 없다면 부모디렉토리부터 생성한다
		// mkdir()은 부모 디렉토리가 존재하지 않으면 생성하지 않는다.
//		File file = new File("e:/dev222/temp/kiy");
//		if (file.mkdir()) {
//			System.out.println("디렉토리 생성");
//		} else {
//			System.out.println("디렉토리 실패");
//
//		} // end else

		// 1. InputDialog를 제공하여 사용자에게 생성할 디렉토리 경로를 입력받는다
		// e:/dev/abc
		// 2. 디렉토리가 존재하지 않으면 "디렉토리가 존재하지 않습니다. 생성할까요?"
		// 라는 confirmDialog를 제공하고 "예"가 눌리면 디렉토리를 생성한 후
		// 3. messageDialog로 "생성되었습니다"를 보여준다

		String inputFile = JOptionPane.showInputDialog("생성할 디렉톨의 경로를 입력하세요", "e:/dev/abc");

		File file = new File(inputFile);
		if (file.exists()) {
			file.mkdirs();
		} else {
			int num = JOptionPane.showConfirmDialog(null, "디렉토리가 존재하지 않습니다. 생성할까요?");
			switch (num) {

			case 0:
				file.mkdirs();
				JOptionPane.showMessageDialog(null, "생성되었습니다");
				break;
			case 1:
				JOptionPane.showMessageDialog(null, "\"아니요\"를 선택하셨습니다. \n파일이 생성되지 않았습니다");

				break;
			case 2:
				JOptionPane.showMessageDialog(null, "\"취소\"하셨습니다");

			}// end switch
		} // end else

	}// createDirectory

	public void removeFile() {
		// 1. 삭제할 파일의 경로로 파일을 생성
		File file = new File("e:/dev/temp/a.txt");
		// 2. 삭제
		if (file.delete()) {
			System.out.println("파일 삭제");
		} else {
			System.out.println("파일이 삭제되지 않았습니다");
		} // end else

	}// removeFile

	public void rename() {
		// 1. 변경전 이름을 가진 객체 생성
		File file = new File("e:/dev/temp/b.txt");
		// 2. 변경할 이름을 가진 객체 생성
		File renameFile = new File("e:/dev/temp/kiy.txt");

		// 3. 변경
		if (file.renameTo(renameFile)) {
			System.out.println("파일명이 변경되었습니다");
		} else {
			System.out.println("파일명이 변경되지 않았습니다");
		} // end else

	}// rename

	public static void main(String[] args) {

		UseFile uf = new UseFile();
//		uf.fileInfo();
//		uf.createDirectory();
//		uf.removeFile();
		uf.rename();

	}// main

}// class
