
package kr.co.sist.log.evt;

import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.swing.JOptionPane;

import kr.co.sist.log.evt.Result;
import kr.co.sist.log.evt.SelectMenu;

public class SelectMenuEvt implements ActionListener {

	private SelectMenu sm;
	private String filePath;
	private String fName;
	private String logTxtCreationDate;
	private Map<String, Integer> mapKey;
	private Map<String, Integer> mapKeyBetweenStartAndEnd;
	private Map<String, Integer> mapBrowser;
	private String[] browser = { "opera", "ie", "firefox", "Chrome", "Safari" };
	private int[] browserCnt;
	private Map<String, Integer> mapHour;
	private int code200, code404, code403;
	private int requestNum;
	private String code403Share;
	private Map<String, String> mapBrowserShare;
	private String mostFrequentHour;
	private String mostFrequentKey;
	private String mostFrequentKeyBetweenStartAndEnd;
	private boolean reportFlag;
	private int start;
	private int end;

	public SelectMenuEvt(SelectMenu sm) {
		this.sm = sm;
		initInstances();
	}//SelectMenuEvt

	public void initInstances() {
		browserCnt = new int[browser.length];
		mapKey = new HashMap<String, Integer>();
		mapKeyBetweenStartAndEnd = new HashMap<String, Integer>();
		mapBrowser = new HashMap<String, Integer>();
		mapHour = new HashMap<String, Integer>();
		mapBrowserShare = new HashMap<String, String>();
		reportFlag = false;
		code200 = 0;
		code404 = 0;
		code403 = 0;
		requestNum = 0;
		start = 0;
		end = 0;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == sm.getJbView()) {
			initInstances();
			try {
				selectLog();
				if (filePath.isEmpty()) {
					return;
				}//end if
				readLog();

				if (requestNum != 0) {
					calLogTxtCreationDate();
					calMostFrequentKey();
					calMostFrequentHour();
					calBrowserShare();
					calCode403Share();

					new Result(this, sm);
				} else {
					JOptionPane.showMessageDialog(sm, "�о�� �α� ������ �����ϴ�.");
				}//end if

			} catch (FileNotFoundException fnfe) {
				JOptionPane.showMessageDialog(sm, "����ϼ̽��ϴ�.");
			} catch (IOException ie) {
				ie.printStackTrace();
			}
		}

		if (e.getSource() == sm.getJbReport()) {
			if (reportFlag == true) {

				try {
					mkLogReport();
					JOptionPane.showMessageDialog(sm, "report ������ �����Ǿ����ϴ�.");
				} catch (IOException e1) {
					e1.printStackTrace();
				}

			} else {
				JOptionPane.showMessageDialog(sm, "View�� ���� ���� �� Report�� �����մϴ�.");
			}
		}

