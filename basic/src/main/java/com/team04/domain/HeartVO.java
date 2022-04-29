package com.team04.domain;

public class HeartVO {
	int likeNumber;
	int listNumber;
	String memberEmail;
	
	public HeartVO() {
	
	}
	public HeartVO(int likeNumber, int listNumber, String memberEmail) {
		super();
		this.likeNumber = likeNumber;
		this.listNumber = listNumber;
		this.memberEmail = memberEmail;
	}
	
	
	
	
	public int getLikeNumber() {
		return likeNumber;
	}
	public void setLikeNumber(int likeNumber) {
		this.likeNumber = likeNumber;
	}
	public int getListNumber() {
		return listNumber;
	}
	public void setListNumber(int listNumber) {
		this.listNumber = listNumber;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
}
