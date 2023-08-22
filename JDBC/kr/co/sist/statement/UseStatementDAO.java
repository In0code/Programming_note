package kr.co.sist.statement;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;

/**
 * DAO (Data Acces Object) DBMS작업 중 쿼리문에 관한 업무를 정의하는 클래스
 * 
 * @author user
 *
 */
public class UseStatementDAO {
	public void createStudentTableIndex() throws SQLException {
		Connection con = null;
		Statement stmt = null;
		// 1. 로딩하기
		// 2. 커넥션얻기
		DbConnection dc = new DbConnection();
		try {
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			stmt = con.createStatement();
			// 4. 쿼리문 수행결과 얻기
			String createStudent = "create index ind_date_student on student(input_date )";

			/* boolean flag = */stmt.execute(createStudent);
			System.out.println("인덱스 생성완료 되었다");
		} finally {
			// 5. 연결 끊기
			dc.closeDB(null, stmt, con);
		} // end finally
	}// createStudentTableIndex

	public void createStudentTable() throws SQLException {
		Connection con = null;
		Statement stmt = null;
		// 1. 드라이버 로딩하기
		// 2. 커넥션얻기
		DbConnection dc = new DbConnection();
		try {
			con = dc.getConn();
			// 3. 쿼리문 생성객체 얻기
			stmt = con.createStatement();
			// 4. 쿼리문 수행결과 얻기
			StringBuilder createStudent = new StringBuilder();
			createStudent.append("   create table student (                              ")
					.append("   num number(5),                                           ")
					.append("   name varchar2(30)not null,                               ")
					.append("   age number(3) check (age between 20 and 39),   			 ")
					.append("   email varchar2(50),                                      ")
					.append("   input_date date,                                         ")
					.append("   constraint pk_student primary key (num)            		 ")
					.append("   )                                                        ");
			/* boolean flag = */stmt.execute(createStudent.toString());
			System.out.println("테이블 생성완료 되었다");
		} finally {
			// 5. 연결 끊기
			dc.closeDB(null, stmt, con);
		} // end finally
	}// createStudentTable

	public void insertStudent() {

	}// insertStudent

	public void insertStudent(StudentVO sVO) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		DbConnection db = new DbConnection();

		// 1.로딩얻기
		try {
			// 2. 커넥션얻기
			con = db.getConn();
			stmt = con.createStatement();
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder insertStudent = new StringBuilder();
			insertStudent.append("insert into student(NUM, NAME, AGE, EMAIL, INPUT_DATE )").append("values(")
					.append(sVO.getNum()).append(", '").append(sVO.getName()).append("', ").append(sVO.getAge())
					.append(", '").append(sVO.getEmail()).append("', sysdate)");

			int rowCnt = stmt.executeUpdate(insertStudent.toString());
			System.out.println(rowCnt + "추가 완료");

			// 4. 수행 후 결과 얻기
		} finally {
			// 5. 연결 끊기
			db.closeDB(null, stmt, con);
		} // end finally
	}// insertStudent

	// 2번 학생의 이메일을 kang@test.com 에서 kang1@daum.net 으로 변경

	public int updateStudent(StudentVO sVO) throws SQLException {
		Connection con = null;
		Statement stmt = null;
		DbConnection dc = new DbConnection();
		int rowCnt;
		// 1.로딩얻기
		try {
			// 2. 커넥션얻기
			con = dc.getConn();
			stmt = con.createStatement();
			// 3. 쿼리문 생성 객체 얻기
			StringBuilder updateStudent = new StringBuilder();

			updateStudent.append(" update student  ").append("  set   email='").append(sVO.getEmail()).append("'")
					.append("where num= ").append(sVO.getNum());
//			.append(" where email ='").append(sVO.getEmail()).append("'");
//			.append("  where email='Kang@test.com' ");
//			.append("update student ").append("SET email='kang1@daum.net'")
//					.append(" where email ='").append(sVO.getEmail()).append("'");

			rowCnt = stmt.executeUpdate(updateStudent.toString());
			System.out.println(rowCnt + "변경 완료");

			// 4. 수행 후 결과 얻기
		} finally {
			// 5. 연결 끊기
			dc.closeDB(null, stmt, con);
		} // end finally
		return rowCnt;
	}// insertStudent

	// 특정 학생 하나 조회
	public StudentVO selectOneStudent(int stuNum) throws SQLException {
		StudentVO stuVO = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		DbConnection db = new DbConnection();
		try {
			// 1. 드라이버로딩

			// 2. 커넥션 얻기
			con = db.getConn();
			// 3. 쿼리문 생성 객체 얻기
			stmt = con.createStatement();

			// 4. 쿼리문 생성 후 결과 얻기
			StringBuilder selectStudent = new StringBuilder();
			selectStudent.append("select name, age, email, input_date from student where num=").append(stuNum);

			rs = stmt.executeQuery(selectStudent.toString());

			if (rs.next()) { // 조회결과가 0 또는 하나가 발생할 수 있다.
				// 조회된 레코드가 존재하면 레코드의 컬럼값으로 VO를 생성한다
				stuVO = new StudentVO(stuNum, rs.getString("name"), rs.getInt("age"), rs.getString("email"),
						rs.getDate("input_date"));

			} // end if

		} finally {
			// 5. 연결 끊기
			db.closeDB(rs, stmt, con);
		} // end finally

		return stuVO;
	}// selectOneStudent

	/**
	 * 모든 학생 조회
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<StudentVO> selectAllStudent() throws SQLException {
		List<StudentVO> list = new ArrayList<StudentVO>();

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		DbConnection db = new DbConnection();
		try {
			// 1.드라이버로딩

			// 2. 커넥션 얻기
			con = db.getConn();
			// 3. 쿼리문 생성 객체 얻기
			stmt = con.createStatement();
			// 4. 쿼리문 생성 후 결과 얻기
			String selectAllStudent = "select /*+ index(student PK_STUDENT)*/ num,name,age,email,input_date from student";
			rs = stmt.executeQuery(selectAllStudent);

			StudentVO stuVO = null;
			while (rs.next()) {
				// 조회 결과를 사용하여 VO 생성
				stuVO = new StudentVO(rs.getInt("num"), rs.getString("name"), rs.getInt("age"), rs.getString("email"),
						rs.getDate("input_date"));

				// 같은 이름의 VO객체를 관리하기 위해 list에 추가
				list.add(stuVO);

			} // end while

		} finally {
			// 5. 연결끊기
			db.closeDB(rs, stmt, con);
		} // end finally

		return list;
	}// selectAllStudent

}// CLASSS