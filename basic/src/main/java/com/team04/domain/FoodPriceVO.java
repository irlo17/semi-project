package com.team04.domain;

public class FoodPriceVO {

	String manwonLess;
	String manwonMore;
	String threeManwonMore;
	String fiveManwonMore;

	public FoodPriceVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodPriceVO(String manwonLess, String manwonMore, String threeManwonMore, String fiveManwonMore) {
		super();
		this.manwonLess = manwonLess;
		this.manwonMore = manwonMore;
		this.threeManwonMore = threeManwonMore;
		this.fiveManwonMore = fiveManwonMore;
	}

	public String getManwonLess() {
		return manwonLess;
	}

	public void setManwonLess(String manwonLess) {
		this.manwonLess = manwonLess;
	}

	public String getManwonMore() {
		return manwonMore;
	}

	public void setManwonMore(String manwonMore) {
		this.manwonMore = manwonMore;
	}

	public String getThreeManwonMore() {
		return threeManwonMore;
	}

	public void setThreeManwonMore(String threeManwonMore) {
		this.threeManwonMore = threeManwonMore;
	}

	public String getFiveManwonMore() {
		return fiveManwonMore;
	}

	public void setFiveManwonMore(String fiveManwonMore) {
		this.fiveManwonMore = fiveManwonMore;
	}

}
