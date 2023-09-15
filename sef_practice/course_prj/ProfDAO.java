package self_practice_course_prj;

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
			selectOneProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email ")
					.append("  from  emp e, major m, dpt d ")
					.append(" where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode) and ((e.ename= '" + prof
							+ "') or (e.empno= '" + prof + "'))   ");

			pstmt = con.prepareStatement(selectOneProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pVO = new ProfVO();
				pVO.setEmpno(rs.getString("empno"));
				pVO.setEname(rs.getString("ename"));
				pVO.setMajorname(rs.getString("majorname"));
				pVO.setDptname(rs.getString("dptname"));
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
			selectOneProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email ")
					.append("  from  emp e, major m, dpt d ")
					.append(" where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode) and (e.ename= '" + prof
							+ "')    ");

			pstmt = con.prepareStatement(selectOneProfInfo.toString());
			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				pVO = new ProfVO();
				pVO.setEmpno(rs.getString("empno"));
				pVO.setEname(rs.getString("ename"));
				pVO.setMajorname(rs.getString("majorname"));
				pVO.setDptname(rs.getString("dptname"));
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
			selectAllProfInfo.append("  select e.empno, e.ename, m.majorname, d.dptname, e.phone, e.email ")
					.append("  from  emp e, major m, dpt d ")
					.append("  where (e.dptcode=d.dptcode) and (e.majorcode=m.majorcode)   ");

			pstmt = con.prepareStatement(selectAllProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pVO = new ProfVO(rs.getString("ename"), rs.getString("phone"), rs.getString("email"),
						rs.getString("majorname"), rs.getString("dptname"), rs.getString("empno"));
				list.add(pVO);
			} // end while
		} finally {
			// 6. 연결끊기
			db.dbClose(rs, pstmt, con);
		} // end finally
		return list;
	}// selectAllProf

	/**
	 * 교수 수정 후, 수정 된 교수 정보를 DB에 update하는 하는 일
	 * 
	 * @param pVO
	 * @return
	 * @throws SQLException
	 */
	public int updateProf(ProfVO pVO) throws SQLException {
		int rowCnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn db = DbConn.getInstance();
		try {
			// 1. 드라이버로딩
			// 2. 커넥션 얻기
			con = db.getConnection("192.168.10.142", "applepie", "mincho");
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder updateProfInfo = new StringBuilder();
			updateProfInfo.append("  update emp ")
					.append(" set ename= ? , majorcode= ? , dptcode=? , phone=? , email=? ")
					.append("  where empno=? or ename= ?   ");

			pstmt = con.prepareStatement(updateProfInfo.toString());
			// 4. 바인드 변수 값 설정
			pstmt.setString(1, pVO.getEname());
			pstmt.setString(2, pVO.getMajorname());
			pstmt.setString(3, pVO.getDptname());
			pstmt.setString(4, pVO.getPhone());
			pstmt.setString(5, pVO.getEmail());
			pstmt.setString(6, pVO.getEmpno());
			pstmt.setString(7, pVO.getEname());
			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();
			if (rowCnt == 0) {
				JOptionPane.showMessageDialog(null, "입력하신 정보를 다시 확인해주세요");
			} else {
				JOptionPane.showMessageDialog(null, "교수 수정이 완료되었습니다");
			} // end else
			// 6. 연결끊기
		} finally {
			db.dbClose(null, pstmt, con);
		} // end finally
		return rowCnt;
	}// updateProf

	/**
	 * 사번을 생성하기 위해 학과 코드를 얻는 일<br>
	 * 사번 : 학과코드 6자리 (문자, 숫자 )+ 시퀀스 3자리 ( 숫자 )
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

			String getMajorcode = "select majorcode from  major where majorname = '" + pVO.getMajorname() + "'";

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
	 * 교수를 등록하기 위한 일
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

			String majorcode = getMajorcode(pVO);
			int seq = getNextProfSeq();

			empNo = majorcode + String.format("%03d", seq);

			// 3. 쿼리문 생성 객체 얻기 - bind 값 설정하는 과정에 오류가 있어서 직접 넣음
			StringBuilder insertProfInfo = new StringBuilder();
			insertProfInfo
					.append(" insert into emp(  empno, ename, dptcode, majorcode, phone, email, usercode) values (")
					.append("'" + empNo + "','" + pVO.getEname() + "' , (select DPTCODE from DPT where DPTNAME = '"
							+ pVO.getDptname() + "')")
					.append(",     " + pVO.getMajorname() + "'), '"
							+ pVO.getPhone() + "', '" + pVO.getEmail() + "', 'P')");

			System.out.println(insertProfInfo);

			pstmt = con.prepareStatement(insertProfInfo.toString());

			// 5. 쿼리문 실행 결과 얻기
			rowCnt = pstmt.executeUpdate();

			if (rowCnt == 0) {
				JOptionPane.showMessageDialog(null, "입력하신 정보를 다시 확인해주세요");
			} else {
				JOptionPane.showMessageDialog(null, "교수 등록이 완료되었습니다");
			} // end else
				// 6. 연결끊기
		} finally {
			db.dbClose(null, pstmt, con);
		} // end finally
		return rowCnt;
	}// insertProf

}// class