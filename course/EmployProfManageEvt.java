package self_practice_course_prj;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.table.DefaultTableModel;

public class EmployProfManageEvt extends WindowAdapter implements ActionListener, MouseListener {
//////////////인영 ///////////////
/////////// 교수관리 Event ///////////
	private EmployProfManageDialog epmd;

	public EmployProfManageEvt(EmployProfManageDialog epmd) {
		this.epmd = epmd;
	}
	

	@Override
	public void mouseClicked(MouseEvent me) {

	}

	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == epmd.getJbtnAdd()) {
			new EmployProfAddManageDialog(epmd);
		}

	}

	@Override
	public void windowClosing(WindowEvent we) {
		epmd.dispose();
	}

}
