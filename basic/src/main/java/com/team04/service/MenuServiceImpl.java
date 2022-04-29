package com.team04.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.MenuDAO;
import com.team04.domain.MenuVO;

// Menu(메뉴테이블) Service 구현 클래스
@Service
public class MenuServiceImpl implements MenuService {

	// Menu(메뉴테이블) DAO연결
	@Autowired
	private MenuDAO menuDAO;
	
	/*
	 * 함수명 : menuInsertManager()
	 * 인자 : MenuVO menuVO (= 메뉴 테이블 값이 담김)
	 * 리턴값 : 없음
	 * 사용 : MenuVO에 담긴 값들을 DB의 Menu테이블에 insert하도록
	 * 		MenuDAO의 menuInsertManger()함수 호출함
	 */
	@Override
	public void menuInsertManager(MenuVO menuVO) {
		menuDAO.menuInsertManager(menuVO);
	}

	@Override
	public void menuUpdateManager(MenuVO menuVO) {
		// TODO Auto-generated method stub

	}

	/*
	 * 함수명 : menuDeleteManager()
	 * 인자 : MenuVO menuVO (= 메뉴 테이블 값이 담김)
	 * 리턴값 : 없음
	 * 사용 : MenuVO에 담긴 shopNumber와 menuName이 같은 데이터를 delete하도록
	 * 		MenuDAO의 menuDeleteManager()함수 호출함
	 */
	@Override
	public void menuDeleteManager(MenuVO menuVO) {
		menuDAO.menuDeleteManager(menuVO);
	}

	@Override
	public MenuVO menuGetManager(MenuVO menuVO) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * 함수명 : menuGetListManager()
	 * 인자 : MenuVO menuVO (= 메뉴 테이블 값이 담김)
	 * 리턴값 : 없음
	 * 사용 : MenuVO에 담긴 shopNumber와 같은 list검색 후 그 값을 리턴하는
	 * 		MenuDAO의 menuGetListManager()함수 호출함
	 */
	@Override
	public List<MenuVO> menuGetListManager(MenuVO menuVO) {
		return menuDAO.menuGetListManager(menuVO);
	}

}
