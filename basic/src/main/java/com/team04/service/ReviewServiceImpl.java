package com.team04.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.ReviewDAO;
import com.team04.domain.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	
	public List<ReviewVO> reviewGetList(String email){
		return reviewDAO.reviewGetList(email);
	}

	@Override
	public void reviewUpdate(HashMap map) {
		// TODO Auto-generated method stub 작성해야함
		reviewDAO.reviewUpdate(map);
		
	}

	@Override
	public void reviewDelete(HashMap map) {
		// TODO Auto-generated method stub 작성해야함
		reviewDAO.reviewDelete(map);
		
	}
	
	
	/*
	 * public List<ReviewVO> reviewGetList(HashMap map){
	 * 
	 * return ""; }
	 */
	
	

}


