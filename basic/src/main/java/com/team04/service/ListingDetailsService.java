package com.team04.service;

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

public interface ListingDetailsService {

	/* List<ReviewVO> listingDetailsGetList(HashMap shopNumber); */
	
	 List<ShopVO> listingDetailsShopInfo(String shopNumber);
	
	 
	  void listingDetailsReviewInsert(HashMap map) ;
	
	  List<ShopVO> listingDetailsOnlyShopInfo(String shopNumber);
			 
	void listingDetailsAddList( HashMap map );

	
	List<MylistVO> listingDetailsTotalList(HashMap map);
	
	Integer listingDetailsShopListCount(HashMap map);
	
	List<ReportVO> listingDetailsReport(HashMap map);
	
	List<MemberVO> listingDetailsProfileRealFname(HashMap map);
	
	List<ReviewVO> listingDetailsFromReviewRealFname(String shopNumber);
	
	
	/* public int reviewTotalCount (PagingVO paging); */
	  
	
	 public List<ReviewVO> reviewPaging (Map<String, String> searchParam);
	
	

}
