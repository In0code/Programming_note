package day0816_work;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class workEvent implements ActionListener {

	private makeFrame mf;

	public workEvent(makeFrame mf) {
		this.mf = mf;

	}// workEvent

	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == mf.getJbtnInsert()) {
			tableInfoDAO tid = new tableInfoDAO();

			informationVO infoVO = new informationVO(mf.getJtfName().getText(),
					Integer.parseInt(mf.getJtfAge().getText()), Integer.parseInt(mf.getJtfNum().getText()),
					Integer.parseInt(mf.getJtfImg().getSelectedItem().toString()));

			try {
				tid.insertInfo(infoVO);
				JOptionPane.showMessageDialog(mf, "정보가 성공적으로 추가되었습니다");

			} catch (SQLException ex) {
				JOptionPane.showMessageDialog(mf, "입력한 정보를 다시 확인해주세요");
				ex.printStackTrace();
			} // end catch

		} else if (ae.getSource() == mf.getJbtnSelect()) {
			String selectNum = JOptionPane.showInputDialog("조회할 학생의 번호를 입력하세요");
			String msg = "";
			try {
				// DAO 객체 얻기
				tableInfoDAO tiDAO = tableInfoDAO.getInstance();
				// 쿼리문 실행
				informationVO infoVO = tiDAO.selectInfo(Integer.parseInt(selectNum));
				if (infoVO == null) {
					msg = selectNum + " 학생 정보를 확인해주세요";
				} else {
					mf.getJtfName().setText(infoVO.getName());
					mf.getJtfAge().setText(Integer.toString(infoVO.getAge()));
					mf.getJtfNum().setText(Integer.toString(infoVO.getNum()));
					switch (infoVO.getImage()) {
					case 1:
						mf.getJlblInputImg().setIcon(mf.getIiOne());
						break;
					case 2:
						mf.getJlblInputImg().setIcon(mf.getIiTwo());
						break;
					case 3:
						mf.getJlblInputImg().setIcon(mf.getIiThree());
						break;
					case 4:
						mf.getJlblInputImg().setIcon(mf.getIiFour());
						break;
					default:
						mf.getJlblInputImg().setIcon(mf.getIiDefault());
						break;
					}// end switch
				} // end else

			} catch (SQLException e) {
				e.printStackTrace();

			} catch (NumberFormatException nfe) {
				msg = "번호는 숫자이어야합니다";

			} // end catch

		} // end else if
	}// actionPerformed
}// workEvent
