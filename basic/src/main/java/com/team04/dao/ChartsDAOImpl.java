package com.team04.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.domain.ChartsVO;

@Repository
public class ChartsDAOImpl implements ChartsDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	/**
	 * 메소드명 : bookmarkDateListManager()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO가 담긴 List형
 	 * 사용 : chartsMapper에 있는 bookmarkDateListManager를 호출하여,
	 * 		DB에서 월별 회원가입 수 리스트를 받아와 리턴하는 함수
	 */
	@Override
	public List<ChartsVO> bookmarkDateListManager() {
		System.out.println("===> mybatis bookmarkDateListManager 호출");
		return mybatis.selectList("chartsDAO.bookmarkDateListManager");
	}

	/**
	 * 메소드명 : memberDateListManager()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO가 담긴 List형
 	 * 사용 : chartsMapper에 있는 memberDateListManager를 호출하여,
	 * 		DB에서 월별 회원가입 수 리스트를 받아와 리턴하는 함수
	 */
	@Override
	public List<ChartsVO> memberDateListManager() {
		System.out.println("===> mybatis memberDateListManager 호출");
		return mybatis.selectList("chartsDAO.memberDateListManager");
	}
	
	/**
	 * 메소드명 : foodByShopListManager()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO가 담긴 List형
 	 * 사용 : chartsMapper에 있는 foodByShopListManager를 호출하여,
	 * 		DB에서 음식종류별 가게 수 리스트를 받아와 리턴하는 함수
	 */
	@Override
	public List<ChartsVO> foodByShopListManager() {
		System.out.println("===> mybatis foodByShopListManager 호출");
		return mybatis.selectList("chartsDAO.foodByShopListManager");
	}
	
	/**
	 * 메소드명 : totalConutMember()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO
 	 * 사용 : chartsMapper에 있는 totalConutMember를 호출하여,
	 * 		DB에서 전체 회원 수를 리턴하는 함수
	 */
	@Override
	public ChartsVO totalCountMember() {
		System.out.println("===> mybatis totalCountMember 호출");
		return mybatis.selectOne("chartsDAO.totalCountMember");
	}
	
	/**
	 * 메소드명 : totalCountBookmark()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO
 	 * 사용 : chartsMapper에 있는 totalCountBookmark를 호출하여,
	 * 		DB에서 전체 즐겨찾기 리스트 수를 리턴하는 함수
	 */
	@Override
	public ChartsVO totalCountBookmark() {
		System.out.println("===> mybatis totalCountBookmark 호출");
		return mybatis.selectOne("chartsDAO.totalCountBookmark");
	}
	
	/**
	 * 메소드명 : totalCountShop()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO
 	 * 사용 : chartsMapper에 있는 totalCountShop를 호출하여,
	 * 		DB에 저장된 전체 가게 수를 리턴하는 함수
	 */
	@Override
	public ChartsVO totalCountShop() {
		System.out.println("===> mybatis totalCountShop 호출");
		return mybatis.selectOne("chartsDAO.totalCountShop");
	}

}
