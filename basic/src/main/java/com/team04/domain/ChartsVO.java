package com.team04.domain;

public class ChartsVO {

	// ====멤버변수====
	// 차트와 관련된 변수
	private int cnt;
	private String list;
	
	// 생성된 총 즐겨찾기 리스트 수
	private int totalCntBookmark;
	// 회원가입한 총 회원 수
	private int totalCntMember;
	// 총 가게 수
	private int totalCntShop;
	
	
	// 기본생성자
	public ChartsVO() {
		
	}

	// 생성자 - 인자있는
	public ChartsVO(int cnt, String list, int totalCntMember, int totalCntBookmark, int totalCntShop) {
		super();
		this.cnt = cnt;
		this.list = list;
		this.totalCntMember = totalCntMember;
		this.totalCntBookmark = totalCntBookmark;
		this.totalCntShop = totalCntShop;
	}
	
	// setter & getter
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	public int getTotalCntMember() {
		return totalCntMember;
	}

	public void setTotalCntMember(int totalCntMember) {
		this.totalCntMember = totalCntMember;
	}

	public int getTotalCntBookmark() {
		return totalCntBookmark;
	}

	public void setTotalCntBookmark(int totalCntBookmark) {
		this.totalCntBookmark = totalCntBookmark;
	}

	public int getTotalCntShop() {
		return totalCntShop;
	}

	public void setTotalCntShop(int totalCntShop) {
		this.totalCntShop = totalCntShop;
	}
	
	
	
}
