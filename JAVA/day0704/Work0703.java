package day0704;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.StringTokenizer;

public class Work0703 {


	// 1번
	public String[] dataTokenizer(String csvData) {
		StringTokenizer csvToken = new StringTokenizer(csvData, "김 ,.~");
		String[] csvArr = new String[csvToken.countTokens()];
		String data = "";
		int i = 0;

		while (csvToken.hasMoreTokens()) {
			data = csvToken.nextToken();
			csvArr[i] = data;
			i++;
		} // end while

		return csvArr;
	}

	// 2번
	public String date(int flag) {
		Locale[] locale = { Locale.KOREA, Locale.US, Locale.JAPAN, Locale.CANADA };

		if (!(flag > -1 && flag < 4)) {
			flag = 0;
		} // end if
		SimpleDateFormat sdf
		=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a EEEE",locale[flag]);
		return  sdf.format(new Date()).toString();
	}// date




}// class










