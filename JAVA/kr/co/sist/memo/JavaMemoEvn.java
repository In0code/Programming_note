package kr.co.sist.memo;

import java.awt.FileDialog;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import javax.swing.JOptionPane;

public class JavaMemoEvn extends WindowAdapter implements ActionListener {
	private JavaMemo jm;
	private FileDialog fd;
	private boolean flag;
	private boolean openBoolean;
	private StringBuffer sbTemp;

	private String dir;
	private String name;
	private BufferedWriter bw;

	private Font font;

	public JavaMemoEvn(JavaMemo jm) {
		this.jm = jm;
		flag = true;
		try {
			fontInput();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // end catch
	}// JavaMemoEvn

	// IO method
	// 데이터 저장
	public void fileSaveOutput() throws IOException {
		try {
			if (fd.getDirectory() != null) {
				dir = fd.getDirectory();
				if (fd.getFile().contains(".txt")) {
					name = fd.getFile();
				} else {
					name = fd.getFile() + ".txt";
				} // end else
				File file = new File(dir + "/" + name);
				bw = new BufferedWriter(new FileWriter(file));
				bw.write(jm.getJta().getText());
				bw.flush();
			} // end if
		} finally {
			if (bw != null) {
				bw.close();
			} // end if
			jm.setTitle(name);
		} // end finally
	}// fileSaveOutput

	// 데이터 덮어쓰기
	public void overwrite() throws IOException {
		try {
			File file = new File(dir + "/" + name);
			bw = new BufferedWriter(new FileWriter(file));
			bw.write(jm.getJta().getText());
			bw.flush();
		} finally {
			if (bw != null) {
				bw.close();
			} // end if
		} // end finally
	}// overwrite

	// 데이터 열기
	public void fileOpenInput() throws IOException {
		dir = fd.getDirectory();
		name = fd.getFile();
		File file = new File(dir + "/" + name);
		BufferedReader br = null;
		sbTemp = new StringBuffer();
		if (openBoolean && file.exists()) {
			try {
				br = new BufferedReader(new FileReader(file));
				String str = "";
				while ((str = br.readLine()) != null) {
					jm.getJta().append(str + "\n");
					sbTemp.append(str + "\n");
				} // end while
			} finally {
				if (br != null) {
					br.close();
					// 불러온 파일명 타이틀로 변경
					jm.setTitle(name);
				} // end if
			} // end finally
		} // end if
	}// fileOpenInput

	// 5. 프로그램이 종료되면 현재 글꼴 상태를 저장한 후 다음번 실행시 이전 글꼴을 적용
	// font저장용
	public void fontOutput() throws IOException {
		font = jm.getJta().getFont();
		ObjectOutputStream oos = null;
		File file = new File("E:/dev/temp/font.bat");
		try {
			oos = new ObjectOutputStream(new FileOutputStream(file));
			oos.writeObject(font);
			oos.flush();
		} finally {
			if (oos != null) {
				oos.close();
				System.out.println("폰트 저장하기 성공");
			} // end if
		} // end finally
	}// fontData

	// font불러오기
	public void fontInput() throws IOException, ClassNotFoundException {
		ObjectInputStream ois = null;
		File file = new File("E:/dev/temp/font.bat");
		try {
			ois = new ObjectInputStream(new FileInputStream(file));
			font = (Font) ois.readObject();
		} finally {
			if (ois != null) {
				ois.close();
				System.out.println("폰트 불러오기 성공");
				jm.getJta().setFont(font);
			} // end if
		} // end finally
	}// fontInput

	// 메뉴바 새글 메소드
	public void fileNew() {
		// 1-1 메모장 내용이 없으면 타이틀바 "메모장 -새글" 설정
		if (jm.getJta().getText().equals("")) {
			jm.setTitle("메모장 -새글");
		} // end if

		// 1-2 열기를 하지 않은 상태에서 내용이 있다면 저장여부를 묻고 파일명 설정하여 저장후 JTA초기화
		if (!openBoolean && !jm.getJta().getText().equals("")) {
			int option = JOptionPane.showConfirmDialog(jm, "변경 내용을 제목 없음에 저장하시겠습니까?", "메모장",
					JOptionPane.YES_NO_CANCEL_OPTION);
			switch (option) {
			case JOptionPane.OK_OPTION:
				fileSave();
				jm.getJta().setText("");
				break;
			default:
				jm.getJta().setText("");
				break;
			}// end switch
		} // end if

		// 1-3 열기를 한 상태에서 기존의 내용과 변경된 내용이 있는지 확인하고
		if (openBoolean) {
			// 1-3-1 변경되지 않았다면 JTA초기화
			if (jm.getJta().getText().equals(sbTemp.toString())) {
				jm.getJta().setText("");
				jm.setTitle("메모장 -새글");
			} else if (!jm.getJta().getText().equals(sbTemp.toString())) {
				// 1-3-2 변경되었다면 저장 여부를 확인하고 열었던 파일에 저장한 후 (덮어쓰기) JTA초기화
				int option = JOptionPane.showConfirmDialog(jm, "변경 내용을 덮어쓰겠습니까?", "메모장",
						JOptionPane.YES_NO_CANCEL_OPTION);
				switch (option) {
				case JOptionPane.OK_OPTION:
					try {
						overwrite();
						jm.getJta().setText("");
						jm.setTitle("메모장 -새글");
					} catch (IOException e) {
						e.printStackTrace();
					} // end catch
					break;
				case JOptionPane.NO_OPTION:
					jm.getJta().setText("");
					break;
				default:
				}// end switch
			} // end else
		} // end if
	}// fileNew

	// 메뉴바 열기 메소드
	public void fileOpen() {
		try {
			// 2-1 JTA에 내용이 있는 상태에서 열기가 눌리면 저장여부를 묻고 파일명 설정 후 열기 다이어리 제공 후 파일 로드시 JTA에 파일내용
			// 넣기
			if (!openBoolean && !jm.getJta().getText().equals("")) {
				int option = JOptionPane.showConfirmDialog(jm, "2-1 : 변경 내용을 제목 없음에 저장하시겠습니까?", "메모장",
						JOptionPane.YES_NO_CANCEL_OPTION);
				switch (option) {
				case JOptionPane.OK_OPTION:
					fileSave();
					jm.getJta().setText("");
					break;
				default:
					jm.getJta().setText("");
					break;
				}// end switch
			} // end if
			openBoolean = true;
			if (sbTemp != null) {
				// 2-2 열기를 한 상태에서 기존의 내용과 변경된 내용이 있는지 판단하여
				if (jm.getJta().getText().equals(sbTemp.toString())) {
					// 2-2-1 변경된 내용이 없다면 JTA초기화
					jm.getJta().setText("");
				} else {
					// 2-2-2 변경된 내용이 있다면 저장여부를 묻고, 열었던 파일에 저장(덮어쓰기)후 JTA초기화
					int option = JOptionPane.showConfirmDialog(jm, "변경 내용을 " + name + "에 덮어쓰겠습니까?", "메모장",
							JOptionPane.YES_NO_CANCEL_OPTION);
					switch (option) {
					case JOptionPane.OK_OPTION:
						overwrite();
						jm.getJta().setText("");
						break;
					default:
						jm.getJta().setText("");
						break;
					}// end switch
				} // end if
			} // end if
			fd = new FileDialog(jm, "열기", FileDialog.LOAD);
			fd.setVisible(true);
			fileOpenInput();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// fileOpen

	// 메뉴바 저장 메소드
	public void fileSave() {

		try {
			if (!openBoolean) {
				// 3-1 파일을 열지 않았다면 새이름으로 저장
				fd = new FileDialog(jm, "저장", FileDialog.SAVE);
				fd.setFile("제목없음");
				fd.setVisible(true);
				fileSaveOutput();
			} else {
				// 3-2 파일을 열었다면 기존에 파일에 저장(덮어쓰기)
				overwrite();
			} // end else
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// fileSave

	// 메뉴바 다른이름 저장 메소드
	// 4-1 파일 다이얼로그를 띄어서 저장수행
	public void fileNewSave() {
		fd = new FileDialog(jm, "다른이름 저장", FileDialog.SAVE);
		fd.setVisible(true);
		try {
			fileSaveOutput();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// fileNewSave

	// 메뉴바 닫기 메소드
	public void memoClose() {
		jm.dispose();
	}// memoClose

	// 메뉴바 폰트 메소드
	public void font() {
		new JavaMemoFont(jm);
		try {
			fontOutput();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// font

	// 자동 줄바꿈 메소드
	public void wrap() {
		if (flag) {
			flag = false;
		} else {
			flag = true;
		} // end else
		jm.getJta().setLineWrap(!flag);
	}// wrap

	// 메뉴바 도움 메소드
	public void help() {
		Object[] options = { "닫기" };
		String info = "이 메모장은 자바언어로 만들어진\n메모장으로 License는\nPL(Public License)로 자유롭게\n배포하고 사용하실 수 있습니다.\n작성자 김주민";
		JOptionPane.showOptionDialog(jm, info, "메모장 정보", JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, null,
				options, options[0]);
	}// help

	// 종료
	@Override
	public void windowClosing(WindowEvent we) {
		jm.dispose();
	}// windowClosing

	@Override
	public void actionPerformed(ActionEvent ae) {
		// 새글
		if (ae.getSource() == jm.getJmiNew()) {
			fileNew();

		} // end if

		// 닫기
		if (ae.getSource() == jm.getJmiClose()) {
			memoClose();
		} // end if

		// 열기
		if (ae.getSource() == jm.getJmiOpen()) {
			fileOpen();
		} // end if

		// 저장
		if (ae.getSource() == jm.getJmiSave()) {
			fileSave();
		} // end if

		// 다른이름 저장
		if (ae.getSource() == jm.getJmiNewSave()) {
			fileNewSave();
		} // end if

		// 폰트
		if (ae.getSource() == jm.getJmiFont()) {
			font();
		} // end if

		// 자동줄바꿈
		if (ae.getSource() == jm.getJmiWrap()) {
			wrap();
		} // end if

		// 도움말
		if (ae.getSource() == jm.getJmiHelp()) {
			help();
		} // end if
	}// actionPerformed

}// class
