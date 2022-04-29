package com.team04.dao;

import java.util.List;

import com.team04.domain.ChartsVO;
import com.team04.domain.MemberVO;

public interface MemberDAO {
	
	/** email 중복 체크
	 * 	- DB에 동일한 이메일이 있는지 레코드 검색
	 */
	MemberVO emailCheck( MemberVO vo );
	
	/** 회원가입
	 * 	- DB에 회원의 정보를 입력
	 */
	int memberInsert(MemberVO vo);
	
	/** 로그인
	 * 	- DB에 입력된 이메일과 비밀번호가 일치하는 레코드 검색
	 */
	MemberVO loginCheck(MemberVO vo);
	
	/** 비밀번호 찾기
	 * 	- DB에 회원 정보 찾기
	 */
	MemberVO pwSearch(MemberVO vo);
	
	/**	비밀번호 변경
	 *  - DB에 동일한 이메일을 가진 회원의 비밀번호를 변경 
	 */
	int pwChange(MemberVO vo);
	
	/** 마이페이지 회원 정보에 출력될 회원 레코드 검색
	 * - DB에서 이메일이 동일한 회원의 정보 찾기
	 */
	MemberVO memberSearch(MemberVO vo);
	
	/**	회원 정보 수정
	 * - DB에 동일한 이메일을 가진 회원의 정보를 수정
	 */
	int memberUpdate(MemberVO vo);
	
	/** 회원 탈퇴
	 * 	- DB에 동일한 이메일과 패스워드를 가진 회원의 레코드를 삭제
	 */
	int memberDelete(MemberVO vo);
	

	
	
	// ----- 관리자페이지 -----
	/** 회원 전체 리스트 출력
	 * 	- DB에 저장된 모든 회원 리스트 가져오기
	 */
	public List<MemberVO> memberGetListManager();

	int memberDeleteManager(MemberVO vo);
	
	int memberDefaultList(MemberVO vo);

}
