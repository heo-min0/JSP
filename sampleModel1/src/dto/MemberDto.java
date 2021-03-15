package dto;

import java.io.Serializable;

//Data Transfer Object : DTO
//Value Object : VO
public class MemberDto implements Serializable{
	private String id, pwd, name, email;
	private int auth; // 사용자:3		관리자:1
	
	public MemberDto() {}

	public MemberDto(String id, String pwd, String name, String email, int auth) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.auth = auth;
	}

	public String getId() {	return id;	}
	public String getPwd() {	return pwd;	}
	public String getName() {	return name;	}
	public String getEmail() {	return email;	}
	public int getAuth() {	return auth;	}
	public void setId(String id) {	this.id = id;	}
	public void setPwd(String pwd) {	this.pwd = pwd;	}
	public void setName(String name) {	this.name = name;	}
	public void setEmail(String email) {	this.email = email;	}
	public void setAuth(int auth) {	this.auth = auth;	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", auth=" + auth + "]";
	}
}