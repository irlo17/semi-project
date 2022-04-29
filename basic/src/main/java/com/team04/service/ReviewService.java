package com.team04.service;

import java.util.HashMap;
import java.util.List;

import com.team04.domain.ReviewVO;

public interface ReviewService {
	
	
	// 리뷰 수정
	void reviewUpdate(HashMap map);
	
	
	//리뷰 삭제
	void reviewDelete(HashMap map);
	
	
	//리뷰 목록조회
	List<ReviewVO> reviewGetList(String email);
	
	
}
