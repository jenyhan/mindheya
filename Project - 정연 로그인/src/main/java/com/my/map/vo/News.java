package com.my.map.vo;

public class News {

	private String bmSeq;
	private String id;
	private String title;
	private String summary;
	private String press;
	private String address;
	private String indate;

	public News(String bmSeq, String id, String title, String summary, String press, String address, String indate) {
		super();
		this.bmSeq = bmSeq;
		this.id = id;
		this.title = title;
		this.summary = summary;
		this.press = press;
		this.address = address;
		this.indate = indate;
	}

	public News() {
		super();
	}

	public String getbmSeq() {
		return bmSeq;
	}

	public void setbmSeq(String bmSeq) {
		this.bmSeq = bmSeq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "News [bmSeq=" + bmSeq + ", id=" + id + ", title=" + title + ", summary=" + summary + ", press=" + press
				+ ", address=" + address + ", indate=" + indate + "]";
	}

}