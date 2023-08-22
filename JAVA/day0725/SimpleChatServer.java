package day0725;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class SimpleChatServer extends JFrame implements ActionListener, Runnable {

	private JTextArea jtaTalkDisplay;
	private JScrollPane jspJtaTalkScorll;
	private JTextField jtfTalk;

	private ServerSocket server;
	private Socket client;
	private DataInputStream disReadStream;
	private DataOutputStream dosWriteStream;

	public SimpleChatServer() {
		super("::::::::::::::::::::::::::::채팅서버:::::::::::::::::::::::::::::::::::::::::::");

		jtaTalkDisplay = new JTextArea();
		jspJtaTalkScorll = new JScrollPane(jtaTalkDisplay);
		jtfTalk = new JTextField();

		jtaTalkDisplay.setEditable(false);

		jspJtaTalkScorll.setBorder(new TitledBorder("대화내용"));
		jtfTalk.setBorder(new TitledBorder("대화"));

		add("Center", jspJtaTalkScorll);
		add("South", jtfTalk);

		setBounds(100, 100, 400, 500);
		setVisible(true);

		jtfTalk.addActionListener(this);

		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				dispose();
			}
		});

		jtfTalk.requestFocus();
		try {
			startServer();
			Thread thread = new Thread(this);
			thread.start(); // run() 호출 되어 메시지를 무한루프로 읽어 들인다.
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}// SimpleChatServer

	public void windowClosing(WindowEvent e) {
		dispose();
	}

	public void windowClosed(WindowEvent e) {
		try {
			closeServer();
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally {
			System.exit(0);
		} // end finally
	}// windowClosed

	public void closeServer() throws IOException {
		if (disReadStream != null) {
			disReadStream.close();
		}
		if (dosWriteStream != null) {
			dosWriteStream.close();
		}
		if (client != null) {
			client.close();
		}
		if (server != null) {
			server.close();
		}
	}// CloseServer

	public void startServer() throws IOException {
		// 1.Server Socket을 연다.
		server = new ServerSocket(55000);
		jtaTalkDisplay.setText("서버 실행중....\n");
		jtaTalkDisplay.append("접속자가 접속하기를 기다립니다.\n");
		// 3. 접속자 소켓이 들어오기를 기다린다.
		client = server.accept();
		jtaTalkDisplay.append("접속자가 접속하였습니다.\n");
		// 4. 소켓에서 스트림 연결
		disReadStream = new DataInputStream(client.getInputStream());
		dosWriteStream = new DataOutputStream(client.getOutputStream());

	}// startServer

	public void sendMsg() throws IOException {
		String msg = jtfTalk.getText();
		dosWriteStream.writeUTF("[Tuna]" + msg);
		dosWriteStream.flush();
		jtaTalkDisplay.append("[Tuna]" + msg + "\n");
		jtfTalk.setText("");
	}// SendMsg

	@Override
	public void run() {
		String msg = "";
		try {
			while (true) {
				msg = disReadStream.readUTF();
				jtaTalkDisplay.append(msg + "\n");
				jspJtaTalkScorll.getVerticalScrollBar().setValue(jspJtaTalkScorll.getVerticalScrollBar().getMaximum());

			}
		} catch (IOException ie) {
			jtaTalkDisplay.append("대화상대가 퇴실하였습니다.");
		}
	}

	public static void main(String[] args) {
		new SimpleChatServer();
	}// main

	@Override
	public void actionPerformed(ActionEvent e) {
		try {
			sendMsg();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

}// class