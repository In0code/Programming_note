package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import kr.co.sist.dao.DbConn;

/**
 * 인영 교수 DAO
 * 
 * 
 * @author user
 *
 */
public class ProfDAO {
	private static ProfDAO pDAO;

	private ProfDAO() {

	}

	public static ProfDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProfDAO();
		} // end if
		return pDAO;
	}// getInstance

	/**
	 * 교수 전체 조회해서 조회된 정보를 JTable에 추가하는 위한 일
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<ProfVO> selectAllProf() throws SQLException {

		ProfVO pVO = null;
		List<ProfVO> list = new ArrayList<ProfVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectAllProfInfo = new StringBuilder();
			selectAllProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email 	")
					.append("  from  emp e, major m, dpt d 											")
					.append("  where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode)			");

			pstmt = con.prepareStatement(selectAllProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO(rs.getString("ename"), rs.getString("phone"), rs.getString("email"),
						rs.getString("majorName"), rs.getString("dptName"), rs.getString("empno"));
				list.add(pVO);
			} // end while
		} finally {
			// 6. 연결끊기
			db.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectAllProf

	/**
	 * 사번으로 교수 한 명 조회해서 조회된 교수의 정보를 JTable에 넣기 위한 일
	 * 
	 * @param prof
	 * @return pVO
	 * @throws SQLException
	 */
	public ProfVO selectOneProfEmpno(String prof) throws SQLException {
		ProfVO pVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectOneProfInfo = new StringBuilder();
			selectOneProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email	")
					.append("  from  emp e, major m, dpt d											")
					.append(" where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode)				")
					.append("and ((e.ename= '" + prof + "') or (e.empno= '" + prof + "'))			");

			pstmt = con.prepareStatement(selectOneProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pVO = new ProfVO();
				pVO.setEmpno(rs.getString("empno"));
				pVO.setEname(rs.getString("ename"));
				pVO.setMajorName(rs.getString("majorName"));
				pVO.setDptName(rs.getString("dptName"));
				pVO.setPhone(rs.getString("phone"));
				pVO.setEmail(rs.getString("email"));
			} // end if
				// 6. 연결끊기
		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return pVO;
	}// selectProf

	/**
	 * 이름으로 교수 한 명 조회해서 조회된 교수의 정보를 JTable에 넣기 위한 일
	 * 
	 * @param prof
	 * @return pVO
	 * @throws SQLException
	 */
	public ProfVO selectOneProfEname(String prof) throws SQLException {
		ProfVO pVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder selectOneProfInfo = new StringBuilder();
			selectOneProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email	")
					.append("  from  emp e, major m, dpt d 										  	")
					.append(" where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode)				")
					.append("and (e.ename= '" + prof + "')											");

			pstmt = con.prepareStatement(selectOneProfInfo.toString());
			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pVO = new ProfVO();
				pVO.setEmpno(rs.getString("empno"));
				pVO.setEname(rs.getString("ename"));
				pVO.setMajorName(rs.getString("majorName"));
				pVO.setDptName(rs.getString("dptName"));
				pVO.setPhone(rs.getString("phone"));
				pVO.setEmail(rs.getString("email"));
			} // end if
				// 6. 연결끊기
		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		return pVO;
	}// selectProf

	/**
	 * 사번을 생성하기 위해 학과 코드를 얻는 일<br>
	 * 사번 : 학과코드 6자리 ( 문자, 숫자 )+ C ( 과목코드와 구분하기 위한 ) + 시퀀스 3자리 ( 숫자 ) = 총 10자리
	 * 
	 * @param pVO
	 * @return majorcode
	 * @throws SQLException
	 */
	public String getMajorcode(ProfVO pVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String majorcode = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");

			String getMajorcode = "select majorcode from  major where majorname = '" + pVO.getMajorName() + "'";

			pstmt = con.prepareStatement(getMajorcode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				majorcode = rs.getString(1);
			} // end if

		} finally {
			db.dbClose(rs, pstmt, con);
		} // end finally
		majorcode = majorcode.trim();
		return majorcode;
	}// getMajorcode

	/**
	 * 사번을 생성하기 위해 생성한 시퀀스에서 next number를 가져오는 일
	 * 
	 * @return Integer.parseInt(seq)
	 * @throws SQLException
	 */
	public int getNextProfSeq() throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String seq = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false);

			String getSeq = "select empno_seq.nextval from dual";

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
	 * 교수를 등록하기 위한 DB 작업
	 * 
	 * @param pVO
	 * @return rowCnt
	 * @throws SQLException
	 */
	public int insertProf(ProfVO pVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		String empNo = null;
		int rowCnt = 0;

		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false); // 자동 커밋 비활성화

			String majorCode = getMajorcode(pVO);
			String userCode = "P";
			int seq = getNextProfSeq();

			empNo = majorCode + userCode + String.format("%03d", seq);

			// 3. 쿼리문 생성 객체 얻기 - bind 값 설정하는 과정에 오류가 있어서 직접 넣음
			String getPwByPhone=pVO.getPhone().substring(9,13);
			System.out.println(getPwByPhone);
			StringBuilder insertProfInfo = new StringBuilder();
			insertProfInfo.append(
					" insert into emp(  empno, ename, dptcode, majorcode, phone, email, usercode, pass )				")
					.append(" values ( '" + empNo + "','" + pVO.getEname() + "' ,	")
					.append(" (select DPTCODE from DPT where DPTNAME = '" + pVO.getDptName() + "')	")
					.append(" , (select MAJORCODE from MAJOR where MAJORNAME ='" + pVO.getMajorName() + "'),")
					.append("'" + pVO.getPhone() + "', '" + pVO.getEmail() + "', 'P', '"+getPwByPhone+"' )	");

			pstmt = con.prepareStatement(insertProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();

			if (rowCnt == 0) {
				JOptionPane.showMessageDialog(null, "입력한 정보를 다시 확인해주세요");
				con.rollback(); // 실패하면 롤백
			} else {
				JOptionPane.showMessageDialog(null, "교수 등록이 완료되었습니다");
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
	}// insertProf

	/**
	 * 교수 수정 후, 수정 된 교수 정보를 DB에 update하는 일
	 * 
	 * @param pVO
	 * @return
	 * @throws SQLException
	 */
	public int updateProf(ProfVO pVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		int rowCntUpdate = 0;

		DbConn db = DbConn.getInstance();
		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false); // 자동커밋 비활성화
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder updateProfInfo = new StringBuilder();
			updateProfInfo.append("update emp ").append(" set ename = '" + pVO.getEname() + "' ")
					.append(",DPTCODE= (select DPTCODE from DPT where DPTNAME = '" + pVO.getDptName() + "'  ) ,")
					.append(" MAJORCODE = (select MAJORCODE from MAJOR where MAJORNAME = '" + pVO.getMajorName()
							+ "' )")
					.append(" , phone = '" + pVO.getPhone() + "' , email = '" + pVO.getEmail() + "'")
					.append("  where empno = '" + pVO.getEmpno() + "'");

			pstmt = con.prepareStatement(updateProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rowCntUpdate = pstmt.executeUpdate();

			if (rowCntUpdate == 0) {
				JOptionPane.showMessageDialog(null, "입력한 정보를 다시 확인해주세요");
				con.rollback(); // 실패하면 롤백
			} else {
				JOptionPane.showMessageDialog(null, "교수 수정이 완료되었습니다");
				con.commit(); // 성공하면 커밋
			} // end else

			// 트랜젝션 종료 후 자동 커밋을 다시 활성화
			con.setAutoCommit(true);
		} catch (SQLException e) {
			// SQL 예외를 처리하고 실패한 경우 트랜젝션을 롤백
			if (con != null) {
				con.rollback();
			} // end if

		} finally {
			// 6. 연결끊기
			db.dbClose(null, pstmt, con);
		} // end finally
		return rowCntUpdate;
	}// updateProf

	/**
	 * DB에서 학부를 불러와 콤보박스에 넣기 위한 DB 작업
	 * 
	 * @return list
	 * @throws SQLException
	 */
	public List<ProfVO> selectDptComboBox() throws SQLException {

		ProfVO pVO = null;
		List<ProfVO> list = new ArrayList<ProfVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");

			String setdpt = "select dptname from dpt";

			pstmt = con.prepareStatement(setdpt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO();
				pVO.setDptName(rs.getString("dptname"));
				list.add(pVO);
			} // end if
		} finally {
			db.dbClose(null, pstmt, con);
		} // end finally
		return list;
	}// setdptComboBox

	/**
	 * 학부 콤보박스에서 학부가 선택되면 그에 맞는 학과가 선택되게 하기위한 DB작업
	 * 
	 * @param dpt
	 * @return list
	 * @throws SQLException
	 */
	public List<ProfVO> selectMajorComboBox(String dpt) throws SQLException {

		ProfVO pVO = null;
		List<ProfVO> list = new ArrayList<ProfVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn db = DbConn.getInstance();
		try {
			con = db.getConnection("192.168.10.142", "applepie", "mincho");

			StringBuilder setmajor = new StringBuilder();
			setmajor.append("	select majorname from major m, dpt d	")
					.append(" where m.dptcode=d.dptcode and (d.dptname='" + dpt + "')");

			pstmt = con.prepareStatement(setmajor.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO();
				pVO.setMajorName(rs.getString("majorname"));
				list.add(pVO);
			} // end if
		} finally {
			db.dbClose(null, pstmt, con);
		} // end finally
		return list;
	}// setdptComboBox

}// class