package kr.co.sist.course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConn;

//---------------  관리자/교수 통합 학생 관리 DAO ---------------
public class EmployStuManageDAO {

	private static EmployStuManageDAO esmDAO;

	private EmployStuManageDAO() {

	}

	public static EmployStuManageDAO getInstance() {
		if (esmDAO == null) {
			esmDAO = new EmployStuManageDAO();
		}

		return esmDAO;
	}

	/**
	 * 학부 설정
	 * @return 학부 목록
	 * @throws SQLException
	 */
	public List<String> selectDept() throws SQLException {
		List<String> dptList = new ArrayList<String>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			pstmt = con.prepareStatement("select dptname from dpt");

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dptList.add(rs.getString("dptname"));
			}
		} finally {
			dc.dbClose(rs, pstmt, con);
		}

		return dptList;
	}

	/**
	 * 학과 설정
	 * @param dptName - 선택한 학부명
	 * @return 선택한 학부의 학과 리스트
	 * @throws SQLException
	 */
	public List<String> selectMajor(String dptName) throws SQLException {
		List<String> majorList = new ArrayList<String>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			StringBuilder selectMajor = new StringBuilder();

			selectMajor.append(" select majorname 								")
					   .append(" from dpt d, major m 							")
					   .append(" where m.dptcode = d.dptcode and d.dptname = ?  ");

			pstmt = con.prepareStatement(selectMajor.toString());

			pstmt.setString(1, dptName);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				majorList.add(rs.getString("majorname"));
			}
		} finally {
			dc.dbClose(rs, pstmt, con);
		}

		return majorList;
	}

	/**
	 * 학부&학과로 검색
	 * @param dptName - 학부명
	 * @param majorName - 학과명
	 * @return 선택한 학과의 학생 정보 리스트
	 * @throws SQLException
	 */
	public List<EmployStuManageVO> selectStudentsByDM(String dptName, String majorName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmployStuManageVO> stuInfoList = new ArrayList<EmployStuManageVO>();

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");

			StringBuilder selectDM = new StringBuilder();
			selectDM.append(
					" select s.stuno, s.sname, d.dptname, m.majorname, s.nowlevel, s.phone, s.email, s.addr, s.input_date, s.img ")
					.append(" from student s, major m, dpt d 		 						 ")
					.append(" where s.majorcode = m.majorcode and m.dptcode = d.dptcode 	 ")
					.append(" and d.dptname = ? and m.majorname = ? 						 ")
					.append(" order by s.stuno 												 ");

			pstmt = con.prepareStatement(selectDM.toString());
			pstmt.setString(1, dptName);
			pstmt.setString(2, majorName);

			rs = pstmt.executeQuery();

			EmployStuManageVO esmVO = null;
			while (rs.next()) {
				esmVO = new EmployStuManageVO(rs.getInt("stuno"), rs.getInt("nowlevel"), rs.getString("dptname"),
						rs.getString("majorname"), rs.getString("sname"), rs.getString("phone"), rs.getString("email"),
						rs.getString("addr"), rs.getString("img"), rs.getDate("input_date"));
				stuInfoList.add(esmVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return stuInfoList;
	}

	/**
	 * 학번으로 검색
	 * @param stuNo - 입력한 학번
	 * @return 입력한 학번의 학생 정보
	 * @throws SQLException
	 */
	public EmployStuManageVO selectStudentByNo(int stuNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployStuManageVO esmVO = null;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			esmVO = new EmployStuManageVO();

			StringBuilder selectStuInfo = new StringBuilder();
			selectStuInfo.append(
					" select s.stuno, s.sname, d.dptname, m.majorname, s.nowlevel, s.phone, s.email, s.addr, s.input_date, s.img ")
					.append(" from student s, major m, dpt d 		 						 ")
					.append(" where s.majorcode = m.majorcode and m.dptcode = d.dptcode 	 ")
					.append(" and stuno = ? 												 ");

			pstmt = con.prepareStatement(selectStuInfo.toString());
			pstmt.setInt(1, stuNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				esmVO = new EmployStuManageVO(rs.getInt("stuno"), rs.getInt("nowlevel"), rs.getString("dptname"),
						rs.getString("majorname"), rs.getString("sname"), rs.getString("phone"), rs.getString("email"),
						rs.getString("addr"), rs.getString("img"), rs.getDate("input_date"));
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return esmVO;
	}

	/**
	 * 이름으로 검색
	 * @param sName - 입력한 학생 이름
	 * @return 입력한 이름의 학생 정보 리스트
	 * @throws SQLException
	 */
	public List<EmployStuManageVO> selectStudentByName(String sName) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmployStuManageVO> stuInfoList = new ArrayList<EmployStuManageVO>();
		EmployStuManageVO esmVO = null;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			esmVO = new EmployStuManageVO();

			StringBuilder selectStuInfo = new StringBuilder();
			selectStuInfo.append(
					" select s.stuno, s.sname, d.dptname, m.majorname, s.nowlevel, s.phone, s.email, s.addr, s.input_date, s.img ")
					.append(" from student s, major m, dpt d 		 						 ")
					.append(" where s.majorcode = m.majorcode and m.dptcode = d.dptcode 	 ")
					.append(" and sname = ? 												 ")
					.append(" order by s.stuno 												 ");

			pstmt = con.prepareStatement(selectStuInfo.toString());
			pstmt.setString(1, sName);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				esmVO = new EmployStuManageVO(rs.getInt("stuno"), rs.getInt("nowlevel"), rs.getString("dptname"),
						rs.getString("majorname"), rs.getString("sname"), rs.getString("phone"), rs.getString("email"),
						rs.getString("addr"), rs.getString("img"), rs.getDate("input_date"));
				stuInfoList.add(esmVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return stuInfoList;
	}

	/**
	 * 학생 등록
	 * @param esmVO - 입력한 학생 정보 VO
	 * @return insert 성공 여부
	 * @throws SQLException
	 */
	public int insertStudent(EmployStuManageVO esmVO) throws SQLException {
		int stuno = 0;
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false);

			//학번을 생성하여 변수에 저장한다.
			pstmt = con.prepareStatement(" select to_char(sysdate,'yyyy')||lpad(student_seq.nextval,4,0) as stuno from dual ");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				stuno = rs.getInt("stuno");
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			StringBuilder insertStudent = new StringBuilder();
			insertStudent
			.append(" insert into student(stuno, dptcode, majorcode, pass, sname, phone, email, nowlevel, addr) ")
			.append(" values (?, (select dptcode from dpt where dptname = ?), ")
			.append(" (select majorcode from major where majorname = ?), ")
			.append(" ?, ?, ?, ?, ?, ?) ");
			
			pstmt = con.prepareStatement(insertStudent.toString());
			pstmt.setInt(1, stuno);
			pstmt.setString(2, esmVO.getDptName());
			pstmt.setString(3, esmVO.getMajorName());
			pstmt.setString(4, esmVO.getPhone().substring(9));
			pstmt.setString(5, esmVO.getsName());
			pstmt.setString(6, esmVO.getPhone());
			pstmt.setString(7, esmVO.getEmail());
			pstmt.setInt(8, esmVO.getNowLevel());
			pstmt.setString(9, esmVO.getAddr());

			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				con.commit();
			}
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			dc.dbClose(null, pstmt, con);
		}

		return stuno;
	}

	/**
	 * 학생 수정
	 * @param esmVO - 입력한 학생 정보 VO
	 * @return update 성공 여부
	 * @throws SQLException
	 */
	public int updateStudent(EmployStuManageVO esmVO) throws SQLException {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false);

			StringBuilder updateStudent = new StringBuilder();
			updateStudent
			.append(" update student 													")
			.append(" set dptcode = (select dptcode from dpt where dptname = ?), 		")
			.append(" majorcode = (select majorcode from major where majorname = ?), 	")
			.append(" sname = ?, phone = ?, email = ?, nowlevel = ?, addr = ? 			")
			.append(" where stuno = ?													");

			pstmt = con.prepareStatement(updateStudent.toString());
			
			pstmt.setString(1, esmVO.getDptName());
			pstmt.setString(2, esmVO.getMajorName());
			pstmt.setString(3, esmVO.getsName());
			pstmt.setString(4, esmVO.getPhone());
			pstmt.setString(5, esmVO.getEmail());
			pstmt.setInt(6, esmVO.getNowLevel());
			pstmt.setString(7, esmVO.getAddr());
			pstmt.setInt(8, esmVO.getStuno());

			cnt = pstmt.executeUpdate();
			
			if (cnt == 1) {
				con.commit();
			}

		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			dc.dbClose(null, pstmt, con);
		}
		return cnt;
	}

	/*
	 * 
	 * 
	 * 
	 * 
	 * 교 수
	 * 
	 * 
	 * 
	 * 
	 */

	/**
	 * 학부&학과로 검색
	 * @param majorName - 학과명
	 * @param empNo - 사번
	 * @return 선택한 학과의 학생 정보 리스트
	 * @throws SQLException
	 */
	public List<EmployStuManageVO> selectProfStudentsByDM(String majorName, String empNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmployStuManageVO> stuInfoList = new ArrayList<EmployStuManageVO>();

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");

			StringBuilder selectStuInfo = new StringBuilder();
			selectStuInfo.append(
					" select s.stuno, s.sname, d.dptname, m.majorname, s.nowlevel, s.phone, 								")
					.append(" s.email, s.addr, s.input_date, s.img, sj.subname, sj.subcode, t.grade, h.semester, h.slevel 	")
					.append(" from dpt d, major m, student s, hakyeon h, course c, tgrade t, subject sj 					")
					.append(" where (m.dptcode=d.dptcode and s.majorcode=m.majorcode and									")
					.append(" h.stuno=s.stuno and c.subcode = sj.subcode 													")
					.append(" and (c.stuno=h.stuno and c.slevel=h.slevel and c.semester=h.semester) 						")
					.append(" and (t.subcode=c.subcode and t.stuno=c.stuno and t.slevel=c.slevel and t.semester=c.semester))")
					.append(" and m.majorname='" + majorName + "' and sj.empno = '" + empNo + "' 							")
					.append(" and h.semester = case when to_number(to_char(sysdate, 'mm')) > 6 then 2 else 1 end and h.slevel = s.nowlevel")
					.append(" order by s.stuno 																		    	");

			pstmt = con.prepareStatement(selectStuInfo.toString());
			// bind 변수 오류나서 동적 변수로 할당함

			rs = pstmt.executeQuery();

			EmployStuManageVO esmVO = null;
			while (rs.next()) {
				esmVO = new EmployStuManageVO(rs.getInt("stuno"), rs.getInt("nowlevel"), rs.getInt("slevel"),
						rs.getInt("semester"), rs.getString("dptname"), rs.getString("majorname"),
						rs.getString("sname"), rs.getString("phone"), rs.getString("email"), rs.getString("addr"),
						rs.getString("img"), rs.getString("grade"), rs.getDate("input_date"));
				stuInfoList.add(esmVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return stuInfoList;
	}

	/**
	 * 학번으로 검색
	 * @param stuNo - 학번
	 * @param empNo - 사번
	 * @return 입력한 학번의 학생 정보
	 * @throws SQLException
	 */
	public EmployStuManageVO selectProfStudentByNo(int stuNo, String empNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployStuManageVO esmVO;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			esmVO = new EmployStuManageVO();

			StringBuilder selectStuInfo = new StringBuilder();
			selectStuInfo.append(
					" select s.stuno, s.sname, d.dptname, m.majorname, s.nowlevel, s.phone, 								")
					.append(" s.email, s.addr, s.input_date, s.img, sj.subname, sj.subcode, t.grade, h.semester, h.slevel 	")
					.append(" from dpt d, major m, student s, hakyeon h, course c, tgrade t, subject sj 					")
					.append(" where (m.dptcode=d.dptcode and s.majorcode=m.majorcode and									")
					.append(" h.stuno=s.stuno and c.subcode = sj.subcode 													")
					.append(" and (c.stuno=h.stuno and c.slevel=h.slevel and c.semester=h.semester) 						")
					.append(" and (t.subcode=c.subcode and t.stuno=c.stuno and t.slevel=c.slevel and t.semester=c.semester))")
					.append(" and s.stuno='" + stuNo + "' and sj.empno = '" + empNo + "' 									")
					.append(" and h.semester = case when to_number(to_char(sysdate, 'mm')) > 6 then 2 else 1 end and h.slevel = s.nowlevel");


			pstmt = con.prepareStatement(selectStuInfo.toString());
			// bind 변수 오류나서 동적 변수로 할당함
			// pstmt.setInt(1, stuNo);
			// pstmt.setString(2, empno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				esmVO = new EmployStuManageVO(rs.getInt("stuno"), rs.getInt("nowlevel"), rs.getInt("slevel"),
						rs.getInt("semester"), rs.getString("dptname"), rs.getString("majorname"),
						rs.getString("sname"), rs.getString("phone"), rs.getString("email"), rs.getString("addr"),
						rs.getString("img"), rs.getString("grade"), rs.getDate("input_date"));
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return esmVO;
	}

	/**
	 * 이름으로 검색
	 * @param sName - 입력한 학생 이름
	 * @param empNo - 사번
	 * @return 입력한 이름의 학생 정보 리스트
	 * @throws SQLException
	 */
	public List<EmployStuManageVO> selectProfStudentByName(String sName, String empNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EmployStuManageVO> stuInfoList = new ArrayList<EmployStuManageVO>();
		EmployStuManageVO esmVO;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			esmVO = new EmployStuManageVO();
			
			StringBuilder selectStuInfo = new StringBuilder();
			selectStuInfo.append(
					" select s.stuno, s.sname, d.dptname, m.majorname, s.nowlevel, s.phone, 								")
					.append(" s.email, s.addr, s.input_date, s.img, sj.subname, sj.subcode, t.grade, h.semester, h.slevel 	")
					.append(" from dpt d, major m, student s, hakyeon h, course c, tgrade t, subject sj 					")
					.append(" where (m.dptcode=d.dptcode and s.majorcode=m.majorcode and									")
					.append(" h.stuno=s.stuno and c.subcode = sj.subcode 													")
					.append(" and (c.stuno=h.stuno and c.slevel=h.slevel and c.semester=h.semester) 						")
					.append(" and (t.subcode=c.subcode and t.stuno=c.stuno and t.slevel=c.slevel and t.semester=c.semester))")
					.append(" and s.sname='" + sName + "' and sj.empno = '" + empNo + "' 									")
					.append(" and h.semester = case when to_number(to_char(sysdate, 'mm')) > 6 then 2 else 1 end and h.slevel = s.nowlevel")
					.append(" order by s.stuno 																		     	");

			pstmt = con.prepareStatement(selectStuInfo.toString());
			// bind 변수 오류나서 동적 변수로 할당함
			// pstmt.setString(1, sname);
			// pstmt.setString(2, empno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				esmVO = new EmployStuManageVO(rs.getInt("stuno"), rs.getInt("nowlevel"), rs.getInt("slevel"),
						rs.getInt("semester"), rs.getString("dptname"), rs.getString("majorname"),
						rs.getString("sname"), rs.getString("phone"), rs.getString("email"), rs.getString("addr"),
						rs.getString("img"), rs.getString("grade"), rs.getDate("input_date"));
				stuInfoList.add(esmVO);
			}

		} finally {
			dc.dbClose(rs, pstmt, con);
		}
		return stuInfoList;
	}

	/**
	 * 성적 등록
	 * @param grade - 성적
	 * @param empNo - 사번
	 * @param stuNo - 학번
	 * @param level - 현재 학년
	 * @return update 성공 여부
	 * @throws SQLException
	 */
	public int updateGrade(String grade, String empNo, int stuNo, int level) throws SQLException {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConn dc = DbConn.getInstance();

		try {
			con = dc.getConnection("192.168.10.142", "applepie", "mincho");
			con.setAutoCommit(false);

			StringBuilder updateGrade = new StringBuilder();
			updateGrade
			.append(" update tgrade set grade = '"+ grade + "' 								  										")
			.append(" where subcode = (SELECT s.subcode from subject s, emp e where s.empno = e.empno and e.empno = '"+ empNo +"')  ")
			.append(" and stuno = '"+ stuNo +"' and slevel = '"+ level +"' 		      												")
			.append(" and semester = case when to_number(to_char(sysdate, 'mm')) > 6 then 2 else 1 end 								");
			
			System.out.println(updateGrade);
			
			pstmt = con.prepareStatement(updateGrade.toString());

			cnt = pstmt.executeUpdate();

			if (cnt == 1) {
				con.commit();
			}

		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			dc.dbClose(null, pstmt, con);
		}

		return cnt;
	}

}
