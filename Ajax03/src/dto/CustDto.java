package dto;

import java.io.Serializable;

public class CustDto implements Serializable {
	private String id, name;
	public CustDto() {	}
	public CustDto(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "CustDto [id=" + id + ", name=" + name + "]";
	}
	
}
