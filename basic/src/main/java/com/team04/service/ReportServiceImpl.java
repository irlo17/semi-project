package com.team04.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.ReportDAOImpl;
import com.team04.dao.ReviewDAO;
import com.team04.domain.ReportVO;

// Report(신고 테이블) Service 구현 클래스
@Service
public class ReportServiceImpl implements ReportService {

	// Report(신고 테이블)
	@Autowired
	ReportDAOImpl reportDAO;
	
	// Review(리뷰 테이블)
	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public void reportInsert(ReportVO reportVO) {
		
	}

	@Override
	public void reportUpdate(ReportVO reportVO) {
		
	}

	/**
	 * 메소드명 : reportDeleteManager()
	 * 인자 : ReportVO (= 신고번호가 담긴 VO)
	 * 리턴형 : String (= 뷰 페이지 명)
	 * 사용 : reportDAO에 담긴 reportDeleteManager함수를 요청하여, 조인된 내용을 hashmap에 담아
	 * 		궁극적으로는 reviewDAO에 있는 reviewDelete함수로 리뷰와 report 모두 삭제
	 */
	@Override
	public void reportDeleteManager(ReportVO reportVO) {
		ReportVO rVO = reportDAO.reportDeleteManager(reportVO);
		System.out.println(rVO.getLogemail());
		System.out.println(rVO.getReviewNumber());
		
		HashMap map = new HashMap();
		map.put("logemail", rVO.getLogemail());
		map.put("reviewNumber", rVO.getReviewNumber());
		
		reviewDAO.reviewDelete(map);
	}

	@Override
	public ReportVO reportGet(ReportVO reportVO) {
		return null;
	}

	
	/**
	 * 메소드명 : reportGetList()
	 * 인자 : ReportVO reportVO
	 * 리턴형 : ReportVO가 담긴 List
	 * 사용 : 모든 신고 리스트를 조회하여 ReportVO에 담아 List형으로 리턴된 것을 다시 리턴
	 */
	@Override
	public List<ReportVO> reportGetListManager() {
		return reportDAO.reportGetListManager();
	}

}
