package kr.co.sist.member.vo;

import java.sql.Date;

public class BoardListVO {
	private int num;
	private String  subject,writer,content;
	private Date  input_date;
	public BoardListVO() {
		super();
	}
	public BoardListVO(int num, String subject, String writer, String content, Date input_date) {
		super();
		this.num = num;
		this.subject = subject;
		this.writer = writer;
		this.content = content;
		this.input_date = input_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInput_date() {
		return input_date;
	}
	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}
	@Override
	public String toString() {
		return "BoardListVO [num=" + num + ", subject=" + subject + ", writer=" + writer + ", content=" + content
				+ ", input_date=" + input_date + "]";
	}
	
	
}
