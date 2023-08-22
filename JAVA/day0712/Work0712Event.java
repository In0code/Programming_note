package day0712;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JLabel;

public class Work0712Event implements ActionListener{

	private Work0712 name;
	
	public Work0712Event(Work0712 name) {
		this.name=name;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		JLabel jlbDaYoun=new JLabel("강다연님");
		JLabel jlbDaYoung=new JLabel("김다영님");
		JLabel jlbSunKyoung=new JLabel("김선경님");
		
//		jta.add(jlbDaYoun);
		
		
		
		
	
	}
}

