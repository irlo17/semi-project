package com.team04.domain;

public class BookmarkVO {

	
	private int listNumber;
	private String listName;
	private String listDisplay;
	private String memberEmail;
	private String listDate;
	private String defultList;
	private int listLike;
	
	//리스트 출력하기위해서 만들었음
	private String memberNickname;
	private String shopRealfname;
	
	
	
	
	//constructor-------------------------------------------
	public BookmarkVO() {
		 
	}

	public BookmarkVO(int listNumber, String listName, String listDisplay, int listLike, String memberEmail,
			String listDate, String defultList, String memberNickname,String shopRealfname) {
		
		this.listNumber = listNumber;
		this.listName = listName;
		this.listDisplay = listDisplay;
		this.listLike = listLike;
		this.memberEmail = memberEmail;
		this.listDate = listDate;
		this.defultList = defultList;
		this.memberNickname = memberNickname;
		this.shopRealfname = shopRealfname;
		
	}


	//getter and setter ------------------------------------------------------
	public int getListNumber() {
		return listNumber;
	}
	public void setListNumber(int listNumber) {
		this.listNumber = listNumber;
	}
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
	}
	public String getListDisplay() {
		return listDisplay;
	}
	public void setListDisplay(String listDisplay) {
		this.listDisplay = listDisplay;
	}
	public int getListLike() {
		return listLike;
	}
	public void setListLike(int listLike) {
		this.listLike = listLike;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getListDate() {
		return listDate;
	}
	public void setListDate(String listDate) {
		this.listDate = listDate;
	}
	public String getDefultList() {
		return defultList;
	}
	public void setDefultList(String defultList) {
		this.defultList = defultList;
	}
	
	  public String getMemberNickname() { return memberNickname; } 
	  public void
	  setMemberNickname(String memberNickname) { this.memberNickname =
	  memberNickname; }

	public String getShopRealfname() {
		return shopRealfname;
	}

	public void setShopRealfname(String shopRealfname) {
		this.shopRealfname = shopRealfname;
	}
	 
	
	
	
	
	
	
}
