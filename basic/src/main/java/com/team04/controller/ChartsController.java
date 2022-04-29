package com.team04.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.team04.domain.ChartsVO;
import com.team04.service.ChartsService;
import com.team04.service.MemberService;

@Controller
public class ChartsController {

	// 차트 관련 서비스
	@Autowired
	private ChartsService chartsService;
	
	// member (회원 테이블)
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("dashboardManager.do")
	public String dashboardManager(Model m) {
		/**
		 * 사용 : chartsService에 있는 bookmarkDateListManager함수를 호출하여 ChartsVO의 List에 담아
		 * 		궁극적으로는 gson을 이용해 jsonArray를 String형으로 담아 뷰페이지로 보내기
		 */
		List<ChartsVO> list = chartsService.bookmarkDateListManager();
		
		Gson gsonList = new Gson();
		JsonArray jArrayList = new JsonArray();
		
		Iterator<ChartsVO> itList = list.iterator();
		while (itList.hasNext()) {
			ChartsVO cVO = itList.next();
			JsonObject objList = new JsonObject();
			String monthList = "22." + cVO.getList() + "월";
			int cntList = cVO.getCnt();
			
			objList.addProperty("MonthList", monthList);
			objList.addProperty("CountList", cntList);
			jArrayList.add(objList);
		}
		
		String jsonList = gsonList.toJson(jArrayList);
		m.addAttribute("jsonList", jsonList);
		
		/**
		 * 사용 : chartsService에 있는 memberDateListManager함수를 호출하여 ChartsVO의 List에 담아
		 * 		궁극적으로는 gson을 이용해 jsonArray를 String형으로 담아 뷰페이지로 보내기
		 */
		List<ChartsVO> chartsList = chartsService.memberDateListManager();
		
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<ChartsVO> it = chartsList.iterator();
		while (it.hasNext()) {
			ChartsVO cVO = it.next();
			JsonObject object = new JsonObject();
			String month = "22." + cVO.getList() + "월";
			int cntMember = cVO.getCnt();
			
			object.addProperty("Month", month);
			object.addProperty("CountMember", cntMember);
			jArray.add(object);
		}
		
		String json = gson.toJson(jArray);
		m.addAttribute("json", json);
		
		/**
		 * 사용 : 회원 리스트를 담아 뷰페이지로 보내기
		 */
		m.addAttribute("memberListManager", memberService.memberGetListManager());
		
		return "dashboardManager";
	}
	
	
	/**
	 * 요청 : chartsManager.do
	 * 메소드명 : memberDateListManager()
	 * 인자 : Model m (= 뷰페이지에 보내줄 값을 담을 객체)
	 * 리턴형 : String (= 뷰페이지 명)
	 */
	@RequestMapping("chartsManager.do")
	public String chartsManager(Model m) {
		/**
		 * 사용 : chartsService에 있는 bookmarkDateListManager함수를 호출하여 ChartsVO의 List에 담아
		 * 		궁극적으로는 gson을 이용해 jsonArray를 String형으로 담아 뷰페이지로 보내기
		 */
		List<ChartsVO> list = chartsService.bookmarkDateListManager();
		
		Gson gsonList = new Gson();
		JsonArray jArrayList = new JsonArray();
		
		Iterator<ChartsVO> itList = list.iterator();
		while (itList.hasNext()) {
			ChartsVO cVO = itList.next();
			JsonObject objList = new JsonObject();
			String monthList = "22." + cVO.getList() + "월";
			int cntList = cVO.getCnt();
			
			objList.addProperty("MonthList", monthList);
			objList.addProperty("CountList", cntList);
			jArrayList.add(objList);
		}
		
		String jsonList = gsonList.toJson(jArrayList);
		m.addAttribute("jsonList", jsonList);
		
		/**
		 * 사용 : chartsService에 있는 memberDateListManager함수를 호출하여 ChartsVO의 List에 담아
		 * 		궁극적으로는 gson을 이용해 jsonArray를 String형으로 담아 뷰페이지로 보내기
		 */
		List<ChartsVO> chartsList = chartsService.memberDateListManager();
		
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		
		Iterator<ChartsVO> it = chartsList.iterator();
		while (it.hasNext()) {
			ChartsVO cVO = it.next();
			JsonObject object = new JsonObject();
			String month = "22." + cVO.getList() + "월";
			int cntMember = cVO.getCnt();
			
			object.addProperty("Month", month);
			object.addProperty("CountMember", cntMember);
			jArray.add(object);
		}
		
		String json = gson.toJson(jArray);
		m.addAttribute("json", json);
		
		/**
		 * 사용 : chartsService에 있는 foodByShopListManager함수를 호출하여 ChartsVO의 List에 담아
		 * 		궁극적으로는 gson을 이용해 jsonArray를 String형으로 담아 뷰페이지로 보내기
		 */
		List<ChartsVO> shopList = chartsService.foodByShopListManager();
		
		Gson gsonShop = new Gson();
		JsonArray jArrayShop = new JsonArray();
		
		Iterator<ChartsVO> itShop = shopList.iterator();
		while (itShop.hasNext()) {
			ChartsVO cVO = itShop.next();
			JsonObject objShop = new JsonObject();
			String shopFood = cVO.getList();
			int cntShop = cVO.getCnt();
			
			objShop.addProperty("ShopFood", shopFood);
			objShop.addProperty("CountShop", cntShop);
			jArrayShop.add(objShop);
		}
		
		String jsonShop = gsonShop.toJson(jArrayShop);
		m.addAttribute("jsonShop", jsonShop);
		
		/**
		 * 사용 : chartsVO에 담긴 전체 회원 수를 totalConutMember이름으로 뷰페이지로 보냄
		 */
		m.addAttribute("totalCountMember", chartsService.totalCountMember());
		
		/**
		 * 사용 : chartsVO에 담긴 전체 즐겨찾기 리스트 수를 totalCountBookmark이름으로 뷰페이지로 보냄
		 */
		m.addAttribute("totalCountBookmark", chartsService.totalCountBookmark());
		
		/**
		 * 사용 : chartsVO에 담긴 전체 가게 수를 totalCountShop이름으로 뷰페이지로 보냄
		 */
		m.addAttribute("totalCountShop", chartsService.totalCountShop());
		
		return "chartsManager";
	}
	
}
