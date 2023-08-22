package day0720;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InvalidClassException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class UseObjectSteam {

	public void writeObject() throws IOException {
		// 1. 데이터를 가진 객체를 생성
		UserData ud = new UserData("김선경", 182.7, 76.8);
		// 2. 스트림을 생성
		ObjectOutputStream oos = null;
		try {
			oos = new ObjectOutputStream(new FileOutputStream(new File("e:/dev/temp/object.txt")));
			// 3. 스트림에 객체 쓰기
			oos.writeObject(ud); // IOException, NotSerializableException
			// 4. 분출
			oos.flush();
			System.out.println("객체 쓰기 성공");
		} finally {
			// 5. 연결 끊기
			if (oos != null) {
				oos.close();
			} // end if
		} // end finally
	}// writeObject

	public void readObject() throws IOException, ClassNotFoundException {
		// 1. 스트림 생성
		ObjectInputStream ois = null;
		try {
			ois = new ObjectInputStream(new FileInputStream(new File("e:/dev/temp/object.txt")));
			// 2. 스트림에서 객체 읽기
			UserData us = (UserData) ois.readObject(); // casting해서 부모를 바꿔준다
			// 3. 객체를 사용
			System.out.println("이름 : " + us.getName() + ", 키 : " + us.getHeight() + ", 몸무게 : " + us.getWeight());
		} finally {
			// 4. 연결 끊기
			if (ois != null) {
				ois.close();
			} // end if
		} // end finally
	}// readObject

	public static void main(String[] args) {
		UseObjectSteam uos = new UseObjectSteam();
//		try {
//			uos.writeObject();
//		} catch (NotSerializableException nse) {
//			System.out.println("직렬화가 되지 않습니다");
//			nse.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} // end catch
		System.out.println("----------------------");
		try {
			uos.readObject();
		}catch(InvalidClassException  ice) {
			System.out.println("사용기한이 종료된 객체입니다");
			ice.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch
	}// main

}// class
