package kr.co.sist.memo;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;

import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

public class JavaMemoFontEvt extends WindowAdapter implements ActionListener, ListSelectionListener {
	private JavaMemoFont jmf;
	private JavaMemo jm;

	private String font;
	private int style;
	private int size;

	public JavaMemoFontEvt(JavaMemoFont jmf, JavaMemo jm) {
		this.jmf = jmf;
		this.jm = jm;
		font = jm.getJta().getFont().getName();
		style = jm.getJta().getFont().getStyle();
		size = jm.getJta().getFont().getSize();
		String strStyle = "";

		// 스위치로 int 값을 str로 반환
		switch (style) {
		case Font.PLAIN:
			strStyle = "일반";
			break;
		case Font.BOLD:
			strStyle = "굵게";
			break;
		case Font.ITALIC:
			strStyle = "기울임꼴";
			break;
		case Font.ITALIC + Font.BOLD:
			strStyle = "굵은기울임꼴";
			break;
		}// end switch

		// 서식창에 기존JTA의 폰트 적용
		jmf.getJtfFont().setText(font);
		jmf.getJtfStyle().setText(strStyle);
		jmf.getJtfSize().setText(Integer.toString(size));
		setFont();
		setSize();
		setStyle();
		InitialFont();
	}// JavaMemoFontEvt

	// JFont 값추가
	public void setFont() {
		DefaultListModel<String> dlm = jmf.getDlmFont();
		dlm.addElement("돋음");
		dlm.addElement("맑은 고딕");
		dlm.addElement("궁서체");
		dlm.addElement("Serif");
		dlm.addElement("SansSerif");
	}// setFont

	// JStyle 값추가
	public void setStyle() {
		DefaultListModel<String> dlm = jmf.getDlmStyle();
		dlm.addElement("일반");
		dlm.addElement("굵게");
		dlm.addElement("기울임꼴");
		dlm.addElement("굵은기울임꼴");
	}// setStyle

	// 프리뷰 기본값 가져오기
	public void InitialFont() {
		font = jmf.getJlbPreview().getFont().getFontName();
		style = jmf.getJlbPreview().getFont().getStyle();
		size = jmf.getJlbPreview().getFont().getSize();
	}

	// JSize 값 추가
	public void setSize() {
		DefaultListModel<String> dlm = jmf.getDlmSize();
		for (int i = 8; i < 11; i++) {
			dlm.addElement(Integer.toString(i));
		} // end for
		for (int i = 12; i < 81; i += 2) {
			dlm.addElement(Integer.toString(i));
		} // end for
	}// setSize
		// ------------------------------------------------------------
		// ListEvn메소드

	public void fontEnv() {
		// 선택된 item 텍스트필드에 보이기
		DefaultListModel<String> dlm = jmf.getDlmFont();
		JList<String> jlFont = jmf.getJFont();
		font = dlm.getElementAt(jlFont.getSelectedIndex());
		jmf.getJtfFont().setText(font);

		// Preview font적용
		jmf.getJlbPreview().setFont(new Font(font, style, size));
	}// fontEnv

	public void styleEnv() {
		// 선택된 item 텍스트필드에 보이기
		DefaultListModel<String> dlm = jmf.getDlmStyle();
		JList<String> jlStyle = jmf.getJStyle();
		String strstyle = dlm.getElementAt(jlStyle.getSelectedIndex());
		jmf.getJtfStyle().setText(strstyle);

		// 스위치로 String형 스타일을 상수값으로 변환
		switch (strstyle) {
		case "일반":
			style = Font.PLAIN;
			break;
		case "굵게":
			style = Font.BOLD;
			break;
		case "기울임꼴":
			style = Font.ITALIC;
			break;
		case "굵은기울임꼴":
			style = Font.ITALIC | Font.BOLD;
			break;
		}// end switch

		// 임시 font 및 Preview font적용
		jmf.getJlbPreview().setFont(new Font(font, style, size));
	}// styleEnv

	public void sizeEnv() {
		// 선택된 item 텍스트필드에 보이기
		DefaultListModel<String> dlm = jmf.getDlmSize();
		JList<String> jlFont = jmf.getJSize();
		size = Integer.valueOf(dlm.getElementAt(jlFont.getSelectedIndex()));
		jmf.getJtfSize().setText(String.valueOf(size));
		// Preview size적용
		jmf.getJlbPreview().setFont(new Font(font, style, size));
	}// sizeEnv
		// ------------------------------------------------------------

	// btnOk method
	public void buttonOk() {
		jm.getJta().setFont(new Font(font, style, size));
		jmf.dispose();
	}// buttonOk

	// btnCancle method
	public void buttonCancle() {
		jmf.dispose();
	}// buttonCancle

	// Dialog 이벤트
	@Override
	public void valueChanged(ListSelectionEvent lse) {
		if (lse.getSource() == jmf.getJFont()) {
			fontEnv();
		} // end if
		if (lse.getSource() == jmf.getJStyle()) {
			styleEnv();
		} // end if
		if (lse.getSource() == jmf.getJSize()) {
			sizeEnv();
		} // end if
	}// valueChanged

	@Override
	public void actionPerformed(ActionEvent ae) {
		if (ae.getSource() == jmf.getJbtnOk()) {
			buttonOk();
		} // end if
		if (ae.getSource() == jmf.getJbtnCancle()) {
			buttonCancle();
		} // end if
	}// actionPerformed

}// class
