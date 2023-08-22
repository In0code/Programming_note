package day0816_sangjun;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

public class Work_event extends WindowAdapter implements ActionListener {
	private Work_Jfram jfram;
	private WorkStudentVO stuVO;

	public Work_event(Work_Jfram jfram) {
		this.jfram = jfram;
	}// constructor

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jfram.getJbtnInsert()) {
			addWorkUser();
		} // if
		if (e.getSource() == jfram.getJbtnSelect()) {
			searchWorkUser();
		} // if
		if (e.getSource() == jfram.getJcbImg()) {
			changeImg();
		} // if
	}// actionPerformed

	@Override
	public void windowClosing(WindowEvent e) {
		jfram.dispose();
	}// windowClosing

	// Query문에 대한 이름은 DAO단의 클래스에서만 정의한다.
//	private void insert() {
	private void addWorkUser() {
		int num = Integer.parseInt(jfram.getJtfNum().getText().trim());
		try {
			stuVO = new WorkStudentVO();
			stuVO.setName(jfram.getJtfName().getText().trim());
			stuVO.setImg(((Integer) jfram.getJcbImg().getSelectedItem()).intValue());
			stuVO.setAge(Integer.parseInt(jfram.getJtfAge().getText().trim()));
			stuVO.setNum(num);

			WorkConnDAO.getInstance().insertInfo(stuVO);

			JOptionPane.showMessageDialog(jfram, "성공적으로 추가하였습니다.");
		} catch (SQLException e) {
			switch (e.getErrorCode()) {
			case 1:
				JOptionPane.showMessageDialog(jfram, num + "번은 추가할 수 없는 번호입니다!");
				break;
			default:
				JOptionPane.showMessageDialog(jfram, "문제 발생 잠시 후 다시 시도해주세요!");
			}// end switch

			e.printStackTrace();
		} catch (NumberFormatException e) {
			JOptionPane.showMessageDialog(jfram, "나이, 번호는 숫자만 입력할 수 있습니다.");
		} // catch
	}// insert

//	private void select() {
	private void searchWorkUser() {
		try {
			int num = Integer.parseInt(jfram.getJtfNum().getText().trim());
			stuVO = new WorkStudentVO();
			stuVO = WorkConnDAO.getInstance().selectInfo(num);
			if (stuVO == null) {
				JOptionPane.showMessageDialog(jfram, num + "번은 저장되지 않은 번호입니다.");
				return;
			} // if
			jfram.getJtfName().setText(stuVO.getName());
			jfram.getJcbImg().setSelectedItem(stuVO.getImg());
			jfram.getJtfAge().setText(Integer.toString(stuVO.getAge()));
			jfram.getJtfNum().setText(Integer.toString(stuVO.getNum()));

		} catch (SQLException e) {
			e.printStackTrace();
		} // catch
	}// select

	private ImageIcon setIcon(String name) {
		ImageIcon icon = new ImageIcon(jfram.fileLocation() + name + ".png");
		return icon;
	}// setIcon

	public void changeImg() {
		StringBuilder imgName = new StringBuilder();
		imgName.append("img").append(jfram.getJcbImg().getSelectedItem());
		jfram.getJlblDefaultImg().setIcon(setIcon(imgName.toString()));
	}// changeImg
}// class
