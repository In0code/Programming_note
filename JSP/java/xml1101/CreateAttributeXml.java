package xml1101;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import kr.co.sist.member.vo.PersonVO;

public class CreateAttributeXml {

	public CreateAttributeXml() throws IOException {
		//1. Builder 생성
		SAXBuilder sb=new SAXBuilder();
		//2. 문서 객체 생성
		Document doc=new Document();
		//3. 최 상위 노드 생성
		Element rootNode=new Element("persons");
		
		List<PersonVO> list=new ArrayList<PersonVO>();
		list.add(new PersonVO("짱구","김","남자",31));
		list.add(new PersonVO("인영","김","여자",25));
		list.add(new PersonVO("아영","김","여자",27));
		list.add(new PersonVO("영재","김","남자",29));
		
		//4. 자식 노드를 생성하고 배치
		Element personNode=null;
		Element nameNode=null;
		//속성 객체 생성
		Attribute genderAttr =null;
		Attribute ageAttr =null;
		
		for(PersonVO pVO : list) {
			personNode=new Element("person");
			//속성 생성
			genderAttr=new Attribute("gender", pVO.getGender());
			ageAttr=new Attribute("age",String.valueOf(pVO.getAge()));
			//노드에 속성을 설정
			personNode.setAttribute(genderAttr);
			personNode.setAttribute(ageAttr);
			
			nameNode=new Element("name");
			nameNode.setText(pVO.getFirstName());
			//Element 클래스에서 제공하는 속성 추가 method 사용
			nameNode.setAttribute("lastName",pVO.getLastName());
			//속성 추가
			//자식 노드를 부모노드에 배치
			personNode.addContent(nameNode);
			//자식을 가진 부모노드를 최상위 부모노드에 배치
			rootNode.addContent(personNode);
		}//end for
		//5. 모든 자식을 가진 부모 노드를 문서객체에 배치
		doc.addContent(rootNode);
		//6. 출력
		XMLOutputter xOut=new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, new FileOutputStream("E:/dev/workspace/jsp_prj/src/main/webapp/xml1101/attr.xml"));
		
	}//CreateAttributeXml
	
	public static void main(String[] args) {
		try {
			new CreateAttributeXml();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
	}//main

}//class
