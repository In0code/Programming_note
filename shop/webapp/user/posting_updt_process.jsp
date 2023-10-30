<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="user.vo.SummaryVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.dao.UserReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>

<script type="text/javascript">

$(function() {
   
   
});//ready
</script>
</head>
<body>

<%

UserReviewDAO uDAO = UserReviewDAO.getInstance();
try {
File saveDir = new File("C:/Users/user/git/prj_online_store/prj_web_shopping/src/main/webapp/upload");
	 int maxSize=1024*1024*30;
	 MultipartRequest mr = new MultipartRequest( request, saveDir.getAbsolutePath() , maxSize , "UTF-8" , new DefaultFileRenamePolicy() );
    String rcodeParam = mr.getParameter("rcode");
int star = Integer.parseInt(mr.getParameter("star"));
String review= mr.getParameter("review");
System.out.println(rcodeParam);
System.out.println(star);
System.out.println(review);
	 String originFile=mr.getOriginalFileName("file");
	 String newFile=mr.getFilesystemName("file");
 if( originFile==null){
		 if (rcodeParam != null && !rcodeParam.isEmpty() ) {
		        int rcode = Integer.parseInt(rcodeParam);
		     
		        uDAO.updateReivew(review,star,rcode,"첨부X");
	 } 
		 } 
	 boolean flag=false;
	 if(newFile !=null) {
		 File tempFile=new File(saveDir.getAbsolutePath()+"/"+newFile);
		 int limitSize=1024*1024*5;
		 if(tempFile.length()>limitSize){
			 flag=true;
			 tempFile.delete();
		 }
    if (rcodeParam != null && !rcodeParam.isEmpty()&& !flag  ) {
        int rcode = Integer.parseInt(rcodeParam);
     
        uDAO.updateReivew(review,star,rcode,originFile);
	
    } else {
        // rcodeParam이 null이거나 비어 있을 때 처리할 내용 추가
        out.println("rcodem이 유효하지 않습니다.");
    }
}
}catch (NumberFormatException e) {
    // NumberFormatException을 처리할 코드 추가
    out.println("rcodem을 파싱하는 중 오류가 발생했습니다.");
    e.printStackTrace(); // 에러 메시지와 스택 트레이스 출력
}catch(IOException ie) {
	 ie.printStackTrace();
	 out.println("파일 업로드 처리 중 문제 발생");
}

%>

<div style=" margin-top: 300px; margin-left: 150px; font: pretendard; " >
리뷰 수정이 완료 되었습니다.
</div>
</body>


</html>