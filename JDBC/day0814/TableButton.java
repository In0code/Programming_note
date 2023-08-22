package day0814;

import java.awt.FlowLayout;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JRadioButton;

import kr.co.sist.statement.DbConnection;

@SuppressWarnings("serial")
public class TableButton extends JFrame {

	JRadioButton jcb;

	public TableButton() throws SQLException {
		super("테이블 선택");

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		DbConnection db = new DbConnection();

		// 1. 드라이버 로딩
		try {
			// 2. 커넥션 얻기
			con = db.getConn();
			// 3. 쿼리문 생성 객체 얻기
			stmt = con.createStatement();
			// 4. 쿼리문 생성 후 결과 얻기
			String selectTable = "select * from tab where tname not like '%$%'";
			rs = stmt.executeQuery(selectTable);
			ButtonGroup bg = new ButtonGroup();

			setLayout(new FlowLayout());
			while (rs.next()) {
//				System.out.println(rs.getString(1));
				jcb = new JRadioButton(rs.getString(1));
				bg.add(jcb);

				add(jcb);
			} // end while

			setSize(500, 400);
			setVisible(true);
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		} finally {
			// 5. 연결 끊기
			db.closeDB(rs, stmt, con);
		} // end finally
	}// TableButton

	public static void main(String[] args) {
		try {
			new TableButton();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

	}// main

}// class