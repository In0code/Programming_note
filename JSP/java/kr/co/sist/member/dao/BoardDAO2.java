package kr.co.sist.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DbConnection;
import kr.co.sist.member.vo.BoardListVO;
import kr.co.sist.member.vo.BoardRangeVO;
import kr.co.sist.member.vo.ReplyVO;
import kr.co.sist.member.vo.WebMemberVO;

public class BoardDAO2 {
	private static BoardDAO2 bDAO;

	private BoardDAO2() {
	}

	public static BoardDAO2 getInstance() {
		if (bDAO == null) {
			bDAO = new BoardDAO2();
		} // end if
		return bDAO;
	}// getInstance

	/**
	 * 10-23일 Dynamic Query로 변경
	 * 
	 * @param brVO
	 * @return
	 * @throws SQLException
	 */
	public int totalCount() throws SQLException {
		int totalCount = 0;

		DbConnection db = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1.
			// 2.
			// 3.
			con = db.getConn("jdbc/dbcp");
			// 4.
			StringBuilder selectCnt = new StringBuilder();
			selectCnt.append("select count(*) cnt from board	");

			pstmt = con.prepareStatement(selectCnt.toString());
			// 5.
			// 6.
			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalCount = rs.getInt("cnt");
			} // end if

		} finally {
			// 7.
			db.dbClose(rs, pstmt, con);
		} // end finally

		return totalCount;
	}// totalCount

	/**
	 * 시작번호와 끝번호 사이의 레코드를 검색
	 * 
	 * @return
	 */
	public List<BoardListVO> selectBoard(BoardRangeVO brVO) throws SQLException {
		List<BoardListVO> list = new ArrayList<BoardListVO>();

		DbConnection db = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. JNDI사용객체 생성
			// 2. DataSource얻기
			// 3. Connection 얻기
			con = db.getConn("jdbc/dbcp");
			// 4. 쿼리문 생성객체 얻기 => 검색 키워드와 검색 field에 따라 Dynamic Query로 변경
			StringBuilder selectMember = new StringBuilder();
			selectMember.append("	select  num, subject,writer,input_date		")
					.append("	from(select num, subject,writer,input_date	")
					.append("		,row_number() over( order by input_date desc ) rnum		")
					.append("	from		board										");
			selectMember.append(")	where rnum between ? and ?									");

			pstmt = con.prepareStatement(selectMember.toString());
			// 5. 바인드 변수에 값설정

			pstmt.setInt(1, brVO.getStartNum());
			pstmt.setInt(2, brVO.getEndNum());

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			BoardListVO blVO = null;

			while (rs.next()) {
				blVO = new BoardListVO();

				blVO.setNum(rs.getInt("num"));
				blVO.setSubject(rs.getString("subject"));
				blVO.setWriter(rs.getString("writer"));
				blVO.setInput_date(rs.getDate("input_date"));

				list.add(blVO);

			} // end while

		} finally {
			// 7. 연결 끊기
			db.dbClose(rs, pstmt, con);
		} // end finally

		return list;
	}// selectMember

	public BoardListVO selectBoardDetail(int num) throws SQLException {
		BoardListVO blVO = null;
		DbConnection db = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// 1.
			// 2.
			// 3.
			con = db.getConn("jdbc/dbcp");
			// 4.
			StringBuilder selectCnt = new StringBuilder();
			selectCnt.append("SELECT NUM, CONTENT, subject, WRITER, INPUT_DATE 	");
			selectCnt.append("FROM board	");
			selectCnt.append("WHERE NUM=?	");

			pstmt = con.prepareStatement(selectCnt.toString());
			// 5.
			pstmt.setInt(1, num);
			// 6.
			rs = pstmt.executeQuery();

			if (rs.next()) {
				blVO = new BoardListVO();
				blVO.setNum(rs.getInt("num"));
				blVO.setWriter(rs.getString("writer"));
				blVO.setSubject(rs.getString("subject"));
				blVO.setContent(rs.getString("content"));
				blVO.setInput_date(rs.getDate("input_date"));
			} // end if
		} finally {
			// 7.
			db.dbClose(rs, pstmt, con);
		} // end finally
		return blVO;
	}// totalCount

	public List<ReplyVO> selectReplyList(int num) throws SQLException {
		List<ReplyVO> list = new ArrayList<ReplyVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection db = DbConnection.getInstance();
		try {
			// 1.
			// 2.
			con = db.getConn("jdbc/dbcp");
			// 3.
			StringBuilder selectReply = new StringBuilder();
			selectReply
			.append("	select reply_num, num, content, writer, input_date	")
			.append("	from reply	")
			.append("	where num = ?	")
			.append("	order by input_date desc	");

			pstmt = con.prepareStatement(selectReply.toString());
			// 4.
			pstmt.setInt(1, num);
			// 5.
			rs = pstmt.executeQuery();
			// 6.
			ReplyVO rVO = null;
			while (rs.next()) {
				rVO = new ReplyVO();
				rVO.setNum(rs.getInt("num"));
				rVO.setContent(rs.getString("content"));
				rVO.setInput_date(rs.getDate("input_date"));
				rVO.setWriter(rs.getString("writer"));
				rVO.setReply_num(rs.getInt("reply_num"));

				list.add(rVO);
			} // end while

		} finally {
			// 7.
			db.dbClose(rs, pstmt, con);

		} // end finally
		return list;
	}// selectList
	
	public int deleteReply( int num ) throws SQLException {
		int removeCnt = 0;
		DbConnection db = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1.
			// 2.
			// 3.
			con = db.getConn("jdbc/dbcp");
			// 4.
			StringBuilder selectCnt = new StringBuilder();
			selectCnt.append("delete from reply where reply_num = ? 	");

			pstmt = con.prepareStatement(selectCnt.toString());
			// 5.
			pstmt.setInt( 1, num );
			// 6.
			removeCnt=pstmt.executeUpdate();
		} finally {
			// 7.
			db.dbClose(null , pstmt, con);
		} // end finally
		return removeCnt;
	}// deleteReply

}// class
