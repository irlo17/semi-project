package com.team04.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team04.domain.BookmarkVO;
import com.team04.domain.MemberVO;
import com.team04.domain.MylistVO;
import com.team04.domain.PagingVO;
import com.team04.domain.ReportVO;
import com.team04.domain.ReviewVO;
import com.team04.domain.ShopVO;



public interface ListingDetailsDAO {

	/* public List<ReviewVO> listingDetailsGetList(HashMap shopNumber); */
	
	public List<ShopVO> listingDetailsShopInfo(String shopNumber);
	
	public void listingDetailsReviewInsert(HashMap map);
		
	public List<ShopVO> listingDetailsOnlyShopInfo(String shopNumber);
		
	public void listingDetailsAddList(HashMap map);
	 
	public List<MylistVO> listingDetailsTotalList(HashMap map);
	
	public Integer listingDetailsShopListCount(HashMap map);
	
	public List<ReportVO> listingDetailsReport(HashMap map);
	
	public List<MemberVO> listingDetailsProfileRealFname(HashMap map); 
	
	public List<ReviewVO> listingDetailsFromReviewRealFname(String shopNumber);
	
	/*
	 * public int reviewTotalCount(PagingVO paging);*/

	public List<ReviewVO> reviewPaging(Map<String, String> searchParam);
	 
	

	
}
