package Login;

import java.io.IOException;
import java.util.List;

public class Function2 {

	private Ui ui;

	private int code200 = 0;
	private int code403 = 0;
	private int code404 = 0;
	private int code500 = 0;
	private int requestNum = 0;
	private String code403Share, code500Share;
	private List<Integer> number;

	public Function2(Ui ui) {
		this.ui = ui;
		try {
			ReadLogFile logReader = new ReadLogFile(ui);
			number = logReader.readFile();
			countHttpStatusCode();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void countHttpStatusCode() {
		for (int num : number) {
			if (num == 200) {
				code200++;
			} else if (num == 404) {
				code404++;
			} else if (num == 403) {
				code403++;
			} else if (num == 500) {
				code500++;
			}
		}
		requestNum = number.size(); // 전체 요청 개수 설정

		// 결과 출력
		System.out.println("Code 200 Count: " + code200);
		System.out.println("Code 403 Count: " + code403);
		System.out.println("Code 404 Count: " + code404);
		System.out.println("Code 500 Count: " + code500);
		System.out.println("Total Requests: " + requestNum);

		calCode403Share();
		calCode500Share();
		System.out.println("Code 403 Share: " + code403Share + "%");
		System.out.println("Code 500 Share: " + code500Share + "%");
	}

	public void calCode403Share() {
		code403Share = String.format("%4.2f", (code403 / (double) requestNum) * 100);
	}

	public void calCode500Share() {
		code500Share = String.format("%4.2f", (code500 / (double) requestNum) * 100);
	}
}