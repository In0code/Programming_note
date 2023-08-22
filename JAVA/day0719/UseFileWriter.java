package day0719;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class UseFileWriter {

	public UseFileWriter() throws IOException {
		// 1. 파일 생성
		File file = new File("e:/dev/temp/write16.txt");
		FileWriter fw = null;

		try {
			// 2. 스트림을 연결
			fw = new FileWriter(file);
			// 3. 스트림에 쓰기
			String data = "오늘은 수요일";
			fw.write(data);
			// 4. 스트림의 내용을 목적지로 분출
			fw.flush();
		} finally {
			// 5. 연결끊기
			if (fw != null) {
				fw.close();
			} // end if
		} // end finally
	}// UseFileWriter

	public static void main(String[] args) {

		try {
			new UseFileWriter();
			System.out.println("파일에 기록하였습니다");
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
