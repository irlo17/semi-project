package com.team04.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.domain.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	public void reviewUpdate(HashMap map) {
		System.out.println("===> Mybatis reviewUpdate() 호출");
		mybatis.update("reviewDAO.reviewUpdate",map);
	}
	
	public void reviewDelete(HashMap map) {
		System.out.println("===> Mybatis reviewDelete() 호출");
		mybatis.delete("reviewDAO.reviewDelete",map);
	}
	
	public List<ReviewVO> reviewGetList(String email){
		
		System.out.println("===> Mybatis reviewGetList() 호출");
		return mybatis.selectList("reviewDAO.reviewGetList",email);
	}
	
	
	
}
