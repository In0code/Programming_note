<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" trimDirectiveWhitespaces="true"%>
<%
		//1. XML 문서 개체 생성
		Document doc = new Document();
		//2. 최상위 부모 노드 생성
		Element rootNode=new Element("root");
		//3. 자식 노드 생성
		Element subNode=new Element("msg");
		Element nameNode=new Element("name");
		//자식 노드의 값 설정
		subNode.setText("오늘은 비교적 상쾌한 화요일입니다");
		nameNode.setText("김인영");
		//4. 부모노드에 자식노드를 배치
		rootNode.addContent(subNode);
		rootNode.addContent(nameNode);
		//5. 자식 노드를 가진 부모 노드를 문서노드에 배치
		doc.setRootElement(rootNode);
		//6. 부모 노드를 가진 문서 노드를 출력
		try{
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, out); // out 내장객체를 사용하여 web browser로 출력
		}catch(IOException ie){
			out.print("메롱");
		}

%>