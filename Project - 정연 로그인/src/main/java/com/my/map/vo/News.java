package com.my.map.vo;


public class News {

	String gdid;
	String articleId;
	String officeId;
	String officeName;
	String title;
	String summary;
	String serviceTime;
	String imageUrl;
	String type;
	String sessionId;
	String modelVersion;
	String airsServiceType;
	
	public News() {}

	public News(String gdid, String articleId, String officeId, String officeName, String title, String summary,
			String serviceTime, String imageUrl, String type, String sessionId, String modelVersion,
			String airsServiceType) {
		this.gdid = gdid;
		this.articleId = articleId;
		this.officeId = officeId;
		this.officeName = officeName;
		this.title = title;
		this.summary = summary;
		this.serviceTime = serviceTime;
		this.imageUrl = imageUrl;
		this.type = type;
		this.sessionId = sessionId;
		this.modelVersion = modelVersion;
		this.airsServiceType = airsServiceType;
	}

	public String getGdid() {
		return gdid;
	}

	public void setGdid(String gdid) {
		this.gdid = gdid;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
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

	public String getServiceTime() {
		return serviceTime;
	}

	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getModelVersion() {
		return modelVersion;
	}

	public void setModelVersion(String modelVersion) {
		this.modelVersion = modelVersion;
	}

	public String getAirsServiceType() {
		return airsServiceType;
	}

	public void setAirsServiceType(String airsServiceType) {
		this.airsServiceType = airsServiceType;
	}

	@Override
	public String toString() {
		return "News [gdid=" + gdid + ", articleId=" + articleId + ", officeId=" + officeId + ", officeName="
				+ officeName + ", title=" + title + ", summary=" + summary + ", serviceTime=" + serviceTime
				+ ", imageUrl=" + imageUrl + ", type=" + type + ", sessionId=" + sessionId + ", modelVersion="
				+ modelVersion + ", airsServiceType=" + airsServiceType + "]";
	}
	
}