package self_practice_course_prj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;
import javax.swing.JOptionPane;

import kr.co.sist.dao.DbConn;

/**
 * 인영 학과 관리 DAO
 * 
 * @author user
 *
 */
public class MajorManageDAO {

	private static MajorManageDAO mmDAO;

	private MajorManageDAO() {

	}

	public static MajorManageDAO getInstance() {
		if (mmDAO == null) {
			mmDAO = new MajorManageDAO();
		} // end if
		return mmDAO;
	}// getInstance

	/**
	 * 학과 전체 조회해서 조회된 정보를 JTable에 추가하기 위한 일
	 * 
	 * @param major
	 * @return list
	 * @throws SQLException
	 */
	public List<MajorManageVO> selectAllMajor() throws SQLException {
		
		List<MajorManageVO> list = new ArrayList<MajorManageVO>();
		MajorManageVO mmVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			StringBuilder selectAllMajorInfo = new StringBuilder();
			selectAllMajorInfo.append("	select d.dptname, m.majorcode, m.majorname	")
					.append("	from dpt d, major m							")
					.append("	where d.dptcode = m.dptcode					");

			pstmt = con.prepareStatement(selectAllMajorInfo.toString());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				mmVO = new MajorManageVO(rs.getString("dptName"), rs.getString("majorCode"), rs.getString("majorName"));
				list.add(mmVO);
			} // end while

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectAllMajor
	
	
	public void insertMajor(MajorManageVO mmVO) {

		
		
	}// insertMajor

	
	/**
	 * 학과 정보 수정 후, 수정 된 하고가 정보를 DB에 update하는 일
	 * 
	 * @param mmVO
	 * @return
	 */
	public int updateMajor(MajorManageVO mmVO) throws SQLException {

		PreparedStatement pstmt = null;
		Connection con = null;

		int rowCntUpdate = 0;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false);

			StringBuilder updateMajorInfo = new StringBuilder();
			updateMajorInfo
			.append("		")
			.append("		")
			.append("		");

			System.out.println(updateMajorInfo);
			pstmt = con.prepareStatement(updateMajorInfo.toString());

			rowCntUpdate = pstmt.executeUpdate();

			if (rowCntUpdate == 0) {
				JOptionPane.showMessageDialog(null, "입력한 정보를 다시 확인해주세요");
				con.rollback();
			} else {
				JOptionPane.showMessageDialog(null, "학과 수정이 완료되었습니다");
				con.commit();
			} // end else

			con.setAutoCommit(true);
		} catch (Exception e) {
			if (con != null) {
				con.rollback();
			} // end if

		} finally {
			db.dbClose(null, pstmt, con);
		} // end finally

		return rowCntUpdate;
	}// updateMajor

	

}// class