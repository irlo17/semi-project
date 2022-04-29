package com.team04.service;

import java.util.HashMap;
import java.util.List;

import com.team04.domain.ReportVO;

// Report(신고테이블) Service 인터페이스
public interface ReportService {

	// 신고 추가
	void reportInsert(ReportVO reportVO);
	
	// 신고 수정
	void reportUpdate(ReportVO reportVO);
	
	// 신고 삭제
	void reportDeleteManager(ReportVO reportVO);
	
	// 신고 상세 조회
	ReportVO reportGet(ReportVO reportVO);
	
	// 신고 전체 리스트 조회
	List<ReportVO> reportGetListManager();
	
}
