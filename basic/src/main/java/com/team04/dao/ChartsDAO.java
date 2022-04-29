package com.team04.dao;

import java.util.List;

import com.team04.domain.ChartsVO;

public interface ChartsDAO {
	
	/** 월별 즐겨찾기 생성날짜 리스트 출력
	 * 	- DB에 저장된 월별 즐겨찾기 리스트 생성 수 가져오기
	 */
	public List<ChartsVO> bookmarkDateListManager();

	/** 월별 가입날짜 리스트 출력
	 * 	- DB에 저장된 회원가입한 월별 갯수 가져오기
	 */
	public List<ChartsVO> memberDateListManager();
	
	/** 음식종류별 가게 리스트 출력
	 * 	- DB에 저장된 음식종류별 가게 수 가져오기
	 */
	public List<ChartsVO> foodByShopListManager();
	
	/** 회원가입한 총 회원 수
	 * 	- DB에 저장된 전체 회원 수 가져오기
	 */
	public ChartsVO totalCountMember();
	
	/** 생성된 총 즐겨찾기 리스트 수
	 * 	- DB에 저장된 생성된 총 즐겨찾기 리스트 수 가져오기
	 */
	public ChartsVO totalCountBookmark();
	
	/** 생성된 총 가게 수
	 * 	- DB에 저장된 총 가게 수 가져오기
	 */
	public ChartsVO totalCountShop();
}
