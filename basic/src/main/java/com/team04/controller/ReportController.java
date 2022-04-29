package com.team04.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.team04.domain.ChartsVO;
import com.team04.domain.ReportVO;
import com.team04.service.ReportService;

// Report(신고테이블) Controller
@Controller
public class ReportController {
	
	// ReportService에 있는 함수를 사용하기 위한 멤버변수 선언
	@Autowired
	private ReportService reportService;

	
	// ===== 관리자페이지 =====
	/**
	 * 요청 : reportListManager.do
	 * 메소드명 : reportGetList()
	 * 인자 : Model (= 다음 페이지로 보내기 위한 객체)
	 * 리턴형 : String (= 뷰 페이지 명)
	 * 사용 : reportListManager.do 요청이 들어오면, reportService에 있는 reportGetListManager를 호출하고
	 * 		받아온 List를 뷰페이지로 보내는 함수
	 */
	@RequestMapping("reportListManager.do")
	public String reportGetListManager(Model m) {
		List<ReportVO> list = reportService.reportGetListManager();
		m.addAttribute("reportListManager", list);
		return "reportListManager";
	}
	
	
	
	/**
	 * 요청 : reportDeleteManager.do
	 * 메소드명 : reportGetList()
	 * 인자 : ReportVO (= 신고 리스트를 담을 변수객체), Model (= 다음 페이지로 보내기 위한 객체)
	 * 리턴형 : String (= 뷰 페이지 명)
	 * 사용 : reportDeleteManager.do 요청이 들어오면
	 * 		reportService의 reportDeleteManager함수를 요청하고
	 * 		reportListManager.do 리다이렉트 요청
	 */
	@RequestMapping("reportDeleteManager.do")
	public String reportDeleteManager(ReportVO reportVO, Model m) {
		reportService.reportDeleteManager(reportVO);
		return "redirect:reportListManager.do";
	}
	
}
