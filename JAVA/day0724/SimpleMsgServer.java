package day0724;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JOptionPane;

/**
 * 접속자가 접속하면 메시지를 출력하고, 연결을 끊는 일 0
 * 
 * @author user
 *
 */
public class SimpleMsgServer {

	@SuppressWarnings("resource")
	public SimpleMsgServer() throws IOException {
		// 1. 서버소켓 열기
		ServerSocket server = null;
		Socket client = null;
		DataOutputStream dos = null;
		DataInputStream dis = null;

		try {
			server = new ServerSocket(1025);
			System.out.println("서버가 실행되었습니다");
			while (true) {
				// 3. 접속자가 접속하면
				client = server.accept();
				System.out.println("접속자가 접속 하였습니다");
				// 4. 데이터를 보내기위한 스트림을 연결
				dos = new DataOutputStream(client.getOutputStream());

				// 접속자에게 제공할 메시지 만들기
				String msg = "이 편지는 영국에서 최초로 시작되어 일년에 한바퀴 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. "
						+ "이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다.\r\n" + "\r\n"
						+ "영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. \n"
						+ "며칠 뒤에 복권이 당첨되어 20억을 받았습니다. "
						+ "어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다.\n"
						+ " 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다.\n "
						+ "결국 9일 후 그는 암살당했습니다. 기억해 주세요. " + "이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다.\n "
						+ "그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들것입니다.\n"
						+ " 힘들겠지만 좋은게 좋다고 생각하세요. \n7년의 행운을 빌면서...";

				// 5. 데이터를 스트림 기록
				dos.writeUTF(msg);

				// 6. 스트림에 기록된 내용을 목적지로 분출
				dos.flush();
				// 클라이언트가 보내오는 메시지 읽기
				dis = new DataInputStream(client.getInputStream());
				JOptionPane.showMessageDialog(null, dis.readUTF());

			} // end while
		} finally {
			if (dos != null) {
				dos.close();
			} // end if
			if (dis != null) {
				dis.close();
			} // end if
			if (client != null) {
				dos.close();
			} // end if
			if (server != null) {
				dos.close();
			} // end if
		} // end finally

	}// SimpleMsgServer

	public static void main(String[] args) {
		try {
			new SimpleMsgServer();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
