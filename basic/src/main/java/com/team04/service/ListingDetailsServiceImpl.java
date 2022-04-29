package com.team04.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.ListingDetailsDAO;
import com.team04.domain.BookmarkVO;
import com.team04.domain.MemberVO;
import com.team04.domain.MylistVO;
import com.team04.domain.PagingVO;
import com.team04.domain.ReportVO;
import com.team04.domain.ReviewVO;
import com.team04.domain.ShopVO;

@Service("listingDetailsService")
public class ListingDetailsServiceImpl implements ListingDetailsService{

	@Autowired
	private ListingDetailsDAO listingDetailsDAO;
	
	
	/*
	 * public List<ReviewVO> listingDetailsGetList(HashMap shopNumber) {
	 * 
	 * 
	 * return listingDetailsDAO.listingDetailsGetList(shopNumber); }
	 */
		
	 public List<ShopVO> listingDetailsShopInfo(String shopNumber){
		 
		 return listingDetailsDAO.listingDetailsShopInfo(shopNumber);
	 }
	 
	 public void listingDetailsReviewInsert(HashMap map) {
		 listingDetailsDAO.listingDetailsReviewInsert(map);
		 
	 }
	 
	 public List<ShopVO> listingDetailsOnlyShopInfo(String shopNumber) {
		 
		 return listingDetailsDAO.listingDetailsOnlyShopInfo(shopNumber);
	 }
		
	 public void listingDetailsAddList(HashMap map) {
			/* System.out.println("넌 서비스란다" + map.get("shopNumber")); */
		 listingDetailsDAO.listingDetailsAddList(map);
	 }
	 
	public List<MylistVO> listingDetailsTotalList(HashMap map){
		return listingDetailsDAO.listingDetailsTotalList(map);
	}
	
	public Integer listingDetailsShopListCount(HashMap map){
		return listingDetailsDAO.listingDetailsShopListCount(map);
	}
	
	public List<ReportVO> listingDetailsReport(HashMap map){
		return listingDetailsDAO.listingDetailsReport(map);
	}
	
	public List<MemberVO> listingDetailsProfileRealFname(HashMap map){
		return listingDetailsDAO.listingDetailsProfileRealFname(map);
	}
	public List<ReviewVO> listingDetailsFromReviewRealFname(String shopNumber){
		return listingDetailsDAO.listingDetailsFromReviewRealFname(shopNumber);
	}
	
	/*
	 * public int reviewTotalCount (PagingVO paging) { return
	 * listingDetailsDAO.reviewTotalCount(paging); }
	 */

	
	  public List<ReviewVO> reviewPaging(Map<String, String> searchParam ) { return
	  listingDetailsDAO.reviewPaging(searchParam); }
		

	

	
	
	
	
	
}
