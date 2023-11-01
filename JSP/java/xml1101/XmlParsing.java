package xml1101;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class XmlParsing {

	public XmlParsing() throws JDOMException, IOException {
		
		//1. Builder 생성
		SAXBuilder sb=new SAXBuilder();
		//2. Builder 를 사용하여 XML에 접근하고, XML 문서객체(Document)를 저장
//		Document doc=sb.build(new File("E:/dev/workspace/jsp_prj/src/main/webapp/xml1031/hello.xml"));
		Document doc=sb.build(new URL("http://localhost/jsp_prj/xml1031/hello.xml"));
		//3. 최상위 부모노드 얻기
		Element rootNode=doc.getRootElement();
		//4. 자식 노드 얻기
		Element msgNode=rootNode.getChild("msg");
		//5. 노드 명 얻기
		String nodeName=msgNode.getName();
		//6. 노드 값 얻기 ( parsing )
		String nodeValue=msgNode.getValue();
		
		System.out.println(nodeName+" / "+nodeValue);
		
	}//XmlParsing
	
	public static void main(String[] args) {
		try {
			new XmlParsing();
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
	}//main

}//class
