package work01;

import java.io.Serializable;
import java.util.Arrays;

public class memCls implements Serializable{
	private String id, pw, age, text;
	private String hobby[];
	public memCls(){}
	public memCls(String id, String pw, String hobby[], String age, String text){
		this.id = id;
		this.pw = pw;
		this.hobby = hobby;
		this.age = age;
		this.text = text;
	}
	public String getId() {	return id;	}
	public void setId(String id) {	this.id = id;	}
	public String getPw() {	return pw;	}
	public void setPw(String pw) {	this.pw = pw;	}
	public String getAge() {	return age;	}
	public void setAge(String age) {	this.age = age;	}
	public String getText() {	return text;	}
	public void setText(String text) {	this.text = text;	}
	public String[] getHobby() {	return hobby;	}
	public void setHobby(String[] hobby) {	this.hobby = hobby;	}
	@Override
	public String toString() {
		return "memCls [id=" + id + ", pw=" + pw + ", age=" + age + ", text=" + text + ", hobby="
				+ Arrays.toString(hobby) + "]";
	}
	
}
