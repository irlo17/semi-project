package com.team04.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team04.domain.MenuVO;
import com.team04.service.MenuService;

// Menu(메뉴테이블) Controller
@Controller
public class MenuController {

	// Menu(메뉴테이블) Service 연결
	@Autowired
	private MenuService menuService;
	
	/*
	 * 요청 : menuInsertManager.do
	 * 메소드명 : menuInsertManager()
	 * 인자 : MenuVO menuVO (= 파라메터 저장)
	 * 리턴형 : String (= 뷰페이지명)
	 * 사용 : menu에 insert하도록 menuService의 menuInsertManager()함수 호출
	 * 		그와 동시에 뷰페이지에 메뉴 전체 리스트를 보내줌
	 */
	@RequestMapping(value="menuInsertManager.do", produces="application/text;charset=utf-8")
//	@ResponseBody
	public String menuInsertManager(MenuVO menuVO, Model m) {
		// 메뉴테이블에 추가
		menuService.menuInsertManager(menuVO);
		
		// 메뉴 전체 테이블 검색 후 뷰페이지로 전송
		//m.addAttribute("menuListManager", menuService.menuGetListManager(menuVO));
		List<MenuVO> list = menuService.menuGetListManager(menuVO);
		
		m.addAttribute("menuListManager", list);
		
		// list를 json에 담아서 그것을 string으로 변환하여 ajax로 보내는 형식
		// 안씀..
//		JSONArray jsonArray = new JSONArray();
//		 
//		 //json type으로 출력
//		 for (int i = 0; i <list.size(); i++) {
//		  
//		  MenuVO menulist = list.get(i);
//		  
//		  JSONObject jobj = new JSONObject();
//		  jobj.put("shopNumber", menulist.getShopNumber());
//		  jobj.put("menuName", menulist.getMenuName());
//		  jobj.put("menuPrice", menulist.getMenuPrice());
//		 
//		  jsonArray.add(jobj);
//
//		 }
//		 
//		String a = jsonArray.toString();
		
		return "redirect:shopModifyFormManager.do?shopNumber=" + menuVO.getShopNumber();
	}
	
	/*
	 * 요청 : menuDeleteManager.do
	 * 메소드명 : menuDeleteManager()
	 * 인자 : MenuVO menuVO (= 파라메터 저장)
	 * 리턴형 : String (= 뷰페이지명)
	 * 사용 : menuService의 menuDeleteManager()함수 호출하여
	 * 		shopNumber와 menuName가 같은 데이터를 삭제하고 수정페이지로 돌아감
	 */
	@RequestMapping("menuDeleteManager.do")
	public String menuDeleteManager(MenuVO menuVO) {
		menuService.menuDeleteManager(menuVO);
		
		return "redirect:shopModifyFormManager.do?shopNumber=" + menuVO.getShopNumber();
	}
	
}
