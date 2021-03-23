package dto;

import java.io.Serializable;

//PDS Public Domain Software 자료실
public class PdsDto implements Serializable{
	private int seq, readcount, downcount, dell;
	private String id , title, content, filename, regdate, oriFilename;
	
	public PdsDto() {}

	public PdsDto(int seq, String id, String title, String content, String filename, String oriFilename, int readcount, int downcount, String regdate, int dell) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.oriFilename = oriFilename;
		this.readcount = readcount;
		this.downcount = downcount;
		this.regdate = regdate;
		this.dell = dell;
	}

	public PdsDto(String id, String title, String content, String filename, String oriFilename) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.oriFilename = oriFilename;
	}

	public int	  getSeq() 		 {return seq;}
	public String getId()        {return id;}
	public String getTitle() 	 {return title;}
	public String getContent()   {return content;}
	public String getFilename()  {return filename;}
	public String getOriFilename() {return oriFilename;}
	public int 	  getReadcount() {return readcount;}
	public int    getDowncount() {return downcount;}
	public String getRegdate()   {return regdate;}
	public int    getDell() 	 {return dell;}
	public void setSeq(int seq) 		     {this.seq = seq;}
	public void setId(String id)  			 {this.id = id;}
	public void setTitle(String title) 		 {this.title = title;}
	public void setContent(String content)   {this.content = content;}
	public void setFilename(String filename) {this.filename = filename;}
	public void setOriFilename(String oriFilename) {this.oriFilename = oriFilename;}
	public void setReadcount(int readcount)  {this.readcount = readcount;}
	public void setDowncount(int downcount)  {this.downcount = downcount;}
	public void setRegdate(String regdate)   {this.regdate = regdate;}
	public void setDell(int dell)  {this.dell = dell;}
	@Override
	public String toString() {
		return "PdsDto [seq=" + seq + ", readcount=" + readcount + ", downcount=" + downcount + ", dell=" + dell
				+ ", id=" + id + ", title=" + title + ", content=" + content + ", filename=" + filename + ", regdate="
				+ regdate + ", oriFilename=" + oriFilename + "]";
	}
}
