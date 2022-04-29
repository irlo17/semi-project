package com.team04.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team04.domain.BookmarkVO;
import com.team04.domain.HeartVO;
import com.team04.domain.MemberVO;
import com.team04.domain.MylistVO;
import com.team04.domain.PagingVO;
import com.team04.service.BookmarkServiceImpl;
import com.team04.service.MemberService;

@Controller
public class BookmarkController {

	@Autowired
	private BookmarkServiceImpl bookmarkService;

	@Autowired
	private MemberService memberService;



	@RequestMapping("totalbookmark.do") 
	public String bookmarkGetList( String searchCondition, String searchKeyword, Model model, PagingVO vo) {
		vo.setCountPerPage(10);

		HashMap map = new HashMap(); 
		map.put("searchCondition",searchCondition);
		map.put("searchKeyword",searchKeyword);
		vo.setPageTotalCount(bookmarkService.bookmarkListCount(map));
		
		vo.setStartRow(vo.getPage());
		vo.setEndRow(vo.getPage());
		map.put("startRow", vo.getStartRow());
		map.put("endRow", vo.getEndRow());
		
		List<BookmarkVO> list = bookmarkService.bookmarkGetList( map );
		model.addAttribute("bookmarkList", list);
		model.addAttribute("paging", vo);
		
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		return "totalbookmark";
	}



	@RequestMapping("main.do")
	private String bookmarkGetBestList( Model m) {
		List<BookmarkVO> list= bookmarkService. bookmarkGetBestList();
		ArrayList listNumber = new  ArrayList();
		
		for(BookmarkVO vo:list) {
			listNumber.add(bookmarkService.imageSelectBestBookmark(vo.getListNumber()));
		}
		m.addAttribute("bookmarkList", list);
		m.addAttribute("fileName", listNumber);
		return "main";
	}



	/** 페이징 추가 - 안정은
	 * @return
	 */
	@RequestMapping("mylist.do")
	private String bookmarkGetMylistPaging(Model model,HttpSession session,PagingVO vo, MemberVO mvo, BookmarkVO bvo) {
		vo.setMemberEmail((String)session.getAttribute("logemail"));
		mvo.setMemberEmail((String)session.getAttribute("logemail"));

		// 디폴트 즐겨찾기 검색
		bvo.setMemberEmail((String)session.getAttribute("logemail"));
		BookmarkVO defultList = bookmarkService.defultListSearch(bvo);

		MemberVO member = memberService.memberSearch(mvo);
		model.addAttribute("MemberVO", member);

		vo.setCountPerPage(10);
		vo.setPageTotalCount(bookmarkService.bookmarkMylistTotalCount(vo));
		vo.setStartRow(vo.getPage());
		vo.setEndRow(vo.getPage());

		List<BookmarkVO> list= bookmarkService.bookmarkGetMylistPaging(vo);

		model.addAttribute("paging", vo);
		model.addAttribute("bookmarkList", list);
		model.addAttribute("defultList", defultList);


		return "mylist";
	}



	@RequestMapping("bookmarkDetail.do")
	private String bookmarkGetDetail(String listNumber,Model model, PagingVO vo) {
		vo.setListNumber(listNumber);
		vo.setCountPerPage(6);
		vo.setPageTotalCount(bookmarkService.bookmarkGetMylistTotalCount(vo));
		vo.setStartRow(vo.getPage());
		vo.setEndRow(vo.getPage());
		List<MylistVO> list= bookmarkService.bookmarkGetMylistDetailPaging(vo);
		BookmarkVO bvo= bookmarkService.bookmarkGetDetail(listNumber);
		int listCount= list.size();
		model.addAttribute("listCount", listCount);
		model.addAttribute("paging", vo);
		model.addAttribute("bookmarkList", list);
		model.addAttribute("BookmarkVO", bvo);

		return "bookmarkDetail";
	}



	//bookmarkGetMylistDetail 페이징 추가

	@RequestMapping("mylistDetail.do")
	private String bookmarkGetMylistDetail(String listNumber,Model model, PagingVO vo, MemberVO mvo,HttpSession session) {
		vo.setListNumber(listNumber);

		mvo.setMemberEmail((String)session.getAttribute("logemail"));
		MemberVO member = memberService.memberSearch(mvo);
		model.addAttribute("MemberVO", member);
		vo.setCountPerPage(6);
		vo.setPageTotalCount(bookmarkService.bookmarkGetMylistTotalCount(vo));
		vo.setStartRow(vo.getPage());
		vo.setEndRow(vo.getPage());
		List<MylistVO> list= bookmarkService.bookmarkGetMylistDetailPaging(vo);
		BookmarkVO bvo= bookmarkService.bookmarkGetDetail(listNumber);
		int listCount= list.size();
		model.addAttribute("listCount", listCount);
		model.addAttribute("bookmarkList", list);
		model.addAttribute("paging", vo);
		model.addAttribute("BookmarkVO", bvo);
		return "mylistDetail";
	}

	@RequestMapping("modify1.do")
	public String bookmarkModify(String listNumber, Model model, MemberVO mvo,HttpSession session ) {
		BookmarkVO vo= bookmarkService.bookmarkGetDetail(listNumber);
		model.addAttribute("bookmark", vo);
		mvo.setMemberEmail((String)session.getAttribute("logemail"));
		MemberVO member = memberService.memberSearch(mvo);
		model.addAttribute("MemberVO", member);

		return "modify1";
	}

