package com.team04.domain;

public class MenuVO {

	/*
	** 메뉴 테이블 **
	CREATE TABLE menu (
    shop_number NUMBER,
    menu_name   VARCHAR2(50),
    menu_price  NUMBER,
    CONSTRAINT fk_shop_number_menu FOREIGN KEY ( shop_number )
        REFERENCES shop ( shop_number ),
    CONSTRAINT pk_shop_menu PRIMARY KEY ( shop_number,
                                          menu_name )
	);
	 */
	
	// 멤버변수
	private int shopNumber;
	private String menuName;
	private int menuPrice;
	
	// 기본생성자 - 인자없는
	public MenuVO() {
		
	}

	// 생성자 - 인자있는
	public MenuVO(int shopNumber, String menuName, int menuPrice) {
		super();
		this.shopNumber = shopNumber;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
	}
	
	// setter & getter
	public int getShopNumber() {
		return shopNumber;
	}
	public void setShopNumber(int shopNumber) {
		this.shopNumber = shopNumber;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	
	
	
}
