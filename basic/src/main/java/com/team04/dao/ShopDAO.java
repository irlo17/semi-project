package com.team04.dao;

import java.util.HashMap;
import java.util.List;

import com.team04.domain.ShopVO;

// Shop(가게 테이블) Repository 인터페이스
public interface ShopDAO {
	
	//가게 상세 리스트 페이지 조회
	public List<ShopVO> shopPageGetList(String query);
	
	//가게 상세 리스트 필터값 까지 된거...
	public List<ShopVO> shopPageFilterGetList(HashMap map);
	
	//사이드바 필터창
	List<ShopVO> shopPageFilterGetList2(HashMap map);

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
