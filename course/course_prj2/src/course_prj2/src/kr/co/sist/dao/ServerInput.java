package kr.co.sist.dao;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

import javax.imageio.ImageIO;

public class ServerInput {
	
	private ServerSocket server;
	private Socket socket;
	private DataInputStream disReadStream;
	private InputStream is;
	
	public ServerInput() throws IOException {
		server = new ServerSocket(9900);
		System.out.println("서버 작동 중");
		
		while (true) {
			socket = server.accept();
			System.out.println("accept");
			is = socket.getInputStream();
			disReadStream = new DataInputStream(is);
			
			readImage();
		}
	}
	
	public void readImage() {
		
		try {
			//학번 또는 사번 받음
			String id = disReadStream.readUTF();

			//이미지 파일 확장자 받음
			String fileType = disReadStream.readUTF();
			
			//이미지 폴더 경로 설정
			StringBuilder sb = new StringBuilder();
			sb.append("e:/tempImage/").append(id);
			
			//이미지 폴더 존재 확인하고 없으면 생성
			File file = new File(sb.toString());
			if(!file.exists()) {
				file.mkdir();
			}
			
			//이미지 파일 경로 설정하고 file에 대입
			sb.append("/").append(id).append(fileType);
			file = new File(sb.toString());
			
			//이미지 파일을 읽어온 다음에 크기를 190x250으로 설정하고 저장한다. 
			byte[] b = is.readAllBytes();
			Image img = ImageIO.read(new ByteArrayInputStream(b)).getScaledInstance(190, 250, Image.SCALE_SMOOTH);

            BufferedImage newImage = new BufferedImage(190 , 250 , BufferedImage.TYPE_INT_RGB);
            //Image를 BufferedImage로 변환하는 작업
            Graphics g = newImage.getGraphics();
            g.drawImage(img, 0, 0, null);
            g.dispose();
            ImageIO.write(newImage, fileType.substring(1), file);
			
			System.out.println("사진 저장 성공");
			
			if(is != null) { is.close(); }
			if(socket != null) { socket.close(); }
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		try {
			new ServerInput();
			
		} catch (IOException e) {
			System.out.println("연결 종료.");
		}
	}

}
