package xml1031;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * JDOM Parser를 사용한 XML 생성
 * @author user
 *
 */
public class CreateXml {

	public void createXml() throws IOException {
		
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
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, System.out); // 확인만 가능 => 사용불가
		
		File file=new File("E:/dev/workspace/jsp_prj/src/main/webapp/xml1031/hello.xml");
		FileOutputStream fos=new FileOutputStream(file);
		xOut.output(doc, fos); // 파일로 생성 =>  추후 사용 가능
		
	}//createXml
	
	public static void main(String[] args) {
		try {
			new CreateXml().createXml();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
	}//main
	
}//class
