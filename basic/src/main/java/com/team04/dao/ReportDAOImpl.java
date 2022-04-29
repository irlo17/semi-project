package com.team04.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.domain.ReportVO;

// Report(신고 테이블) Repository 구현 클래스
@Repository
public class ReportDAOImpl implements ReportDAO {

	// mybatis 연동
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void reportInsert(ReportVO reportVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void reportUpdate(ReportVO reportVO) {
		// TODO Auto-generated method stub

	}

	/**
	 * 메소드명 : reportDeleteManager()
	 * 인자 : ReportVO reportVO
	 * 리턴형 : ReportVO(= 조인하여 검색한 내용을 담음)
	 * 사용 : 신고번호에 따른 리뷰번호와 가게번호를 조회하여 ReportVO에 담아 리턴
	 */
	@Override
	public ReportVO reportDeleteManager(ReportVO reportVO) {
		System.out.println("===> reportDAO mybatis reportDeleteManager() 함수 요청");
		return mybatis.selectOne("reportDAO.reportDeleteManager", reportVO);
	}

	@Override
	public ReportVO reportGet(ReportVO reportVO) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	/**
	 * 메소드명 : reportGetListManager()
	 * 인자 : ReportVO reportVO
	 * 리턴형 : ReportVO가 담긴 List
	 * 사용 : 모든 신고 리스트를 조회하여 ReportVO에 담아 List형으로 리턴
	 */
	@Override
	public List<ReportVO> reportGetListManager() {
		System.out.println("====> Mybatis reportGetListManager() 호출");
		return mybatis.selectList("reportDAO.reportGetListManager");
	}

}
