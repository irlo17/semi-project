package com.team04.domain;

public class FilterFoodKindVO {
	
	//사이드 필터창 음식종류
	private String koreanFood;
	private String japaneseFood;
	private String chineseFood;
	private String westernFood;
	private String worldFood;
	private String buffet;
	private String cafe;
	private String pup;
	
	//사이드 필터창 가격대
	private String manwonLess;
	private String manwonMore;
	private String threeManwonMore;
	private String fiveManwonMore;
	
	private String shopAddressSi;
	private String shopAddressGu;
	
	private String parking;
	private String open;
	
	public FilterFoodKindVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FilterFoodKindVO(String koreanFood, String japaneseFood, String chineseFood, String westernFood,
			String worldFood, String buffet, String cafe, String pup, String manwonLess, String manwonMore,
			String threeManwonMore, String fiveManwonMore, String shopAddressSi, String shopAddressGu, String parking,
			String open) {
		super();
		this.koreanFood = koreanFood;
		this.japaneseFood = japaneseFood;
		this.chineseFood = chineseFood;
		this.westernFood = westernFood;
		this.worldFood = worldFood;
		this.buffet = buffet;
		this.cafe = cafe;
		this.pup = pup;
		this.manwonLess = manwonLess;
		this.manwonMore = manwonMore;
		this.threeManwonMore = threeManwonMore;
		this.fiveManwonMore = fiveManwonMore;
		this.shopAddressSi = shopAddressSi;
		this.shopAddressGu = shopAddressGu;
		this.parking = parking;
		this.open = open;
	}






	public String getKoreanFood() {
		return koreanFood;
	}

	public void setKoreanFood(String koreanFood) {
		this.koreanFood = koreanFood;
	}

	public String getJapaneseFood() {
		return japaneseFood;
	}

	public void setJapaneseFood(String japaneseFood) {
		this.japaneseFood = japaneseFood;
	}

	public String getChineseFood() {
		return chineseFood;
	}

	public void setChineseFood(String chineseFood) {
		this.chineseFood = chineseFood;
	}

	public String getWesternFood() {
		return westernFood;
	}

	public void setWesternFood(String westernFood) {
		this.westernFood = westernFood;
	}

	public String getWorldFood() {
		return worldFood;
	}

	public void setWorldFood(String worldFood) {
		this.worldFood = worldFood;
	}

	public String getBuffet() {
		return buffet;
	}

	public void setBuffet(String buffet) {
		this.buffet = buffet;
	}

	public String getCafe() {
		return cafe;
	}

	public void setCafe(String cafe) {
		this.cafe = cafe;
	}

	public String getPup() {
		return pup;
	}

	public void setPup(String pup) {
		this.pup = pup;
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


	public String getShopAddressSi() {
		return shopAddressSi;
	}


	public void setShopAddressSi(String shopAddressSi) {
		this.shopAddressSi = shopAddressSi;
	}


	public String getShopAddressGu() {
		return shopAddressGu;
	}


	public void setShopAddressGu(String shopAddressGu) {
		this.shopAddressGu = shopAddressGu;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	

}