	@RequestMapping("ModifyListname.do")
	public String bookmarkModifylistName(BookmarkVO vo) {
		bookmarkService.bookmarkModify(vo);
		return "redirect:mylist.do?page=1";
	}

	@RequestMapping("deleteBookmark.do")
	public String bookmarkDelete(String listNumber) {
		bookmarkService.bookmarkDelete(listNumber);
		return "redirect:mylist.do?page=1";
	}

	@RequestMapping("detailModify.do")
	public String mylistModifydetail(String listNumber,Model model,HttpSession session,PagingVO vo, MemberVO mvo) {
		String memberEmail= (String)session.getAttribute("logemail");
		mvo.setMemberEmail((String)session.getAttribute("logemail"));
		MemberVO member = memberService.memberSearch(mvo);
		model.addAttribute("MemberVO", member);
		vo.setListNumber(listNumber);
		vo.setCountPerPage(6);
		vo.setPageTotalCount(bookmarkService.bookmarkGetMylistTotalCount(vo));
		vo.setStartRow(vo.getPage());
		vo.setEndRow(vo.getPage());
		List<MylistVO> list1= bookmarkService.bookmarkGetMylistDetailPaging(vo);
		List<BookmarkVO> list2= bookmarkService.bookmarkGetMylist(memberEmail);
		BookmarkVO bvo= bookmarkService.bookmarkGetDetail(listNumber);
		int listCount= list1.size();
		model.addAttribute("listCount", listCount);
		model.addAttribute("bookmarkModify", list1);
		model.addAttribute("paging", vo);
		model.addAttribute("bookmarkList", list2);	// 모달창 (페이징 없음)
		model.addAttribute("BookmarkVO", bvo);
		return "detailModify";
	}

	@RequestMapping("mylistUpdate.do")
	public String mylistUpdate(MylistVO vo, Model model ) {
		MylistVO mvo=bookmarkService.overlapSearch(vo);
		int result = 0;
		
		if(mvo==null){
			result = bookmarkService.mylistUpdate(vo);

		}
		model.addAttribute("result", result);

		return "redirect:mylistDetail.do?listNumber="+vo.getListNumber2()+"&page=1";
	}

	@RequestMapping("mylistDelete.do")
	public String mylistDelete(MylistVO vo) {
		bookmarkService.mylistDelete(vo);
		return "redirect:mylistDetail.do?listNumber="+vo.getListNumber()+"&page=1";
	}

	@RequestMapping("addPageView.do")
	public String addPageView(MemberVO mvo, HttpSession session, Model model) {
		mvo.setMemberEmail((String)session.getAttribute("logemail"));
		MemberVO member = memberService.memberSearch(mvo);
		model.addAttribute("MemberVO", member);
		return "mylistadd";
	}


	@RequestMapping("mylistadd.do")
	public String mylistAdd(BookmarkVO vo, HttpSession session) {
		vo.setMemberEmail((String)session.getAttribute("logemail"));
		bookmarkService.mylistAdd(vo);

		return "redirect:mylist.do?page=1";
	}


	// 빈하트 클릭시 하트 저장
	@ResponseBody
	@RequestMapping(value = "saveHeart.do" ,produces="application/text;charset=utf-8")
	public String save_heart(int listNumber, HttpSession session) {
		HeartVO hvo = new HeartVO();
		// 게시물 번호 세팅
		hvo.setListNumber(listNumber);
		// 좋아요 누른 사람 nick을 userid로 세팅
		hvo.setMemberEmail((String) session.getAttribute("logemail"));
		// +1된 하트 갯수를 담아오기위함
		BookmarkVO bvo= bookmarkService.pictureSaveHeart(hvo);
		String like =  Integer.toString(bvo.getListLike());
		return like;
	}
	// 꽉찬하트 클릭시 하트 해제
	@ResponseBody
	@RequestMapping(value = "removeHeart.do",produces="application/text;charset=utf-8")
	public String remove_heart( int listNumber, HttpSession session) {
		HeartVO hvo = new HeartVO();
		// 게시물 번호 세팅
		hvo.setListNumber(listNumber);
		// 좋아요 누른 사람 nick을 userid로 세팅
		hvo.setMemberEmail((String) session.getAttribute("logemail"));
		// -1된 하트 갯수를 담아오기위함
		BookmarkVO bvo=  bookmarkService.pictureRemoveHeart(hvo);
		String like =  Integer.toString(bvo.getListLike());
		return like;
	}

	@RequestMapping(value="heartCheak.do",produces="application/text;charset=utf-8")
	@ResponseBody
	public String heartCheak(int listNumber, HttpSession session,HeartVO vo) {
		String message = "";
		//로그인 해야 하트 클릭가능
		if(session.getAttribute("logemail")!=null) {
			// 게시물 번호 세팅
			vo.setListNumber(listNumber);
			// 좋아요 누른 사람 nick을 userid로 세팅
			vo.setMemberEmail((String) session.getAttribute("logemail"));
			vo = bookmarkService.heartCheak(vo);
		}
		if(vo == null) {
			message = "no";
		}else {
			message = "yes";
		}

		return message;
	}

	@RequestMapping(value="heartTotalCount.do",produces="application/text;charset=utf-8")
	@ResponseBody
	public String heartTotalCount(int listNumber,BookmarkVO vo) {
		vo.setListNumber(listNumber);
		vo = bookmarkService.pictureHeartCount(vo);
		String listLike = Integer.toString(vo.getListLike());
		return listLike;
	}



}
