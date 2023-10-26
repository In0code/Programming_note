<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="application/octet-stream"
    pageEncoding="UTF-8"%>
    <%@ page info="무조건 다운로드" %>

 <%
 String fileName=request.getParameter("file_name");
 
 if(fileName == null ){
	 response.sendRedirect("../day1024/file_list.jsp");
	 return;
 }//end if
 
 //한글파일명을 처리하기 위해
 fileName=new String(fileName.getBytes("UTF-8"),"8859_1");
 
 //2. 응답 헤더 변경
 response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
 
 //3. 다운로드할 파일의 정보 얻기
 fileName=new String(fileName.getBytes("8859_1"),"UTF-8");
 
 File downFile
 	=new File("E:/dev/workspace/jsp_prj/src/main/webapp/upload/"+fileName);
 
 //4. 다운로드할 파일에 Stream 연결
 FileInputStream fis=new FileInputStream( downFile.getAbsoluteFile() );
 
//5. html을 응답하기 위한 Stream을 초기화
out.clear();

//6. 초기화된 스트림을 재설정 ( HTML응답 -> File 응답)
out=pageContext.pushBody();
 
//7. 츌력스트림 얻기
OutputStream os=response.getOutputStream();

//8. 파일의 내용을 읽어들여 출력
byte[] temp= new byte[512];
int readSize=0;

while( (readSize=fis.read(temp)) != -1){
	os.write(temp,0,readSize);
}//end while
os.flush();
 
 %>