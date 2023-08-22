package day0822_sunkhung;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class EmpInfoViewEvt extends WindowAdapter {

	private EmpInfoView eiv;

	public EmpInfoViewEvt(EmpInfoView eiv) {
		this.eiv = eiv;
	}// EmpInfoViewEvt

	@Override
	public void windowClosing(WindowEvent e) {
		eiv.dispose();
	}// windowClosing

	public void setEmpData(EmpVO eVO) {

		eiv.getJtfEmpno().setText(eVO.getEmpno());
		eiv.getJtfEname().setText(eVO.getEname());
		eiv.getJtfHiredate().setText(eVO.getHiredate());
		eiv.getJtfJob().setText(eVO.getJob());
		eiv.getJtfSal().setText(eVO.getSal());

	}// setEmpData

}// class
