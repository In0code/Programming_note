package day0817work;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JOptionPane;

public class WorkEvt extends WindowAdapter implements ActionListener {

	private Work wk;

	public WorkEvt(Work wk) {
		this.wk = wk;
		setTableNames();
	}

	public void setTableNames() {
		WorkDAO wDAO = new WorkDAO();
		try {
			List<String> listTableName = wDAO.selectTableNames();
			for (String tname : listTableName) {
				wk.getDcbmJcbWork().addElement(tname);
			} // end for
			listTableName = wDAO.selectTableNames();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(wk, "테이블명 조회중 문제 발생");
			e.printStackTrace();
		} // end catch

	}// setTableNames

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == wk.getJcbWork()) {
			selectTable();
		}
	}

	public void selectTable() {
		WorkDAO wDAO = new WorkDAO();

		try {
			List<WorkVO> list = wDAO.selectTableInfo(wk.getJcbWork().getSelectedItem().toString());

			wk.getDtmWork().setRowCount(0);
//			wk.getDtmWork().setColumnCount(5);
			String[] rowData = null;

			for (WorkVO wVO : list) {
				rowData = new String[5];
				rowData[0] = wVO.getColumnName();
				rowData[1] = wVO.getDataType();

				// dataSize와 dataPrecision에 따라 적절한 값을 설정
				if (wVO.getDataPrecision() != null) {
					rowData[2] = wVO.getDataPrecision();
				} else {
					rowData[2] = wVO.getDataSize(); // dataPrecision이 null일 때는 dataSize를 확인
				} // end if

				rowData[3] = wVO.getIsNull();
				rowData[4] = wVO.getIsDefault();

				wk.getDtmWork().addRow(rowData);
			} // end for

		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

	}// selectTable

}// class
