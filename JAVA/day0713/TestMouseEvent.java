package day0713;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

/**
 * 마우스 이벤트를 간단하게 처리하기 위해 MouseAdapter 상속
 * 
 * @author user
 *
 */
public class TestMouseEvent extends MouseAdapter {

	private TestMouseDeisgn tmd; // null - 객체가 생성되지 않았따

	/**
	 * TestMouseEvent 클래스가 생성될 때 TestMouseEvent 객체를 입력받아 생성한다 ( has a 관계 )
	 * 
	 * @param tmd
	 */
	public TestMouseEvent(TestMouseDeisgn tmd) {
		this.tmd = tmd;
	}// TestMouseEvent

	@Override
	public void mouseClicked(MouseEvent me) {
		
		
//		System.out.println("마우스버튼이 클릭 되었음");
		String buttonType="";
		switch (me.getButton()) {
		case MouseEvent.BUTTON1:
			buttonType="왼쪽 버튼";
			break;
		case MouseEvent.BUTTON2:
			buttonType="가운데 버튼";
			break;
		case MouseEvent.BUTTON3:
			buttonType="오른쪽 버튼";
			break;

		}//end switch
		
		tmd.getJta().setText(buttonType+"이 클릭 되었음");
	}// mouseClicked

}// class
