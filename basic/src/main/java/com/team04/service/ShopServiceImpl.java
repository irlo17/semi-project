package com.team04.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.ShopDAOImpl;
import com.team04.domain.ShopVO;

// Shop(가게 테이블) Service 구현 클래스
@Service
public class ShopServiceImpl implements ShopService{
	
	// ShopDAOImpl 에 있는 함수를 사용하기 위한 멤버변수 선언
	@Autowired
	private ShopDAOImpl shopDAO;
	
	public List<ShopVO> shopPageGetList(String query) {
		
		return shopDAO.shopPageGetList(query);
	}
	
	//가게리스트 필터까지 검색해서 불러오는 
	@Override
	public List<ShopVO> shopPageFilterGetList(HashMap map) {
		
		return shopDAO.shopPageFilterGetList(map);
	}
	
	public List<ShopVO>shopPageFilterGetList2(HashMap map) {
		
		return shopDAO.shopPageFilterGetList2(map);
	}
	

	/**
	 * 메소드명 : shopInsertManager()
	 * 인자 : ShopVO shopVO (= 스프링이 자동으로 ShopVO에 담은 값들을 받아옴)
	 * 리턴형 : 없음
	 * 사용 : 지번주소를 나누어서 각각 주소_시, 주소_구, 주소_동에 담고,
	 * 		가게 주소를 도로명주소+상세주소로 담음
	 * 		그리고 ShopDAOImpl에 있는 함수 shopInsertManager()를 호출하여,
	 * 		ShopVO에 담은 값들을 DB에 insert 하도록 하는 변수
	 */
	@Override
	public void shopInsertManager(ShopVO shopVO) {
		
		// 지번주소가 없을 경우가 있을 수 있음!
		String jusoManager = null;
		// 지번주소가 아무것도 들어오지 않을 경우 도로명주소로,
		// 그렇지 않을 경우는 지번주소로
		if (shopVO.getShopAddrJibunManager().equals("")) {
			jusoManager = shopVO.getShopAddrDoroManager();
		}else {
			jusoManager = shopVO.getShopAddrJibunManager();
		}
		// 지번주소의 공백으로 자른 문자열을 배열에 하나씩 담기
		String[] addrManager = jusoManager.split(" ");
		// 시 = 광역시, 도(addr배열의 첫번째)
		shopVO.setShopAddressSi(addrManager[0]);
		// 구 = 도에 속한 시, 광역시의 구(addr배열의 두번째)
		shopVO.setShopAddressGu(addrManager[1]);
		
		// 작성된 도로명주소와 상세주소를 가게 주소로 담기
		if(!shopVO.getShopAddrDetailManager().isEmpty()) {
			// 상세주소가 비어있지 않을 경우 도로명주소와 상세주소를 함께 담고,
			shopVO.setShopAddress(shopVO.getShopAddrDoroManager() + " " + shopVO.getShopAddrDetailManager());
		} else {
			// 그렇지않다면 도로명 주소만 담도록 함
			shopVO.setShopAddress(shopVO.getShopAddrDoroManager());
		}
		
		
		// ***************************************************
		// 가게 영업시간
		String shopTime = shopVO.getShopTime();
		
		String[] time = shopTime.split(" - ");
		
		for(int i=0; i<time.length; i++) {
			System.out.println(time[i]);
		}
		
		shopVO.setShopOpen(time[0]);
		shopVO.setShopClose(time[1]);
		
		// shopDAO에서 shopInsert함수 호출
		shopDAO.shopInsertManager(shopVO);
	}

	/**
	 * 메소드명 : shopUpdateManager()
	 * 인자 : ShopVO shopVO (= 파라메터 )
	 * 리턴형 : 없음
	 * 사용 : ShopDAO에 있는 함수 shopUpdateManager()를 호출하여,
	 * 		shopNumber(PK)가 같은 데이터를 수정
	 */
	@Override
	public void shopUpdateManager(ShopVO shopVO) {
		shopDAO.shopUpdateManager(shopVO);
	}

	/**
	 * 메소드명 : shopDeleteManager()
	 * 인자 : ShopVO shopVO (= shopNumber(PK)가 담긴 VO )
	 * 리턴형 : 없음
	 * 사용 : ShopDAOImpl에 있는 함수 shopDeleteManager()를 호출하여,
	 * 		shopNumber(PK)가 같은 데이터를 삭제하는 함수
	 */
	@Override
	public void shopDeleteManager(ShopVO shopVO) {
		shopDAO.shopDeleteManager(shopVO);
	}

	/**
	 * 메소드명 : shopGetManager()
	 * 인자 : ShopVO shopVO (= shopNumber(PK)가 담긴 VO )
	 * 리턴형 : 없음
	 * 사용 : ShopDAOImpl에 있는 함수 shopGetManager()를 호출하여,
	 * 		shopNumber(PK)가 같은 데이터를 검색하여 ShopVO형태로 리턴
	 */
	@Override
	public ShopVO shopGetManager(ShopVO shopVO) {
		return shopDAO.shopGetManager(shopVO);
	}

	/**
	 * 메소드명 : shopGetListManager()
	 * 인자 : 없음
	 * 리턴형 : ShopVO를 담은 List
	 * 사용 : ShopDAOImpl에 있는 함수 shopGetListManager()를 호출하여,
	 * 		보내온 List형을 다시 리턴하는 함수
	 */
	@Override
	public List<ShopVO> shopGetListManager() {
		return shopDAO.shopGetListManager();
	}


	

}
