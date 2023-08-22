package day0822_sunkhung;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

public class EmpDAO {

	private static EmpDAO eDAO;

	private EmpDAO() {

	}

	public static EmpDAO getInstance() {
		if (eDAO == null) {
			eDAO = new EmpDAO();
		}
		return eDAO;
	}

	public List<String> selecEmpno() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> listEmpno = new ArrayList<String>();

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("localhost", "scott", "tiger");

			String selectEmpno = "select empno from emp";

			pstmt = con.prepareStatement(selectEmpno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				listEmpno.add(String.valueOf(rs.getInt("empno")));
			}
			return listEmpno;
		} finally {
			dc.dbClose(rs, pstmt, con);
		}
	}

	public EmpVO selectOneEmpInfo(String empno) throws SQLException {
		EmpVO eVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("localhost", "scott", "tiger");

			StringBuilder selectEmpno = new StringBuilder();
			selectEmpno.append("	select empno,ename, to_char(hiredate,'yyyy-mm-dd') hiredate,job,sal		")
					.append("	from emp													")
					.append("	where empno = ?												");

			pstmt = con.prepareStatement(selectEmpno.toString());

			pstmt.setInt(1, Integer.parseInt(empno));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				eVO = new EmpVO();

				eVO.setEmpno(rs.getString("empno"));
				eVO.setEname(rs.getString("ename"));
				eVO.setHiredate(rs.getString("hiredate"));
				eVO.setJob(rs.getString("job"));
				eVO.setSal(rs.getString("sal"));
			}
		} finally {
			dc.dbClose(rs, pstmt, con);
		}

		return eVO;
	}

}
