package com.team04.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.domain.MenuVO;

// Menu(메뉴 테이블) DAO 구현 클래스
@Repository
public class MenuDAOImpl implements MenuDAO {

	// DB를 연결하기위한 mybatis 연결
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * 함수명 : menuInsertManager()
	 * 인자 : MenuVO menuVO (= 파라메터 값 저장된 VO)
	 * 리턴값 : 없음
	 * 사용 : MenuVO에 담긴 내용을 DB에 insert하기 위해
	 * 		menuMapper의 menuInsertManager호출함
	 */
	@Override
	public void menuInsertManager(MenuVO menuVO) {
		System.out.println("===> mybatis menuInsertManager()함수 호출");
		mybatis.insert("menuDAO.menuInsertManager", menuVO);
	}

	@Override
	public void menuUpdateManager(MenuVO menuVO) {
		// TODO Auto-generated method stub

	}

	/*
	 * 함수명 : menuDeleteManager()
	 * 인자 : MenuVO menuVO (= 파라메터 값 저장된 VO)
	 * 리턴값 : 없음
	 * 사용 : MenuVO에 담긴 shopNumber와 menuName이 같은 데이터를 delete하기 위해
	 * 		menuMapper의 menuDeleteManager호출함
	 */
	@Override
	public void menuDeleteManager(MenuVO menuVO) {
		System.out.println("===> mybatis menuDeleteManager()함수 호출");
		mybatis.delete("menuDAO.menuDeleteManager", menuVO);
	}

	@Override
	public MenuVO menuGetManager(MenuVO menuVO) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * 함수명 : menuGetListManager()
	 * 인자 : MenuVO menuVO (= 파라메터 값 저장된 VO)
	 * 리턴값 : List<MenuVO> (= 검색 된 값)
	 * 사용 : menuVO에 담긴 shopNumber와 같은 데이터를 검색하기위해
	 * 		menuMapper의 menuGetListManager를 호출하여 List<MenuVO>에 담아 리턴하는 함수
	 */
	@Override
	public List<MenuVO> menuGetListManager(MenuVO menuVO) {
		System.out.println("===> mybatis menuGetListManager()함수 요청됨");
		return mybatis.selectList("menuDAO.menuGetListManager", menuVO);
	}

}
