package com.team04.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.ChartsDAO;
import com.team04.domain.ChartsVO;

@Service
public class ChartsServiceImpl implements ChartsService {

	@Autowired
	ChartsDAO chartsDAO;
	
	/**
	 * 메소드명 : bookmarkDateListManager()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO가 담긴 List형
 	 * 사용 : chartsDAO에 있는 함수 bookmarkDateListManager()를 호출하여,
	 * 		받아온 List를 Controller에 리턴하는 함수
	 */
	@Override
	public List<ChartsVO> bookmarkDateListManager() {
		return chartsDAO.bookmarkDateListManager();
	}

	/**
	 * 메소드명 : memberDateListManager()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO가 담긴 List형
 	 * 사용 : chartsDAO에 있는 함수 memberDateListManager()를 호출하여,
	 * 		받아온 List를 Controller에 리턴하는 함수
	 */
	@Override
	public List<ChartsVO> memberDateListManager() {
		return chartsDAO.memberDateListManager();
	}
	
	/**
	 * 메소드명 : foodByShopListManager()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO가 담긴 List형
 	 * 사용 : chartsDAO에 있는 함수 foodByShopListManager()를 호출하여,
	 * 		받아온 List를 Controller에 리턴하는 함수
	 */
	@Override
	public List<ChartsVO> foodByShopListManager() {
		return chartsDAO.foodByShopListManager();
	}
	
	/**
	 * 메소드명 : totalConutMember()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO
 	 * 사용 : chartsDAO에 있는 함수 totalConutMember()를 호출하여,
	 * 		받아온 값을 Controller에 리턴하는 함수
	 */
	@Override
	public ChartsVO totalCountMember() {
		return chartsDAO.totalCountMember();
	}
	
	/**
	 * 메소드명 : totalCountBookmark()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO
 	 * 사용 : chartsDAO에 있는 함수 totalCountBookmark()를 호출하여,
	 * 		받아온 값을 Controller에 리턴하는 함수
	 */
	@Override
	public ChartsVO totalCountBookmark() {
		return chartsDAO.totalCountBookmark();
	}
	
	/**
	 * 메소드명 : totalCountShop()
	 * 인자 : 없음
	 * 리턴형 : ChartsVO
 	 * 사용 : chartsDAO에 있는 함수 totalCountShop()를 호출하여,
	 * 		받아온 값을 Controller에 리턴하는 함수
	 */
	@Override
	public ChartsVO totalCountShop() {
		return chartsDAO.totalCountShop();
	}

}
