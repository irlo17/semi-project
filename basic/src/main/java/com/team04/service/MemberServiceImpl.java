package com.team04.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.dao.MemberDAOImpl;
import com.team04.domain.ChartsVO;
import com.team04.domain.MemberVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAOImpl memberDAO;

	
	
	/**	email 중복 체크
	 * 	- DB에 동일한 이메일이 있는지 레코드 검색
	 * 	- MemberDAO의 emailCheck() 호출
	 * @param MemberVO vo
	 * @return String 
	 * 			- "Y" : 사용 가능한 이메일
	 * 			- "N" : 사용 불가능한 이메일 (중복된 이메일)
	 */
	@Override
	public MemberVO emailCheck(MemberVO vo) {
		return memberDAO.emailCheck(vo);
	}

	
	
	/**	회원가입
	 *  - DB에 회원의 정보를 입력
	 * 	- MemberDAO의 memberInsert() 호출
	 * @param MemberVO vo
	 * @return int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int memberInsert(MemberVO vo) {
		return memberDAO.memberInsert(vo);
	}
	
	
	
	
	/** 로그인
	 *	- DB에 입력된 이메일과 비밀번호가 일치하는 레코드 검색
	 * 	- MemberDAO의 loginCheck() 호출
	 * @param MemberVO vo
	 * @return MemberVO vo
	 */
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return memberDAO.loginCheck(vo);
	}

	
	
	
	/**	비밀번호 찾기
	 * 	- DB에서 회원 정보 찾기
	 * 	- MemberDAO의 pwSearch() 호출
	 * @param MemberVO vo 
	 * @return MemberVO vo
	 * 			- null O : 비밀번호 재설정 X 
	 * 			- null X : 비밀전호 재설정 O
	 */
	@Override
	public MemberVO pwSearch(MemberVO vo) {
		return memberDAO.pwSearch(vo);
	}

	
	
	
	/** 비밀번호 변경
	 *	- DB에 동일한 이메일을 가진 회원의 비밀번호를 변경 
	 * 	- MemberDAO의 pwChange() 호출
	 * @param MemberVO vo 
	 * @return int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int pwChange(MemberVO vo) {
		return memberDAO.pwChange(vo);
	}
	
	
	/** 마이페이지 회원 정보에 출력될 회원 레코드 검색
	 * - DB에서 이메일이 동일한 회원의 정보 찾기
	 * @param MemberVO vo : memberEmail
	 * @return MemberVO vo : 회원의 레코드
	 */
	@Override
	public MemberVO memberSearch(MemberVO vo) {
		return memberDAO.memberSearch(vo);
	}

	
	
	
	/**	회원 정보 수정
	 * - DB에 동일한 이메일을 가진 회원의 정보를 수정
	 * @param MemberVO vo 
	 * @return int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int memberUpdate(MemberVO vo) {
		return memberDAO.memberUpdate(vo);
	}

	
	
	/** 회원 탈퇴
	 *  - DB에 동일한 이메일과 패스워드를 가진 회원의 레코드를 삭제
	 * @param MemberVO vo 
	 * @return int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int memberDelete(MemberVO vo) {
		return memberDAO.memberDelete(vo);
	}



	@Override
	public int memberDeleteManager(MemberVO vo) {
		return memberDAO.memberDeleteManager(vo);
	}



	@Override
	public int memberDefaultList(MemberVO vo) {
		return memberDAO.memberDefaultList(vo);
	}
	
	
	// ----- 관리자페이지 -----
	/**
	 * 메소드명 : memberGetListManager()
	 * 인자 : 없음
	 * 리턴형 : MemberVO가 담긴 List형
 	 * 사용 : memberDAO에 있는 함수 memberGetListManager()를 호출하여,
	 * 		받아온 List를 Controller에 리턴하는 함수
	 */
	@Override
	public List<MemberVO> memberGetListManager() {
		return memberDAO.memberGetListManager();
	}

	
}
