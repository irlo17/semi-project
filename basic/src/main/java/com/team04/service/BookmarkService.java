package com.team04.service;

import java.util.HashMap;
import java.util.List;

import com.team04.domain.BookmarkVO;
import com.team04.domain.HeartVO;
import com.team04.domain.MylistVO;
import com.team04.domain.PagingVO;

public interface BookmarkService {

	public List<BookmarkVO> bookmarkGetList(HashMap map);
	
	
	/** 공개 여부가 "yes" 이고 키워드 검색 후 레코드 전체 검색 
	 */
	public int bookmarkListCount(HashMap map);
	
	public List<BookmarkVO> bookmarkGetBestList();
	
	/** 나만의 즐겨찾기 총 개수 구하기
	 * 	- 페이징을 위해 DB에 입력된 회원의 즐겨찾기 총 개수를 구함
	 */
	public int bookmarkMylistTotalCount(PagingVO paging);
	
	// 디폴트 리스트 구하기
	public BookmarkVO defultListSearch(BookmarkVO vo);
	
	
	public List<BookmarkVO> bookmarkGetMylistPaging(PagingVO paging);	

	public List<BookmarkVO> bookmarkGetMylist(String memberEmail);	
	
	public List<MylistVO> bookmarkGetMylistDetail(String listNumber);	
	
	public BookmarkVO bookmarkGetDetail(String listNumber);
	 
	public void bookmarkModify(BookmarkVO vo);
	
	public void bookmarkDelete(String listNumber);
	
	public int mylistUpdate(MylistVO vo);
	
	public void mylistDelete(MylistVO vo);
	
	
	
	public void mylistAdd(BookmarkVO vo);
	
	public BookmarkVO imageSelectBestBookmark(int listNumber);
	
	public BookmarkVO pictureSaveHeart(HeartVO vo);
	
	public BookmarkVO pictureRemoveHeart(HeartVO vo);
	
	//리스트 안 가게 총 개수 구하기
	public int bookmarkGetMylistTotalCount(PagingVO paging);
	
	public List<MylistVO> bookmarkGetMylistDetailPaging(PagingVO paging);
	
	public HeartVO heartCheak(HeartVO vo);
	
	public BookmarkVO pictureHeartCount(BookmarkVO vo);
	public MylistVO overlapSearch(MylistVO vo);
	
	
}
