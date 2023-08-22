package day0816_work;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DbConn;

public class tableInfoDAO {

	private static tableInfoDAO tiDAO;

	public tableInfoDAO() {

	}// tableInfoDAO

	public static tableInfoDAO getInstance() {
		if (tiDAO == null) {
			tiDAO = new tableInfoDAO();
		} // end if
		return tiDAO;
	}// getInstance

	public void insertInfo(informationVO infoVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		DbConn db = DbConn.getInstance();

		// 1. 드라이버로딩
		try {
			// 2. 커넥션 얻기
			con = db.getConnection("localhost", "scott", "tiger");
			// 3. 쿼리문 생성 객체 얻기
			String insertImfo = "insert into work_user values(?,?,?,?)";

			pstmt = con.prepareStatement(insertImfo);
			// 4. 바인드 변수 값 설정
			pstmt.setString(1, infoVO.getName());
			pstmt.setInt(2, infoVO.getAge());
			pstmt.setInt(3, infoVO.getNum());
			pstmt.setInt(4, infoVO.getImage());

			// 5. 쿼리문 수행 결과 얻기
			pstmt.executeQuery();

		} finally {
			// 6. 연결 끊기
			db.dbClose(null, pstmt, con);
		} // end finally

	}// tableImfo

	public informationVO selectInfo(int infoNum) throws SQLException {

		informationVO infoVO = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		DbConn db = DbConn.getInstance();

		try {
			// 1. 드라이버로딩

			// 2. 커넥션 얻기
			con = db.getConnection("127.0.0.1", "scott", "tiger");

			// 3. 쿼리문 생성 객체 얻기
			String selectInfo = "	select name,age,num,image from work_user where num=?	";

			pstmt = con.prepareStatement(selectInfo.toString());
			// 4. 바인 변수 값 설정
			pstmt.setInt(1, infoNum);
			// 5. 쿼리문 수행 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				infoVO = new informationVO();
				infoVO.setNum(infoNum);
				infoVO.setName(rs.getString("name"));
				infoVO.setAge(rs.getInt("age"));
				infoVO.setImage(rs.getInt("image"));
			} // end if

		} finally {

			// 6. 연결 끊기
			db.dbClose(rs, pstmt, con);
		} // end finally

		return infoVO;
	}// selectInfo

}// class
