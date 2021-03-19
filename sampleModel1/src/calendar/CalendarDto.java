package calendar;

import java.io.Serializable;

public class CalendarDto implements Serializable {
	private int seq;
	private String id, title, content, rdate, wdate;
									// 약속일     작성한날짜
	public CalendarDto() {	}
	public CalendarDto(int seq, String id, String title, String content, String rdate, String wdate) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
		this.wdate = wdate;
	}
	public CalendarDto(String id, String title, String content, String rdate) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
	}
	public int getSeq() {	return seq;	}
	public String getId() {	return id;	}
	public String getTitle() {	return title;	}
	public String getContent() {	return content;	}
	public String getRdate() {	return rdate;	}
	public String getWdate() {	return wdate;	}
	public void setId(String id) {	this.id = id;	}
	public void setSeq(int seq) {	this.seq = seq;	}
	public void setTitle(String title) {	this.title = title;	}
	public void setContent(String content) {	this.content = content;	}
	public void setRdate(String rdate) {	this.rdate = rdate;	}
	public void setWdate(String wdate) {	this.wdate = wdate;	}
	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", rdate="
				+ rdate + ", wdate=" + wdate + "]";
	}
}
