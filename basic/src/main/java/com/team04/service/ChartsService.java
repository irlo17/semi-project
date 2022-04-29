package com.team04.service;

import java.util.List;

import com.team04.domain.ChartsVO;

public interface ChartsService {

	/* ***관리자페이지 월별 즐겨찾기 생성 수 리스트
	 * 		- DB에서 월별 즐겨찾기 생성 수 리스트
	 */
	public List<ChartsVO> bookmarkDateListManager();
	
	/* ***관리자페이지 월별 회원가입 수 차트
	 * 		- DB에서 월별 회원가입 수 리스트
	 */
	public List<ChartsVO> memberDateListManager();
	
	/* ***관리자페이지 음식종류별 가게 수 차트
	 * 		- DB에서 음식종류별 가게 수 리스트
	 */
	public List<ChartsVO> foodByShopListManager();

	/* ***관리자페이지 전체 회원 수
	 * 		- DB에서 전체 회원 수
	 */
	public ChartsVO totalCountMember();
	
	/* ***관리자페이지 전체 즐겨찾기 리스트 수
	 * 		- DB에서 전체 즐겨찾기 리스트 수
	 */
	public ChartsVO totalCountBookmark();
	
	/* ***관리자페이지 전체 가게 수
	 * 		- DB에 저장된 전체 가게 수
	 */
	public ChartsVO totalCountShop();
	
}
