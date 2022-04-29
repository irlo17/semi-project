package com.team04.domain;

public class FoodKindVO {
	
	private String koreanFood;
	private String japaneseFood;
	private String chineseFood;
	private String westernFood;
	private String worldFood;
	private String buffet;
	private String cafe;
	private String pup;
	
	public FoodKindVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodKindVO(String koreanFood, String japaneseFood, String chineseFood, String westernFood, String worldFood,
			String buffet, String cafe, String pup) {
		super();
		this.koreanFood = koreanFood;
		this.japaneseFood = japaneseFood;
		this.chineseFood = chineseFood;
		this.westernFood = westernFood;
		this.worldFood = worldFood;
		this.buffet = buffet;
		this.cafe = cafe;
		this.pup = pup;
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
	
	
	
	
	

}
