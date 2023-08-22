package kr.co.sist.log.evt;

import java.awt.Graphics;
import java.awt.GridLayout;
import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;

import kr.co.sist.log.evt.ResultEvt;
import kr.co.sist.log.evt.SelectMenuEvt;

/////////////// 12-22 Result JDialog����, Eventó��(����) /////////////////////
// //////////// 12-24 Result ������ ����(����), sme�κ��� ��� ��� ���� //////
@SuppressWarnings("serial")
public class Result extends JDialog {

	private SelectMenuEvt sme;

	public JPanel browserInfo() {

		JPanel jpBrowser = new JPanel();
		jpBrowser.setOpaque(false);
		setLayout(new GridLayout(1, 5));

		JLabel[] jlBrowser = new JLabel[sme.getBrowser().length];

		Map<String, Integer> mapBrowser = sme.getMapBrowser();
		Map<String, String> mapBrowserShare = sme.getMapBrowserShare();

		StringBuilder content = new StringBuilder();

		Set<String> key = mapBrowser.keySet();
		Iterator<String> itKey = key.iterator();
		String bName = "";
		int i = 0;
		while (itKey.hasNext()) {
			bName = itKey.next();

			content.append(bName).append(" : ").append(mapBrowser.get(bName)).append(" (")
					.append(mapBrowserShare.get(bName)).append("%)");
			jlBrowser[i] = new JLabel(content.toString());
			jpBrowser.add(jlBrowser[i]);
			i++;
			content.delete(0, content.length());
		}

		return jpBrowser;
	}

	public Result(SelectMenuEvt sme, SelectMenu sl) {
		super(sl, "��� ���", true);
		this.sme = sme;

		ImageIcon icon = new ImageIcon("C:\\dev\\workspace\\logAnalysisApp\\img\\resultchang2.jpg");
		JPanel bgr = new JPanel() {
			public void paintComponent(Graphics g) {
				g.drawImage(icon.getImage(), 0, 0, null);
				setOpaque(false);
			}
		};
		bgr.setLayout(null);

		JButton jbConfirm = new JButton("Ȯ��");

		File reportFile = new File(sme.getFilePath());

		bgr.add(jbConfirm).setBounds(270, 450, 60, 30);
		bgr.add(new JLabel("���ϸ�")).setBounds(40, 5, 100, 50);
		bgr.add(new JLabel(reportFile.getName())).setBounds(125, 10, 100, 30);
		bgr.add(new JLabel("������ ��¥")).setBounds(300, 10, 100, 30);
		bgr.add(new JLabel(sme.getLogTxtCreationDate())).setBounds(380, 10, 150, 20);
		bgr.add(new JLabel("1. �ִ� ��� key�� �̸��� Ƚ��")).setBounds(80, 50, 200, 50);
		bgr.add(new JLabel(sme.getMostFrequentKey() + " : " + sme.getMapKey().get(sme.getMostFrequentKey()) + "��")).setBounds(380, 60, 200, 30);
		bgr.add(new JLabel("2. �������� ����Ƚ��, ����")).setBounds(80, 130, 200, 50);
		bgr.add(browserInfo()).setBounds(380, 100, 200, 150); 
		bgr.add(new JLabel("3. ���� ����(200) ����(404) Ƚ��")).setBounds(80, 230, 200, 50);
		bgr.add(new JLabel("����(200) : " + sme.getCode200() + ", ����(404) : " + sme.getCode404())).setBounds(380, 230, 200, 50);
		bgr.add(new JLabel("4. ��û�� ���� ���� �ð�")).setBounds(80, 310, 200, 30);
		bgr.add(new JLabel(sme.getMostFrequentHour() + "��")).setBounds(380	, 310, 200,30);
		bgr.add(new JLabel("5. ������ ��û Ƚ���� ����")).setBounds(80, 360, 200, 30);
		bgr.add(new JLabel(sme.getCode403() + " ("
				+ String.format("%4.2f", sme.getCode403() / (double) sme.getRequestNum() * 100) + "%)")).setBounds(380, 360, 200, 30);
		if (sme.getStart() == 0 && sme.getEnd() == 0) {
			bgr.add(new JLabel("6. " + (sme.getStart() + 1) + "~" + sme.getRequestNum() + " ���� ���� �󵵼��� ���� key�� Ƚ��")).setBounds(80, 410, 250, 30);
			bgr.add(new JLabel(sme.getMostFrequentKey() + " : " + sme.getMapKey().get(sme.getMostFrequentKey()) + "��")).setBounds(380, 410, 200, 30);
		} else {
			bgr.add(new JLabel("6. " + sme.getStart() + "~"
					+ (sme.getEnd() > sme.getRequestNum() ? sme.getRequestNum() : sme.getEnd())
					+ " ���� �ְ��� key�� Ƚ��")).setBounds(80, 410, 250, 30);
			bgr.add(new JLabel(sme.getMostFrequentKeyBetweenStartAndEnd() + " : "
					+ sme.getMapKeyBetweenStartAndEnd().get(sme.getMostFrequentKeyBetweenStartAndEnd()) + "��")).setBounds(380, 410, 200, 30);
		}

		ResultEvt r = new ResultEvt(this);
		jbConfirm.addActionListener(r);

		add(bgr);

		setBounds(400, 300, 650, 530);
		setResizable(false);
		setVisible(true);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
	}
}