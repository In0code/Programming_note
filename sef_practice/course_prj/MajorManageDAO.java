package self_practice_course_prj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import kr.co.sist.dao.DbConn;
//////////////인영 ///////////////
/////////// 학과관리 DAO ///////////
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
//
//	public List<MajorManageVO> selectAllDptMajor( String major) {
//		List<String> list = new ArrayList<String>();
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		DbConn db = DbConn.getInstance();
//
//		return major ;
//	}

}//class