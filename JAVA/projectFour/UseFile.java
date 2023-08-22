package projectFour;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UseFile {

	public List<String> readLogFile(File file) throws IOException {

		List<String> logList = null;
		if (file.exists()) {

			logList = new ArrayList<String>();
			BufferedReader br;
			br = new BufferedReader(new FileReader(file));
			try {
				String temp = "";

				while ((temp = br.readLine()) != null) {
					logList.add(temp + "\n");
				}

			} finally {
				if (br != null) {
					br.close();
				}
			} // end finally

		} // end if

		return logList;

	}// readLogFile

	public static void main(String[] args) {

		UseFile uf = new UseFile();
		File file = new File("e:/dev/sist_input_1.log");

		try {
			List<String> logList = uf.readLogFile(file);
			for (int i = 0; i < logList.size(); i++) {
				System.out.println(logList.get(i));
			} // end for
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

	}// main

}// calss
