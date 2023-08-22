package day0725;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class SimpleChatClient extends JFrame implements ActionListener,Runnable {

	private JTextArea jtaTalkDisplay;
	private JScrollPane jspJtaTalkScorll;
	private JTextField jtfTalk;

	private Socket client;
	private DataInputStream disReadStream;
	private DataOutputStream dosWriteStream;
	private String nick ;

	public SimpleChatClient() {
		super("::::::::::::::::::::::::::::채팅 클라이언트:::::::::::::::::::::::::::::::::::::::::::");

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
			public void windowClosed(WindowEvent e) {
				try {
					closeClient();
				} catch (IOException e1) {
					e1.printStackTrace();
				} finally {
					System.exit(JFrame.ABORT);
				}
			}
		});

		jtfTalk.requestFocus();
		
		try {
			connectToServer();
			Thread thread = new Thread(this);
			thread.start();
		} catch (UnknownHostException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}// SimpleChatClient

	

	public void closeClient() throws IOException {
		if (disReadStream != null) {
			disReadStream.close();
		}
		if (dosWriteStream != null) {
			dosWriteStream.close();
		}
		if (client != null) {
			client.close();
		}
	}

	public void connectToServer() throws UnknownHostException, IOException {
	String ip = JOptionPane.showInputDialog("접속 서버의 주소",160);
 nick = JOptionPane.showInputDialog("닉네임",160);
		// 2. 소켓생성
		client = new Socket("192.168.10."+ip, 36500);
//		client = new Socket("127.0.0.1",55000);
		// 4. 스트림을 연결
		disReadStream = new DataInputStream(client.getInputStream());
		dosWriteStream = new DataOutputStream(client.getOutputStream());
		jtaTalkDisplay.setText("서버에 접속하였습니다.\n");

	}// connectToServer

	public void sendMsg() throws IOException {

		dosWriteStream.writeUTF("[" +nick +"]" + jtfTalk.getText());
		dosWriteStream.flush();
		jtaTalkDisplay.append("[" +nick +"]"+jtfTalk.getText()+"\n");
		jtfTalk.setText("");

	}// sendMsg

	public void run() {
		try {
		while (true) {
			jtaTalkDisplay.append(disReadStream.readUTF() + "\n");
		}
		} catch (IOException ie) {
			jtaTalkDisplay.append("대화상대가 대화를 종료하였습니다.");
		}
	}// revMsg

	public static void main(String[] args) {
		new SimpleChatClient();
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
