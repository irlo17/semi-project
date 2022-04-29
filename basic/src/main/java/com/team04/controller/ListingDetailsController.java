package com.team04.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.awt.print.Pageable;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.Part;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team04.domain.MemberVO;
import com.team04.domain.MylistVO;
import com.team04.domain.PagingVO;
import com.team04.domain.ReportVO;
import com.team04.domain.ReviewVO;
import com.team04.domain.ShopVO;
import com.team04.service.ListingDetailsService;

@Controller
public class ListingDetailsController {

	@Autowired
	private ListingDetailsService listingDetailsService;

	/*
	 * @RequestMapping("mylist.do") public String mylist() { return "mylist"; }
	 */

	@RequestMapping("listingDetails.do")
	public String listingDetailsGetList(String shopNumber, Model m, HttpSession session, PagingVO vo)throws NullPointerException {
		/* System.out.println("이동완료"); */
		String logemail = (String) session.getAttribute("logemail");
		

	
		/* 가게 정보를 가져오기위해서 했는데 메뉴판뛰울려고 사용 */
		List<ShopVO> mlist = listingDetailsService.listingDetailsShopInfo(shopNumber);
		m.addAttribute("menuInfo", mlist);
		/* 오직 가게정보만 담김 */
		List<ShopVO> shopInfoList = listingDetailsService.listingDetailsOnlyShopInfo(shopNumber);
		m.addAttribute("shopInfoList", shopInfoList);
		
		
		// 사용자가 그 가게를 추가 했는지 알기위한 쿼리문  즐겨찾기 추가했는지 확인하기위해
		
		if ( logemail == null || logemail.equals("")) {
			
			System.out.println(""+"*******************************************************");
		
			
		} else {
			HashMap map2 = new HashMap();
			map2.put("shopNumber", shopNumber);
			map2.put("logemail", logemail);
			List<MylistVO> totalList = listingDetailsService.listingDetailsTotalList(map2);
		
			
			m.addAttribute("totalList", totalList);
		}
		
		
	
		// 이거 사용안했음
		HashMap map = new HashMap();
		map.put("logemail", logemail);
		Integer shopListCount = listingDetailsService.listingDetailsShopListCount(map);
		m.addAttribute("shopListCount", shopListCount);
		
		//가게 상세페이지에서 리뷰쪽 개인 프로필 사진 보여주기 위해 
		HashMap map3 = new HashMap();
		List<MemberVO> ProfileRealFname =listingDetailsService.listingDetailsProfileRealFname(map3);
		m.addAttribute("ProfileRealFname",ProfileRealFname);
		
		//리뷰사진을 통해 가게 사진에 추가하기
		List<ReviewVO> fromReviewRealFname = listingDetailsService.listingDetailsFromReviewRealFname(shopNumber);
		m.addAttribute("fromReviewRealFname",fromReviewRealFname);
		
	
		  
		
		return "listingDetails";
	}

	
	
	
	
	
	
	
	@RequestMapping("reviewInsert.do")
	public String listingDetailsReviewInsert(HttpServletRequest httpServletRequest, ReviewVO vo, Model m,
			HttpSession session) {

		// 세션으로 이메일을 가져옴
		String logemail = (String) session.getAttribute("logemail");
		// 파라미터로 맛평가랑 가게번호를 가져온다
		String reviewGrade = httpServletRequest.getParameter("reviewGrade");
		String shopNumber = (httpServletRequest.getParameter("shopNumber"));

		String path = session.getServletContext().getRealPath("/");
		
		if ( logemail == null) {
			return "redirect:loginForm.do";
			
		}
		
		HashMap map = new HashMap();

		map.put("reviewContent", vo.getReviewContent());
		map.put("reviewFname", vo.getReviewFname());
		map.put("reviewRealfname", vo.getReviewRealfname());

		map.put("reviewGrade", reviewGrade);
		map.put("logemail", logemail);
		map.put("shopNumber", shopNumber);
		
		
		//리뷰 작성
		listingDetailsService.listingDetailsReviewInsert(map);

	

		return "listingDetails2";
	}

	/*
	 * ajax 사용 세션 : 이메일 파라미터 : 가게번호
	 * 
	 * 
	 */
	@RequestMapping(value = "listingDetailsAddList.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String listingDetailsAddList(@RequestParam("shopNumber") String shopNumber, Model m, HttpSession session) {

		String logemail = (String) session.getAttribute("logemail");

		HashMap map = new HashMap();

		map.put("shopNumber", shopNumber);
		map.put("logemail", logemail);
		
		//ajax 로 즐겨찾기추가
		listingDetailsService.listingDetailsAddList(map);

		return "추가완료";
	}
	
	@RequestMapping("reviewReport.do")
	public String listingDetailsReport(int reviewNumber, ReportVO vo, HttpSession session) {
		String logemail = (String) session.getAttribute("logemail");
		
		if ( logemail == null) {
			return "redirect:loginForm.do";
			
		}
		
		
		HashMap map = new HashMap();
		map.put("reportContent",vo.getReportContent());
		map.put("reviewNumber", reviewNumber);
		map.put("logemail", logemail);
		System.out.println("************************************************************************************"+vo.getReportContent());
		//리뷰 신고기능
		listingDetailsService.listingDetailsReport(map);
		
		
		
		return "listingDetails3";
	}
	// ajax 페이징 실패작
	@RequestMapping(value = "/listingDetails4.do", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String searchMoreNotify(@RequestParam Map<String,String> param , HttpServletRequest httpServletRequest ,  HttpSession sess) throws Exception {
		
		String logemail = (String) sess.getAttribute("logemail");
		
		
		HashMap<String, String> searchParam = new HashMap<String, String>();	// search 파라미터 생성
		String shopNumber =  httpServletRequest.getParameter("shopNumber");
		searchParam.put("logemail", logemail);
		searchParam.put("reviewStartRow", param.get("startIndex"));	
		searchParam.put("reviewEndRow", param.get("endIndex"));
		searchParam.put("shopNumber", shopNumber);
		// startIndex ~ endIndex 범위에 해당하는 list 조회 
		List<ReviewVO> addList = listingDetailsService.reviewPaging(searchParam);
		
		
		
		
		
			
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(addList);
		
		
		
		return jsonStr;		
	}   

}
