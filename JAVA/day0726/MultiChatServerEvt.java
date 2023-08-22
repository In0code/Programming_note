package day0726;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;

public class MultiChatServerEvt extends WindowAdapter implements ActionListener, Runnable {

	private MultiChatServer mcs;
	private ServerSocket server;
	private Thread serverThread;

	public static List<ChatHelper> connectList;

	public MultiChatServerEvt(MultiChatServer mcs) { // has a 관계
		this.mcs = mcs;
		connectList = new Vector<ChatHelper>(20); // 스무명 정도 채팅

	}// MultiChatServerEvt

	@Override
	public void windowClosing(WindowEvent we) {
		try {
			closeServer();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// windowClosing

	@Override
	public void windowClosed(WindowEvent e) {
		System.exit(JFrame.ABORT);

	}// windowClosed

	public void openServer() {

		if (serverThread != null) {
			JOptionPane.showMessageDialog(mcs, "서버가 동작중입니다");
			return; // early return : else를 사용하지 않고 else의 효과를 낼 수 있는 구문
		}
		serverThread = new Thread(this);
		serverThread.start(); // run() 호출

	}// openServer

	public void closeServer() throws IOException {
		try {
			if (server != null) {
				server.close();
			} // end if

		} finally {
			mcs.dispose();

		} // end finally
	}// closeServer

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == mcs.getJbtnOpenServer()) {
			openServer();
		} // end if

		if (ae.getSource() == mcs.getJbtnCloseServer()) {
			try {
				closeServer();
			} catch (IOException e) {
				e.printStackTrace();
			} // end catch
		} // end if

	}// actionPerformed

	@Override
	public void run() {
		// 1. 서버소켓 열기
		try {
			server = new ServerSocket(36500);
			SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd hh:mm:ss");

			JTextArea JtaConnectListView = mcs.getJtaConnectList();

			JtaConnectListView.setText(sdf.format(new Date()) + "에 서버가 실행되었습니다. \n");

			Socket tempClient = null;
			ChatHelper ch = null;

			if (connectList.size() < 21) {
				for (int i = 0;; i++) {
					// 2. 접속자 소켓 받기
					tempClient = server.accept();
					// 3. helper 생성하여 접속자 소켓을 넣기
					try {
						ch = new ChatHelper(tempClient, i, JtaConnectListView, mcs.getJspJtaConnectListClient());
						// 4. list에 추가
						connectList.add(ch);
						// 5. helper에 Thread 돌린다
						ch.start(); // run() => 접속자가 보내오는 메시지를 무한루프로 읽는다
					} catch (IOException ie) { // accept에서 터지면 여기로 온다.
						System.out.println("Helper에서 예외");
						ie.printStackTrace();
					} // end catch
				} // end for

			} // end if
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

	}// run

}// class
