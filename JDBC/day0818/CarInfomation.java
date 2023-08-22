package day0818;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import kr.co.sist.dao.DbConn;

public class CarInfomation { // 0818 숙제

	public CarInfomation() throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {

			// 1.
			// 2.
			con = db.getConnection("localhost", "scott", "tiger");
			String inputData = JOptionPane.showInputDialog("차량 제조사");

			// 3.

			StringBuilder selectCarInfo = new StringBuilder();
			selectCarInfo
					.append("	select cc.COUNTRY ,cma.MAKER ,cma.MODEL ,cmo.CAR_YEAR ,cmo.PRICE ,cmo.CAR_OPTION	")
					.append("	from CAR_COUNTRY cc, CAR_MAKER cma,CAR_MODEL cmo									")
					.append("	WHERE (cma.MAKER(+) =cc.MAKER AND cmo.MODEL(+) = cma.MODEL ) and cma.maker = ?		");
			pstmt = con.prepareStatement(selectCarInfo.toString());
			pstmt.setString(1, inputData);
			rs = pstmt.executeQuery();

			// 4.

			StringBuilder searchCarMaker = new StringBuilder();
			searchCarMaker.append(" 제조국\t제조사\t모델명\t옵션\t연식\t가격\n");

			int cnt = 0;
			while (rs.next()) {
				cnt++;
				searchCarMaker.append(cnt).append("\t").append(rs.getString("country")).append("\t")
						.append(rs.getString("maker")).append("\t").append(rs.getString("model")).append("\t")
						.append(rs.getString("car_year")).append("\t").append(rs.getString("price")).append("\t")
						.append(rs.getString("car_option")).append("\n");
			} // end while

			JTextArea jta = new JTextArea(searchCarMaker.toString(), 20, 100);
			JScrollPane jsp = new JScrollPane(jta);

			JOptionPane.showMessageDialog(null, jsp);

		} finally {
			// 6.
			db.dbClose(rs, pstmt, con);
		} // end finally

	}// day0818Work

	public static void main(String[] args) {
		try {
			new CarInfomation();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// clss
