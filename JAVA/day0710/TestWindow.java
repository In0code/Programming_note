package day0710;

import java.awt.Frame;
import java.awt.Window;

public class TestWindow extends Window{

	public TestWindow(Frame f) {
		super(f);
		
		f.setSize(400,400);
		f.setVisible(true); //이게 frame. 
//		setSize(400,400);
//		setVisible(true); //이거 실행하면 Window나옴. 이 흰 화면에 뭔가를 올리는 것임
	}//TestWindow
	
	
	public static void main(String[] args) {
		Frame f=new Frame("나는 프레임");
		new TestWindow(f);
		
		
	}//main

}//class
