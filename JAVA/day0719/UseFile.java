package day0719;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class UseFile {

	/**
	 * 8bit와 16bit stream을 사용하여 한글이 깨지지 않도록 읽어들이기
	 * 
	 * @throws IOException
	 */
	public void useByteStream() throws IOException {
		// 1. File생성
		File file = new File("e:/dev/temp/java_read.txt");
//		File file = new File("e:/dev/temp/img5.jpg"); //이미지는 콘솔에 출력하면 알아볼 수 없다.
		if (file.exists()) {
			BufferedReader br = null;
			try {
				// 2. Stream을 연결
				br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));

				// 3. 파일의 내용을 줄 단위로 읽어 들임
				String temp = "";
				while ((temp = br.readLine()) != null) {
					System.out.println(temp);
				} // end while
					// 4. 연결을 끊기 ( 가장 중요 - 반드시 해야한다. )
			} finally { // try~finally block에서 예외가 발생하면 finally 내의 코드를 실행하고 호출한 곳으로 돌아간다.
				if (br != null) {
					br.close();
				} // if로 NullPointerException을 대체할 수 있음.

			} // end finally
		} // end if
	}// useByteStream

	public void useStringStream() throws IOException {
		// 1. 파일정보 얻기
		File file = new File("e:/dev/temp/java_read.txt"); //txt는 독자 포멧이 없는 파일 읽기 가능
//		File file = new File("e:/dev/temp/test.hwp"); //한컴에 개발한 독자포멧이 있는 파일은 보여지지 않는다
		if (file.exists()) {
			// 2. 파일에 스트림 연결
			BufferedReader br = null;
			try {
				br = new BufferedReader(new FileReader(file));
				// 3. 파일의 내용을 줄단위로 읽기
			String temp="";
			StringBuilder sbData=new StringBuilder();
			//while은 boolean이 들어가야함. true, false로 해야함. 이자체를 true, false로 만들어 주기 위해 null이 아니니 를 넣어줘야함
			while((temp=br.readLine()) != null) { 
				sbData.append(temp).append("\n");
			}//end while
			
			JTextArea jta=new JTextArea(10,80);
			jta.setText(sbData.toString());
			JScrollPane jsp=new JScrollPane(jta);
			JOptionPane.showMessageDialog(null, jsp);
			
			} finally {
				// 4. 연결끊기
				if (br != null) {
					br.close();
				} // end if
			} // end finally

		} // end if
	}// useStringStream

	public static void main(String[] args) {

		UseFile uf = new UseFile();
		try {
//			uf.useByteStream();
			uf.useStringStream();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
