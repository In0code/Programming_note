package kr.co.sist.log.evt;

import java.awt.Graphics;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.KeyStroke;

import kr.co.sist.log.evt.SelectMenuEvt;

@SuppressWarnings("serial")
public class SelectMenu extends JDialog {

	private JButton jbView;
	private JButton jbReport;
	private JButton jbLineView;
	private JTextField jtStart;
	private JTextField jtEnd;

	public SelectMenu(JFrame login) {
		super(login, "Log Analysis App", true);

		ImageIcon icon = new ImageIcon("C:\\dev\\workspace\\logAnalysisApp\\img\\aaa.jpg");
		JPanel background = new JPanel() {
			public void paintComponent(Graphics g) {
				g.drawImage(icon.getImage(), 0, 0, null);
				setOpaque(false);
				super.paintComponent(g);
			}
		};
		background.setLayout(null);

		JLabel jlStart = new JLabel("����");
		JLabel jlEnd = new JLabel("��");

		jbView = new JButton("View");
		jbReport = new JButton("Report");
		jbLineView = new JButton("LineView");
		jtStart = new JTextField();
		jtEnd = new JTextField();

		jbView.setIcon(new ImageIcon("C:\\dev\\workspace\\logAnalysisApp\\img\\viewIMG.jpg"));
		jbReport.setIcon(new ImageIcon("C:\\dev\\workspace\\logAnalysisApp\\img\\reviewIMG.jpg"));
		jbLineView.setIcon(new ImageIcon("C:\\dev\\workspace\\logAnalysisApp\\img\\LineView.jpg"));

		background.add(jbView);
		jbView.setBounds(40, 90, 150, 50);
		background.add(jbReport);
		jbReport.setBounds(220, 90, 150, 50);
		background.add(jbLineView);
		jbLineView.setBounds(260, 185, 112, 40);
		background.add(jtStart);
		jtStart.setBounds(95, 160, 150, 30);
		background.add(jtEnd);
		jtEnd.setBounds(95, 200, 150, 30);
		background.add(jlStart);
		jlStart.setBounds(55, 160, 50, 30);
		background.add(jlEnd);
		jlEnd.setBounds(55, 200, 50, 30);

		SelectMenuEvt sme = new SelectMenuEvt(this);
		jbView.addActionListener(sme);
		jbReport.addActionListener(sme);
		jbLineView.addActionListener(sme);
		jbLineView.setActionCommand("lineView");
		jtStart.registerKeyboardAction(sme, "lineView", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0),
				JComponent.WHEN_FOCUSED);
		jtEnd.registerKeyboardAction(sme, "lineView", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0),
				JComponent.WHEN_FOCUSED);

		add(background);
		setBounds(400, 300, 420, 300);
		setResizable(false);
		setVisible(true);
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
	}

	public JButton getJbView() {
		return jbView;
	}

	public JButton getJbReport() {
		return jbReport;
	}

	public JButton getJbLineView() {
		return jbLineView;
	}

	public JTextField getJtStart() {
		return jtStart;
	}

	public JTextField getJtEnd() {
		return jtEnd;
	}
}