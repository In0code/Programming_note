package kr.co.sist.member.vo;

import java.sql.Date;

public class ReplyVO {
	private int reply_num, num;
	private String content, writer;
	private Date input_date;
	public ReplyVO() {
		super();
	}
	public ReplyVO(int reply_num, int num, String content, String writer, Date input_date) {
		super();
		this.reply_num = reply_num;
		this.num = num;
		this.content = content;
		this.writer = writer;
		this.input_date = input_date;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getInput_date() {
		return input_date;
	}
	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_num=" + reply_num + ", num=" + num + ", content=" + content + ", writer=" + writer
				+ ", input_date=" + input_date + "]";
	}
	
	
}
