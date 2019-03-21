package com.my.map.vo;

public class MindMap {
	String gotSeq;
	String leader;
	String groupName;
	String numLimit;
	
	public MindMap() {}
	
	public MindMap(String gotSeq, String leader, String groupName, String numLimit) {
		this.gotSeq = gotSeq;
		this.leader = leader;
		this.groupName = groupName;
		this.numLimit = numLimit;
	}

	public String getGotSeq() {
		return gotSeq;
	}

	public void setGotSeq(String gotSeq) {
		this.gotSeq = gotSeq;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getNumLimit() {
		return numLimit;
	}

	public void setNumLimit(String numLimit) {
		this.numLimit = numLimit;
	}

	@Override
	public String toString() {
		return "MindMap [gotSeq=" + gotSeq + ", leader=" + leader + ", groupName=" + groupName + ", numLimit=" + numLimit
				+ "]";
	}
	
}