		if (e.getActionCommand() == "lineView") {
			initInstances();

			if (sm.getJtStart().getText().equals("")) {
				JOptionPane.showMessageDialog(sm, "���۶����� �Է����ּ���.");
				sm.getJtStart().requestFocus();
			} else {
				if (sm.getJtEnd().getText().equals("")) {
					JOptionPane.showMessageDialog(sm, "��������� �Է����ּ���.");
					sm.getJtEnd().requestFocus();
				} else {
					try {
						start = Integer.parseInt(sm.getJtStart().getText());
					} catch (NumberFormatException nfe) {
						JOptionPane.showMessageDialog(sm, "���۶����� ���ڸ� �Է°����մϴ�.");
						sm.getJtStart().requestFocus();
						return;
					}
					try {
						end = Integer.parseInt(sm.getJtEnd().getText());
					} catch (NumberFormatException nfe) {
						JOptionPane.showMessageDialog(sm, "�������� ���ڸ� �Է°����մϴ�.");
						sm.getJtEnd().requestFocus();
						return;
					}
					if (start > end) {
						JOptionPane.showMessageDialog(sm, "�������� ���۶��κ��� Ŀ�� �մϴ�.");
						sm.getJtEnd().requestFocus();
						return;
					}
					if (start < 0) {
						JOptionPane.showMessageDialog(sm, "�Է¶����� 0���� Ŀ�� �մϴ�.");
						sm.getJtStart().requestFocus();
						return;
					}
					if (end < 0) {
						JOptionPane.showMessageDialog(sm, "�������� 0���� Ŀ�� �մϴ�.");
						sm.getJtEnd().requestFocus();
						return;
					}
					if (start == 0 || end == 0) {
						JOptionPane.showMessageDialog(sm, "����, ���������� 0�� �Է��Ͻ� �� �����ϴ�.");
						sm.getJtStart().requestFocus();
						return;
					}

					try {
						selectLog();
						if (filePath.isEmpty()) {
							return;
						}
						readLog();

						if (start > requestNum) {
							JOptionPane.showMessageDialog(sm, "���۶����� " + requestNum + "���� Ŭ �� �����ϴ�.");
							reportFlag = false;
							return;
						}
						if (end > requestNum) {
							JOptionPane.showMessageDialog(sm, "�ش� ������ "+requestNum+"���� �α׸� �����մϴ�.");
						}

						if (requestNum != 0) {
							calLogTxtCreationDate();
							calMostFrequentKey();
							calMostFrequentKeyBetweenStartAndEnd();
							calMostFrequentHour();
							calBrowserShare();
							calCode403Share();

							new Result(this, sm);
						} else {
							JOptionPane.showMessageDialog(sm, "�о�� �α� ������ �����ϴ�.");
						}
					} catch (FileNotFoundException fnfe) {
						JOptionPane.showMessageDialog(sm, "����ϼ̽��ϴ�.");
					} catch (IOException ie) {
						ie.printStackTrace();
					}
				}
			}
		}
	}

	public void mkLogReport() throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date d = new Date();
		String s = sdf.format(d);
		StringBuilder sb = new StringBuilder();
		sb.append("report_").append(s).append(".dat");
		File file = new File("C:/dev/Report/");
		file.mkdirs();

		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter("C:/dev/Report/" + sb.toString()));
			bw.write(printReport());
			bw.flush();
		} finally {
			if (bw != null) {
				bw.close();
			}
		}
	}

	public void calLogTxtCreationDate() {
		try {
			BasicFileAttributes attrs = Files.readAttributes(new File(filePath).toPath(), BasicFileAttributes.class);
			FileTime creationTime = attrs.creationTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ss hh:mm");
			logTxtCreationDate = sdf.format(new Date(creationTime.toMillis()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String printReport() {
		StringBuilder sb = new StringBuilder();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date d = new Date();
		String s = sdf.format(d);
		Set<String> set = mapBrowser.keySet();
		Iterator<String> it = set.iterator();
		String key = "";
		sb.append("-------------------------------------------------------------\n");
		sb.append("���ϸ�(").append(fName).append(") log (").append(s).append(")\n");
		sb.append("-------------------------------------------------------------\n");
		sb.append("1. �ִ� ���Ű: ").append(mostFrequentKey).append(" ").append(mapKey.get(mostFrequentKey)).append("ȸ\n");
		sb.append("2. �������� ���� Ƚ���� ���� : \n");
		while (it.hasNext()) {
			key = it.next();
			sb.append("\t").append(key).append(" : ").append(mapBrowser.get(key)).append("��(")
					.append(mapBrowserShare.get(key)).append("%)\n");
		}
		sb.append("3. ���񽺸� ����������(200) Ƚ��, ����(404)Ƚ�� : \n").append("\t200 : ").append(code200).append("�� 404 : ")
				.append(code404).append("��\n");
		sb.append("4. ��û�� ���� ���� �ð�: [").append(mostFrequentHour).append("��]\n");
		sb.append("5.���������� ��û(403)�� �߻��� Ƚ��, ���� : ").append(code403).append("��(").append(code403Share).append("%)\n");
		if (start == 0 && end == 0) {
			sb.append("6. " + (start + 1) + "~" + requestNum + "��° ���� �ִ� ��� Ű�� �̸��� Ƚ�� : \n").append("\t")
					.append(mostFrequentKey).append(mapKey.get(mostFrequentKey));
		} else {
			sb.append("6. " + start + "~" + (end > requestNum ? requestNum : end) + "��° ���� �ִ� ��� Ű�� �̸��� Ƚ�� : \n")
					.append("\t").append(mostFrequentKeyBetweenStartAndEnd).append(" ")
					.append(mapKeyBetweenStartAndEnd.get(mostFrequentKeyBetweenStartAndEnd)).append("ȸ");
		}

		return sb.toString();
	}

	public void calMostFrequentKey() {
		int maxValue = (Collections.max(mapKey.values())); //
		for (String key : mapKey.keySet()) {
			if (mapKey.get(key) == maxValue) {
				mostFrequentKey = key;
			}
		}
	}

	public void calMostFrequentKeyBetweenStartAndEnd() {
		int maxValue = (Collections.max(mapKeyBetweenStartAndEnd.values()));
		for (String key : mapKeyBetweenStartAndEnd.keySet()) {
			if (mapKeyBetweenStartAndEnd.get(key) == maxValue) {
				mostFrequentKeyBetweenStartAndEnd = key;
			}
		}
	}

	public void calMostFrequentHour() {
		Set<String> setHour = mapHour.keySet();
		Iterator<String> it = setHour.iterator();

		int max = 0;
		String hour = "";

		while (it.hasNext()) {
			hour = it.next();
			if (mapHour.get(hour) > max) {
				mostFrequentHour = hour;
				max = mapHour.get(hour);
			}
		}
	}

	public void calBrowserShare() {
		Set<String> set = mapBrowser.keySet();
		Iterator<String> ita = set.iterator();
		Iterator<String> ita2 = set.iterator();

		while(ita.hasNext()) {
			mapBrowserShare.put(ita2.next(),
					String.format("%4.2f", ((mapBrowser.get(ita.next()) / (double) requestNum) * 100)));
		}
	}

	public void calCode403Share() {
		code403Share = String.format("%4.2f", (code403 / (double) requestNum) * 100);
	}

	public void selectLog() {
		FileDialog fd = new FileDialog(sm, "log ���� ����", FileDialog.LOAD);
		fd.setVisible(true);

		String dirPath = fd.getDirectory();
		fName = fd.getFile();
		System.out.println(fName);
		// log���� ���� Ȯ���ϴ� ����ó��
		if (!fName.contains(".log")) {
			JOptionPane.showMessageDialog(sm, "log������ �ƴմϴ�.");
			filePath = "";
		} else {
			filePath = dirPath + fName;
		}
	}
	public void readLog() throws IOException, FileNotFoundException {

		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filePath));

			String temp = "";
			while ((temp = br.readLine()) != null) {
				requestNum++;
				countKey(temp);
				countBrowser(temp);
				countHttpStatusCode(temp);
				countRequestHour(temp);
				if (start != 0 && end != 0) {
					if (requestNum >= start && requestNum <= end) {
						countKeyBetweenStartAndEnd(temp);
					}
				}
			}

			reportFlag = true;
		} finally {
			if (br != null)
				br.close();
		}
	}

	public void countKey(String temp) {
		String key = null;
		if (temp.contains("key")) {
			key = temp.substring(temp.indexOf("=") + 1, temp.indexOf("&"));
			mapKey.put(key, mapKey.get(key) != null ? mapKey.get(key) + 1 : 1);
		}
	}

	public void countKeyBetweenStartAndEnd(String temp) {
		String key = null;
		if (temp.contains("key")) {
			key = temp.substring(temp.indexOf("=") + 1, temp.indexOf("&"));
			mapKeyBetweenStartAndEnd.put(key,
					mapKeyBetweenStartAndEnd.get(key) != null ? mapKeyBetweenStartAndEnd.get(key) + 1 : 1);
		}
	}

	public void countBrowser(String temp) {
		for (int i = 0; i < browser.length; i++) {
			if (temp.contains(browser[i])) {
				browserCnt[i]++;
				mapBrowser.put(browser[i], browserCnt[i]);
			}
		}
	}

	public void countHttpStatusCode(String temp) {
		int serviceCode = Integer.parseInt(temp.substring(temp.indexOf("[") + 1, temp.indexOf("]")));

		if (serviceCode == 200) {
			code200++;
		} else if (serviceCode == 404) {
			code404++;
		} else if (serviceCode == 403) {
			code403++;
		}
	}

	public void countRequestHour(String temp) {
		String hour = temp.substring(temp.lastIndexOf("[") + 1, temp.lastIndexOf("]")).substring(11, 13);

		mapHour.put(hour, mapHour.get(hour) != null ? mapHour.get(hour) + 1 : 1);
	}

	// getters
	public Map<String, Integer> getMapKeyBetweenStartAndEnd() {
		return mapKeyBetweenStartAndEnd;
	}

	public String getMostFrequentHour() {
		return mostFrequentHour;
	}

	public String getMostFrequentKeyBetweenStartAndEnd() {
		return mostFrequentKeyBetweenStartAndEnd;
	}

	public String[] getBrowser() {
		return browser;
	}

	public int[] getBrowserCnt() {
		return browserCnt;
	}

	public SelectMenu getsm() {
		return sm;
	}

	public String getFilePath() {
		return filePath;
	}

	public Map<String, Integer> getMapKey() {
		return mapKey;
	}

	public Map<String, Integer> getMapBrowser() {
		return mapBrowser;
	}

	public Map<String, Integer> getMapHour() {
		return mapHour;
	}

	public int getCode200() {
		return code200;
	}

	public int getCode404() {
		return code404;
	}

	public int getCode403() {
		return code403;
	}

	public int getRequestNum() {
		return requestNum;
	}

	public String getLogTxtCreationDate() {
		return logTxtCreationDate;
	}

	public String getCode403Share() {
		return code403Share;
	}

	public Map<String, String> getMapBrowserShare() {
		return mapBrowserShare;
	}

	public String getMostFrequentKey() {
		return mostFrequentKey;
	}

	public String getfName() {
		return fName;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}
}