package com.my.map.vo;

public class Member {
	
	private String id;
	private String pw;
	private String email;
	public Member(String id, String pw, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", email=" + email + "]";
	}
	
}
