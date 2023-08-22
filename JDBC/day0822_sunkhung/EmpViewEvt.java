package day0822_sunkhung;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;

public class EmpViewEvt extends MouseAdapter {
	private EmpView ev;

	public EmpViewEvt(EmpView ev) {
		this.ev = ev;

		setEmpno();
	}

	public void setEmpno() {
		EmpDAO eDAO = EmpDAO.getInstance();

		try {
			List<String> listEmpno = eDAO.selecEmpno();
			for (String setEmpno : listEmpno) {
				ev.getDlmJlEmpno().addElement(setEmpno);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}

	@Override
	public void mouseClicked(MouseEvent me) {
		if (me.getSource() == ev.getJlEmpno()) {
			selectEmpno();
		}
	}

	public void selectEmpno() {
		EmpDAO eDAO = EmpDAO.getInstance();

		String empno = ev.getDlmJlEmpno().elementAt(ev.getJlEmpno().getSelectedIndex());

		EmpVO eVO = null;

		try {

			eVO = eDAO.selectOneEmpInfo(empno);
			if (eVO == null) {
				JOptionPane.showMessageDialog(ev, empno + "번 사원은 존재하지 않습니다");
				return;
			} // end if
			 new EmpInfoView(ev, eVO);

		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

	}//selectEmpno

}
