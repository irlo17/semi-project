package com.team04.dao;

import java.util.HashMap;
import java.util.List;

import com.team04.domain.ReviewVO;

public interface ReviewDAO {

	public void reviewUpdate( HashMap map);
	
	public void reviewDelete(HashMap map);
	
	public List<ReviewVO> reviewGetList(String email);
	
	
}
