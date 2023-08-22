package day0710;

import java.awt.GridLayout;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;

import day0706.Work0704;

@SuppressWarnings("serial")
public class Work0710 extends JFrame {

	public Work0710(int year,int month) {
		super("달력");
		Work0704 ym=new Work0704();
		String[][] cal=ym.yearMonth(year, month);
		
		setLayout(new GridLayout(cal.length,cal[0].length));
		JButton[][] jbtn=new JButton[cal.length][cal[0].length];
//		JButton[] jbtn2=new JButton[month];
		
		for(int i=0; i< cal.length; i++) {
			for(int j=0; j<cal[i].length; j++) {
				jbtn[i][j]=new JButton(cal[i][j]);
				add(jbtn[i][j]);
				
			}
		}
		
		setSize(700,500);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}//Work0710
	
		
		
		
	
	
	public static void main(String[] args) {
		new Work0710(2023,8);
//		w.CalendarButton();
	}//main

}//class
