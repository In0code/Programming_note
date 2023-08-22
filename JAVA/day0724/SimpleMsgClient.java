package day0724;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import javax.swing.JOptionPane;

/**
 * 서버에 접속하여 서버에서 제공하는 메시지를 읽는 일
 * 
 * @author user
 *
 */
public class SimpleMsgClient {

	public SimpleMsgClient() throws IOException {

		String ip = JOptionPane.showInputDialog(
				"서버 ip 입력하시오\n132,133,134,135,136,137,138,139,142,143,141,151,140,145,146,149,148,149,150,160", "136");
		Socket client = null;
		DataInputStream dis = null;
		DataOutputStream dos = null;

		if (ip != null && !"".equals(ip)) {
			try {
				// 2. 소켓 생성하여 서버에 접속
				client = new Socket("192.168.10." + ip, 1025);
				System.out.println("서버에 접속하였습니다.");
				// 4. 서버에서 제공하는 메시지를 받기위한 스트림 연결
				dis = new DataInputStream(client.getInputStream());
				dos = new DataOutputStream(client.getOutputStream());
				// 5. 메시지 받기
				String msg = dis.readUTF();
				String sendMsg = JOptionPane.showInputDialog(ip + "에서 수신한 메시지 : \n" + msg);
				// 메시지 보내기
				dos.writeUTF("누가 보냈게 ㅋㅋ" + sendMsg);
				dos.flush();
			} finally {
				// 6. 연결 끊기
				if (dis != null) {
					dis.close();
				} // end if
				if (dos != null) {
					dos.close();
				} // end if
				if (client != null) {
					client.close();
				} // end if

			} // end finally
		} // end if
	}// SimpleMsgClient

	public static void main(String[] args) {
		try {
			new SimpleMsgClient();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

	}// main

}// class
