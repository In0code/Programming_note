<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.lang.model.util.SimpleAnnotationValueVisitor14"%>
<%@page import="org.w3c.dom.html.HTMLLabelElement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.member.vo.StudentVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.member.dao.StuDAO"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info=""  trimDirectiveWhitespaces="true"%>
<%
//1. 문서 객체 생성
Document doc=new Document();
//2. 최상위 부모노드 생성
Element studentsNode=new Element("students");
StuDAO sDAO = StuDAO.getInstance();
boolean errFlag=false;
List<StudentVO> list=null;
File file=new File("E:/dev/workspace/jsp_prj/src/main/webapp/xml1031/student.xml");
try{
	list=sDAO.selectAllStudent();
Element dataSizeNode=new Element("dataSize");
dataSizeNode.setText(String.valueOf(list.size()));
studentsNode.addContent(dataSizeNode);

Element requestURLNode=new Element("requestURL");
requestURLNode.setText("http://localhost.jsp_prj.xml1031/"+file.getName());
studentsNode.addContent(requestURLNode);

}catch(SQLException se){
	errFlag=true;
	se.printStackTrace();
}//end catch

Element errFlagNode=new Element("isErrFlag");
errFlagNode.setText(String.valueOf(errFlag));
studentsNode.addContent(errFlagNode);

if( !errFlag){
	Element studentNode=null;
	Element numNode=null;
	Element nameNode=null;
	Element ageNode=null;
	Element emailNode=null;
	Element input_dateNode=null;

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd EEEE");
//3. 자식노드들을 생성
for(StudentVO sVO : list){
	studentNode=new Element("student");
//	자식 노들에 값 할당
numNode=new Element("num");
numNode.setText(String.valueOf(sVO.getNum()));

nameNode=new Element("name");
nameNode.setText(String.valueOf(sVO.getNum()));

ageNode=new Element("age");
ageNode.setText(String.valueOf(sVO.getAge()));

emailNode=new Element("email");
emailNode.setText(sVO.getEmail());

input_dateNode=new Element("input_date");
input_dateNode.setText(sdf.format(sVO.getInput_date()));

studentNode.addContent(numNode);
studentNode.addContent(nameNode);
studentNode.addContent(ageNode);
studentNode.addContent(emailNode);
studentNode.addContent(input_dateNode);
//4. 자식 노드를 부모노드에 배치
studentsNode.addContent(studentNode);
}//end for
}//end if
//5. 부모 노드를 문서 객체 배치
doc.setRootElement(studentsNode);
//6. 문서 객체를 출력
XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
xOut.output(doc, System.out);

FileOutputStream fos=new FileOutputStream(file);
xOut.output(doc, fos);
%>
