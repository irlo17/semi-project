package com.team04.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.team04.domain.MenuVO;
import com.team04.domain.ChartsVO;
import com.team04.domain.FilterFoodKindVO;
import com.team04.domain.FoodKindVO;
import com.team04.domain.FoodPriceVO;
import com.team04.domain.ShopVO;
import com.team04.service.MenuService;
import com.team04.service.ShopService;


// Shop(가게 테이블) Controller 
@Controller
public class ShopController {
	
	
	// ShopService내에 있는 함수를 사용하기 위한 멤버변수 선언
	@Autowired
	private ShopService shopService;
	
	// MenuService내에 있는 함수를 사용하기 위한 멤버변수 선언
	@Autowired
	private MenuService menuService;
			
	/**
	 * 요청 : shopListManager.do
	 * 메소드명 : shopListManager()
	 * 인자 : Model m (= 뷰페이지에 보내줄 값을 담을 객체)
	 * 리턴형 : String (= 뷰페이지 명)
	 * 사용 : ShopServiceImpl에 있는 함수 shopGetListManager()를 호출하여,
	 * 		받아온 List를 관리자 shopListManager 뷰페이지로 넘겨주는 함수
	 */
	@RequestMapping("shopListManager.do")
	public String shopListManager(Model m) {
		List<ShopVO> list = shopService.shopGetListManager();
		m.addAttribute("shopListManager", list);
		return "shopListManager";
	}
	
	/**
	 * 요청 : shopModifyFormManager.do
	 * 메소드명 : shopModifyFormManager()
	 * 인자 : ShopVO shopVO (= 넘어온 shopNumber(PK)를 VO에 담음), Model m (= 뷰페이지에 보내줄 값을 담을 객체)
	 * 리턴형 : String (= 뷰페이지 명)
	 * 사용 : ShopServiceImpl에 있는 함수 shopGetManager()를 호출하여,
	 * 		shopNumber(PK)에 따른 shopVO 내용을 shopModifyFormManager페이지에 출력하는 함수
	 */
	@RequestMapping(value="shopModifyFormManager.do", method=RequestMethod.GET)
	public String shopModifyFormManager(ShopVO shopVO, Model m) {
		m.addAttribute("shopManager", shopService.shopGetManager(shopVO));
		MenuVO menuVO = new MenuVO();
		menuVO.setShopNumber(shopVO.getShopNumber());
		m.addAttribute("menuListManager", menuService.menuGetListManager(menuVO));
		return "shopModifyFormManager";
	}
	
	/**
	 * 요청 : shopInsertManager.do
	 * 메소드명 : shopInsertManager()
	 * 인자 : ShopVO shopVO (= DB로 보낼 값을 자동으로 담도록 인자로 설정)
	 * 리턴형 : String (= redirect 하여 가게 리스트로 보내기 위함)
	 * 사용 : ShopServiceImpl에 있는 함수 shopInsertManager()를 호출하여,
	 * 		DB에 ShopVO에 담겨있는 내용을 shop테이블에 insert하고 shopListManager 페이지로 이동하는 함수
	 */
	@RequestMapping("shopInsertManager.do")
	public String shopInsertManager(ShopVO shopVO) {
		shopService.shopInsertManager(shopVO);
		return "redirect:shopListManager.do";
	}
	
	/**
	 * 요청 : shopDeleteManager.do
	 * 메소드명 : shopDeleteManager()
	 * 인자 : ShopVO shopVO (= 받아온 shopNumber값을 ShopVO에 저장)
	 * 리턴형 : String (= redirect 하여 가게 리스트 페이지로 보내기 위함)
	 * 사용 : ShopServiceImpl에 있는 함수 shopDeleteManager()를 호출하여,
	 * 		DB에 shopNumber가 맞는 데이터를 삭제하고, 리스트 페이지로 돌아감
	 */
	@RequestMapping(value="shopDeleteManager.do", method=RequestMethod.GET)
	public String shopDeleteManager(ShopVO shopVO) {
		// 값이 넘어오는지 확인
		System.out.println(shopVO.getShopNumber());
		
		shopService.shopDeleteManager(shopVO);
		
		return "redirect:shopListManager.do";
	}
	
	
	/**
	 * 요청 : shopUpdateManager.do
	 * 메소드명 : shopUpdateManager()
	 * 인자 : ShopVO shopVO (= 파라메터값 저장)
	 * 리턴형 : String (= 뷰페이지명)
	 * 사용 : ShopService에 있는 함수 shopUpdateManager()를 호출하여,
	 * 		DB에 shopNumber가 맞는 데이터를 수정
	 */
	@RequestMapping("shopUpdateManager.do")
	public String shopUpdateManager(ShopVO shopVO) {
		shopService.shopUpdateManager(shopVO);
		return "redirect:shopListManager.do";
	}

