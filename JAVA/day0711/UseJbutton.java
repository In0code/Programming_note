package day0711;

import java.awt.GridLayout;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;

/**
 * 아이콘을 도입한 버튼 객체 사용
 * 
 * @author user
 *
 */
@SuppressWarnings("serial")
public class UseJbutton extends JFrame {

	public UseJbutton() {
		super("버튼과 아이콘");

		// 이미지 아이콘 생성
		ImageIcon ii = new ImageIcon("E:/dev/workspace/java_se/src/day0711/images/img1.png");
		ImageIcon ii2 = new ImageIcon("E:/dev/workspace/java_se/src/day0711/images/img2.png");
		ImageIcon ii3 = new ImageIcon("E:/dev/workspace/java_se/src/day0711/images/img3.png");
		ImageIcon ii4 = new ImageIcon("E:/dev/workspace/java_se/src/day0711/images/img4.png");

		JButton jbtn=new JButton("울고있는차차",ii);
		JButton jbtn2=new JButton("신나는차차",ii2);
		JButton jbtn3=new JButton("보고있는차차",ii3);
		//풍선도움말
		jbtn.setToolTipText("울먹이는 차차ㅠㅠ");
		jbtn2.setToolTipText("신남^o^");
		jbtn3.setToolTipText("뭐가있지");
		
		//마우스 포인터가 올라갔을 때 이미지 변환
		jbtn3.setRolloverIcon(ii4);
		
		//텍스트 위치 변경
		//수직위치 TOP, MIDDLE, BOTTOM
		jbtn.setVerticalTextPosition(JButton.BOTTOM);
		//수평위치 : LEFT, CENTER, RIGHT
		jbtn2.setHorizontalTextPosition(JButton.RIGHT);
		
		jbtn3.setVerticalTextPosition(JButton.BOTTOM);
		jbtn3.setHorizontalTextPosition(JButton.CENTER);
		
		setLayout(new GridLayout(1,3));
		
		add(jbtn);
		add(jbtn2);
		add(jbtn3);
		
		setBounds(100, 100, 1200, 400);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		
	}// UseJbutton

	public static void main(String[] args) {
		new UseJbutton();
	}// class

}// main
