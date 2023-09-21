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
					.append("	from dpt d, major m		").append("	where d.dptcode = m.dptcode	");
			System.out.println(selectAllMajorInfo);
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

	/**
	 * 이름으로 교수 한 명 조회해서 조회된 교수의 정보를 JTable에 넣기 위한 일
	 * 
	 * @param dpt
	 * @return
	 * @throws SQLException
	 */
	public List<MajorManageVO> selectOneMajorDpt(String dpt) throws SQLException {
		List<MajorManageVO> list = new ArrayList<MajorManageVO>();
		MajorManageVO mmVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectOneMajorInfo = new StringBuilder();
			selectOneMajorInfo.append("	select d.dptname, m.majorcode, m.majorname	")
					.append("	from dpt d, major m		")
					.append("	where (d.dptcode = m.dptcode) and (d.dptname='" + dpt + "')	");

			pstmt = con.prepareStatement(selectOneMajorInfo.toString());
			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				mmVO = new MajorManageVO(rs.getString("dptName"), rs.getString("majorCode"), rs.getString("majorName"));
				list.add(mmVO);
			} // end if
				// 6. 연결끊기
		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectProf

	/**
	 * 학과코드를 생성하기 위해 학부 코드를 얻는 일<br>
	 * 사번 : 학과코드 6자리 (문자, 숫자 )+ 시퀀스 3자리 ( 숫자 )
	 * 
	 * @param pVO
	 * @return dptCode
	 * @throws SQLException
	 */
	public String getDptCode(MajorManageVO mmVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dptCode = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");

			String getDptCode = "select dptcode from  dpt where dptname = '" + mmVO.getDptName() + "'";

			pstmt = con.prepareStatement(getDptCode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dptCode = rs.getString(1);
			} // end if

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		dptCode = dptCode.trim();
		return dptCode;
	}// getMajorcode

	/**
	 * 학과코드을 생성하기 위해 생성한 시퀀스에서 next number를 가져오는 일
	 * 
	 * @return Integer.parseInt(seq)
	 * @throws SQLException
	 */
	public int getNextMajorSeq() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String seq = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");

			String getSeq = "select majorcode_seq.nextval from dual";

			pstmt = con.prepareStatement(getSeq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				seq = rs.getString(1);
			} // end if

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return Integer.parseInt(seq);
	}// getNextProfSeq

	/**
	 * 학과를 등록하기 위한 일
	 * 
	 * @param mmVO
	 * @throws SQLException
	 */
	public int insertMajor(MajorManageVO mmVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		String majorCode = null;
		int rowCnt = 0;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false); // 자동 커밋 비활성화

			String dptCode = getDptCode(mmVO);
			int seq = getNextMajorSeq();

			majorCode = dptCode + String.format("%03d", seq);

			// 3. 쿼리문 생성 객체 얻기 - bind 값 설정하는 과정에 오류가 있어서 직접 넣음
			StringBuilder insertMajorInfo = new StringBuilder();
			insertMajorInfo.append(" insert into major values ('" + majorCode + "'	")
					.append("	,(select DPTCODE from DPT where DPTNAME = '" + mmVO.getDptName() + "')	")
					.append("	,'" + mmVO.getMajorName() + "')	");

			pstmt = con.prepareStatement(insertMajorInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();

			if (rowCnt == 0) {
				JOptionPane.showMessageDialog(null, "입력한 정보를 다시 확인해주세요");
				con.rollback(); // 실패하면 롤백
			} else {
				JOptionPane.showMessageDialog(null, "학과 등록이 완료되었습니다");
				con.commit(); // 성공하면 커밋
			} // end else

			// 트랜젝션 종료 후 자동 커밋을 다시 활성화
			con.setAutoCommit(true);
		} catch (SQLException e) {
			if (con != null) {
				con.rollback();
			} // end if
			throw e;

		} finally {
			// 6. 연결끊기
			db.dbClose(null, pstmt, con);
		} // end finally
		return rowCnt;
	}// insertMajor

	/**
	 * 학과 정보 수정 후, 수정 된 학과 정보를 DB에 update하는 일
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
			updateMajorInfo.append("	update major	").append("	set  majorname= '" + mmVO.getMajorName() + "'	")
					.append("	where  majorcode= '" + mmVO.getmajorCode() + "'	");

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