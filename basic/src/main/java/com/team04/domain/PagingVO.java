package com.team04.domain;

public class PagingVO {

	private int totalRecCount;		// 전체 레코드 수
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage;	// 한페이지당 레코드 수
	private int startRow;			// 시작하는 행
	private int endRow;				// 끝나는 행
	private int page;				// 현재 페이지
	private String memberEmail;		// 회원 이메일
	

	private int reviewTotalRecCount;	//리뷰 전체 레코드수
	private int reviewPageTotalCount; 	// 리뷰 전체페이지수
	private int reviewStartRow;
	private int reviewEndRow;

	private int shopNumber;			// 가게번호
	private int reviewCountPerPage = 3; // 리뷰 한페이지당 레코드수


	private String listNumber;

	public String getListNumber() {
		return listNumber;
	}
	public void setListNumber(String listNumber) {
		this.listNumber = listNumber;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalRecCount() {
		return totalRecCount;
	}
	public void setTotalRecCount(int totalRecCount) {
		this.totalRecCount = totalRecCount;
	}
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	public void setPageTotalCount(int totalRecCount) {
		pageTotalCount = (totalRecCount/getCountPerPage()) + (totalRecCount%getCountPerPage()>0?1:0);
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int page) {
		startRow = page*getCountPerPage()-(getCountPerPage()-1);;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int page) {
		endRow = page*getCountPerPage();
	}

	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	//******************************************************************************
	public int getReviewCountPerPage() {
		return reviewCountPerPage;
	}
	public void setReviewCountPerPage(int reviewCountPerPage) {
		this.reviewCountPerPage = reviewCountPerPage;
	}
	public int getShopNumber() {
		return shopNumber;
	}
	public void setShopNumber(int shopNumber) {
		this.shopNumber = shopNumber;
	}
	public int getReviewTotalRecCount() {
		return reviewTotalRecCount;
	}
	public void setReviewTotalRecCount(int reviewTotalRecCount) {
		this.reviewTotalRecCount = reviewTotalRecCount;
	}
	public int getReviewPageTotalCount() {
		return reviewPageTotalCount;
	}
	public void setReviewPageTotalCount(int reviewTotalRecCount) {
		reviewPageTotalCount = (reviewTotalRecCount/reviewCountPerPage) + (reviewTotalRecCount%reviewCountPerPage>0?1:0);
	}
	public int getReviewStartRow() {
		return reviewStartRow;
	}
	public void setReviewStartRow(int page) {
		reviewStartRow = page*reviewCountPerPage-(reviewCountPerPage-1);
	}
	public int getReviewEndRow() {
		return reviewEndRow;
	}
	public void setReviewEndRow(int page) {
		reviewEndRow = page*reviewCountPerPage;
	}








}
