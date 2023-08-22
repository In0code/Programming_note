package day0707;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class UseMap {

	public void useHashtable() {
		// 1. 생성 : 11개의 행이 자동 생성
		Map<String, String> map = new Hashtable<String, String>();

		// 2. 값 할당
		map.put("java", "완벽한 OOP언어");
		map.put("oracle", "대용량 데이터베이스");
		map.put("HTML", "Hyper Text Markup Language");
		map.put("css", "HTML의 디자인");

		// 키가 같으면 기존 키에 덮어 쓴다.
		map.put("HTML", "Tim berners`Lee가 고안한 웹 언어");

		// 키가 존재하는지
		System.out.println(map.containsKey("java"));
		System.out.println(map.containsKey("Oracle"));

		// 값 얻기 : 존재하지 않는 키를 넣으면 null이 나온다.
		System.out.println(map.get("java"));
		System.out.println(map.get("Oracle"));

		// 모든 키 얻기
		Set<String> keySet = map.keySet();
		System.out.println(keySet);

		// 모든 값 얻기
		Iterator<String> ita = keySet.iterator();
		String key = "";
		while (ita.hasNext()) {
			key = ita.next();
			System.out.println(key + " : " + map.get(key));
		}

		// 값 삭제
		map.remove("css");

		// 모든 값 삭제
		map.clear();

		System.out.println(map + " / " + map.size());

	}

	public void useHashMap() {
		Map<String, String> map = new HashMap<String, String>();
		// 2. 값 할당
		map.put("java", "완벽한 OOP언어");
		map.put("oracle", "대용량 데이터베이스");
		map.put("HTML", "Hyper Text Markup Language");
		map.put("css", "HTML의 디자인");

		// 키가 같으면 기존 키에 덮어 쓴다.
		map.put("HTML", "Tim berners`Lee가 고안한 웹 언어");

		// 키가 존재하는지
		System.out.println(map.containsKey("java"));
		System.out.println(map.containsKey("Oracle"));

		// 값 얻기 : 존재하지 않는 키를 넣으면 null이 나온다.
		System.out.println(map.get("java"));
		System.out.println(map.get("Oracle"));

		// 모든 키 얻기
		Set<String> keySet = map.keySet();
		System.out.println(keySet);

		// 모든 값 얻기
		Iterator<String> ita = keySet.iterator();
		String key = "";
		while (ita.hasNext()) {
			key = ita.next();
			System.out.println(key + " : " + map.get(key));
		}

		// 값 삭제
		map.remove("css");

		// 모든 값 삭제
		map.clear();

		System.out.println(map + " / " + map.size());
	}

	public static void main(String[] args) {
		UseMap um = new UseMap();

		um.useHashtable();
		System.out.println("=========================================");
		um.useHashMap();

	}

}