	//가게 리스트 출력
	//가게 리스트페이지에서 가게 출력
	@RequestMapping("listing.do")
	public String shopPageList(String query, ModelMap m, ShopVO vo) {
		
		List<ShopVO> list = shopService.shopPageGetList(query);
		int size = list.size();
		m.addAttribute("shopPageList", list); //jsp쪽으로 보내는 키값
		m.addAttribute("listSize", size);
		return "listing";
	}
	
	
	/**
	 * 가게리스트 페이지 필터링 값 출력
	 * 
	 * @author yangj
	 * @date 2022.04.04
	 * @return listing.jsp Page 리턴
	 */
	@RequestMapping("listingFilter.do")
	public String shopPageFilterGetList(String query, FoodKindVO vo, String shopAddressSi, String shopAddressGu, FoodPriceVO pVo,  ShopVO sVo,Model m) {
		
		HashMap map = new HashMap();
		
		map.put("query", query);
		map.put("foodKind", vo);
		map.put("shopAddressSi", shopAddressSi);
		map.put("shopAddressGu", shopAddressGu);
		map.put("foodPrice", pVo);
		System.out.println("lat "+sVo.getShopLat());
		System.out.println("lon "+sVo.getShopLon());
		
		
		List<ShopVO> list = shopService.shopPageFilterGetList(map);
		
		int size = list.size();
		
		m.addAttribute("shopPageList", list);
		m.addAttribute("listSize", size);
		
		//반환값으로 줘야할것
		//m.addAttribute("거리값",반경 value값);
		
		return "listing";
	}
	
	
	@RequestMapping("listingFilter2.do")
	public String shopPageFilterGetList2(String query2, double myLat, double myLon, double radiusInput, Model m, FilterFoodKindVO fVO) {
		
		HashMap map = new HashMap();		
		map.put("filterFood", fVO);

		ArrayList<Double> resultList = new ArrayList<>();
		List<ShopVO> list = shopService.shopGetListManager();
		List<ShopVO> list2 = new ArrayList<ShopVO>();
		for(ShopVO sVO : list) {
			double lat = Double.parseDouble(sVO.getShopLat());
			double lon = Double.parseDouble(sVO.getShopLon());
			String voo = Integer.toString(sVO.getShopNumber());
			
			Double result = distance(myLat, myLon, lat, lon);
			resultList.add(result);
			map.put("radius", radiusInput);
			map.put("distance", result);
			map.put("shopNumber", voo);
			map.put("query2", query2);
			map.put("sVO", sVO);
			
			//감사합니다 강사님 진짜 정말로....
			List<ShopVO> temp = shopService.shopPageFilterGetList2(map);
			for(ShopVO svo : temp) {
				list2.add(svo);
			}
		}
		
		int size = list2.size();
		
		m.addAttribute("shopPageList", list2);
		m.addAttribute("listSize", size);
		
		System.out.println(resultList);
		return "listing";
	}
	
	
	
	@RequestMapping("listingCancel.do")
	public String shopPageListCancel(ModelMap m) {
		
		
		List<ShopVO> list = shopService.shopGetListManager();
		int size = list.size();
		m.addAttribute("shopPageList", list);
		m.addAttribute("listSize", size);
		return "listing";
	}
	
	
	//내 현재 좌표와 가게의 좌표를 비교해서 두 지점 사이의 거리를 구하는 함수
    private static double distance(double lat1, double lon1, double lat2, double lon2){
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1))* Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))*Math.cos(deg2rad(lat2))*Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60*1.1515*1609.344;
        dist = dist /1000;
        return dist; //단위 km
    }
    
    private static double deg2rad(double deg){
        return (deg * Math.PI/180.0);
    }
    //radian(라디안)을 10진수로 변환
    private static double rad2deg(double rad){
        return (rad * 180 / Math.PI);
    }
	
	

}
