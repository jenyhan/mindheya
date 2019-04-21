package com.my.map.vo;

public class News {

	private String bmSeq;
	private String id;
	private String title;
	private String summary;
	private String press;
	private String address;
	private String indate;
	private String img_src;

	public News(String bmSeq, String id, String title, String summary, String press, String address, String indate,
			String img_src) {
		super();
		this.bmSeq = bmSeq;
		this.id = id;
		this.title = title;
		this.summary = summary;
		this.press = press;
		this.address = address;
		this.indate = indate;
		this.img_src = img_src;
	}

	public News() {
		super();
	}

	public String getBmSeq() {
		return bmSeq;
	}

	public void setBmSeq(String bmSeq) {
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

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	@Override
	public String toString() {
		return "News [bmSeq=" + bmSeq + ", id=" + id + ", title=" + title + ", summary=" + summary + ", press=" + press
				+ ", address=" + address + ", indate=" + indate + ", img_src=" + img_src + "]";
	}

}