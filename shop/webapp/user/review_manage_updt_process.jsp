<%@page import="user.vo.SummaryVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>

<%

UserReviewDAO uDAO = UserReviewDAO.getInstance();

try {
    String rcodeParam = request.getParameter("rcode");
int star = Integer.parseInt(request.getParameter("star"));
String review= request.getParameter("review");
System.out.println(review);
System.out.println(star);
System.out.println(rcodeParam);
    if (rcodeParam != null && !rcodeParam.isEmpty()) {
        int rcode = Integer.parseInt(rcodeParam);
     
        uDAO.updateReivew(review,star,rcode);
	
    } else {
        // rcodeParam이 null이거나 비어 있을 때 처리할 내용 추가
        out.println("rcodem이 유효하지 않습니다.");
    }
} catch (NumberFormatException e) {
    // NumberFormatException을 처리할 코드 추가
    out.println("rcodem을 파싱하는 중 오류가 발생했습니다.");
    e.printStackTrace(); // 에러 메시지와 스택 트레이스 출력
}


%>


<strong>리뷰 수정이 완료되었습니다.</strong>
</body>


</html>