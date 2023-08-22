
package kr.co.sist.log.evt;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import kr.co.sist.log.evt.Result;

public class ResultEvt implements ActionListener {
	
	private Result r;
	
	public ResultEvt(Result r) {
		this.r = r;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// Ȯ�� ��ư ������ ���� ����
		r.dispose();
	}
}