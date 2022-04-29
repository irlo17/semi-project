package com.team04.service;

import java.util.HashMap;
import java.util.List;

import com.team04.domain.ShopVO;

// Shop(가게 테이블) Service 인터페이스
public interface ShopService {
	
	
	//가게 리스트 페이지에 가게 출력
	List<ShopVO> shopPageGetList(String query);

	//필터 모달창에서 하는 필터링
	List<ShopVO> shopPageFilterGetList(HashMap map);
	
	//사이드 필터창에서 하는 검색
	List<ShopVO>shopPageFilterGetList2(HashMap map);
	
	
	/*
	 * 관리자 페이지
	 */
	
	// 가게 추가
	void shopInsertManager(ShopVO shopVO);
	
	// 가게 수정
	void shopUpdateManager(ShopVO shopVO);
	
	// 가게 삭제
	void shopDeleteManager(ShopVO shopVO);
	
	// 가게 상세 조회
	ShopVO shopGetManager(ShopVO shopVO);
	
	// 가게 전체 리스트 조회

	List<ShopVO> shopGetListManager();



	
}
