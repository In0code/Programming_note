package day0713;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

@SuppressWarnings("serial")
public class UseKeyAdapter extends JFrame {

	private JTextField jtf;
	private JTextArea jta;
	private UseKeyAdapter uka;

	public UseKeyAdapter() {
		super("키보드 이벤트 처리"); //

		jtf = new JTextField();
		jta = new JTextArea();

		JScrollPane jspCenter = new JScrollPane(jta); // has a

		jtf.setBorder(new TitledBorder("아무키나 누르고 엔터"));
		jspCenter.setBorder(new TitledBorder("눌린 키의 결과"));

		add("North", jtf);
		add("Center", jspCenter);

		uka=this;
		// 이벤트 등록 : anonymous inner class 처리
		jtf.addKeyListener(new KeyAdapter() {
		
		
		 

//			@Override
//			public void keyTyped(KeyEvent e) {
//				System.out.println("keyTyped");
//			}
//
//			@Override
//			public void keyReleased(KeyEvent e) {
//				System.out.println("keyReleased"+e.getKeyCode()+" / "+e.getKeyChar());
//
//			}

			@Override
			public void keyPressed(KeyEvent ke) {
//				System.out.println("keyPressed");
				jta.append("눌린키의 코드 : "+ke.getKeyCode()+", 키 문자 : "+
						ke.getKeyChar()+"\n");
				if(ke.getKeyCode()==27) {
//					this.dispose();  //dispose는 JFrame에서 제공하는 method
					//this는 어디에서 사용되었느냐에 따라 달라진다
					//anonymous innerclass안에서 사용되면 KeyAdapter이고
					//생성자에서 사용되면 JFrame이 된다. 어디에서 쓰이느냐에 따라 달라진다.
					//keyAdapter 에는 dispose가 없음. 
					dispose(); //외부클래스(JFrame)의 지원을 사용하게 된다.
					uka.dispose();
				}
			}
		});

		setBounds(100, 100, 350, 500);
		setVisible(true);

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}// UseKeyAdapter

	public static void main(String[] args) {
		new UseKeyAdapter();
	}// main

}// class
