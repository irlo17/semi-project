package com.team04.dao;

import java.util.List;

import com.team04.domain.MenuVO;

// Menu(메뉴 테이블) Repository 인터페이스
public interface MenuDAO {

	// 메뉴 추가
	void menuInsertManager(MenuVO menuVO);
	
	// 메뉴 수정
	void menuUpdateManager(MenuVO menuVO);
	
	// 메뉴 삭제
	void menuDeleteManager(MenuVO menuVO);
	
	// 메뉴 상세 조회
	MenuVO menuGetManager(MenuVO menuVO);
	
	// 메뉴 전체 리스트 조회
	List<MenuVO> menuGetListManager(MenuVO menuVO);
	
}
