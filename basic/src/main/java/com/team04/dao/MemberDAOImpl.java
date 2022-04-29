package com.team04.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.domain.ChartsVO;
import com.team04.domain.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate memberMybatis;

	

	/** email 중복 체크
	 * 	- DB에 동일한 이메일이 있는지 레코드 검색
	 * 	- MemberMapper의 #emailCheck 호출
	 * @param MemberVO vo (memberEmail)
	 * @return MemberVO vo
	 * 			- null O : 사용가능한 이메일
	 * 			- null X : 중복된 이메일 - 사용 불가능
	 */
	@Override
	public MemberVO emailCheck(MemberVO vo) {
		System.out.println("===> MemberMapper emailCheck 호출 (이메일 중복 검색");
		return memberMybatis.selectOne("memberDAO.emailCheck", vo);
	}

	

	/**	회원가입
	 * 	- DB에 회원의 정보를 입력
	 * 	- MemberMapper의 #memberInsert 호출
	 * @param MemberVO vo
	 * @return int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println("===> MemberMapper memberInsert 호출");
		return memberMybatis.insert("memberDAO.memberInsert", vo);
	}

	

	/** 로그인
	 * 	- DB에 입력된 이메일과 비밀번호가 일치하는 레코드 검색
	 *  - MemberMapper의 #loginCheck 호출
	 * @param MemberVO vo (memberEmail, memberPassword)
	 * @return MemberVO vo
	 * 			- null O : 로그인 실패
	 * 			- null X : 로그인 성공
	 */
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		System.out.println("===> MemberMapper loginCheck 호출");
		return memberMybatis.selectOne("memberDAO.loginCheck", vo);
	}

	

	/**	비밀번호 찾기
	 * 	- DB에서 회원 정보 찾기
	 *  - MemberMapper의 #pwSearch 호출
	 * @param MemberVO vo (memberEmail, memberName, memberTel)
	 * @return MemberVO vo
	 * 			- null O : 비밀번호 재설정 X 
	 * 			- null X : 비밀전호 재설정 O
	 */
	@Override
	public MemberVO pwSearch(MemberVO vo) {
		System.out.println("===> MemberMapper pwSearch 호출");
		return memberMybatis.selectOne("memberDAO.pwSearch", vo);
	}

	

	/**	비밀번호 변경
	 *  - DB에 동일한 이메일을 가진 회원의 비밀번호를 변경 
	 *  - MemberMapper의 #pwChange 호출
	 * @param MemberVO vo (memberEmail, memberPassword)
	 * @return int
	 */
	@Override
	public int pwChange(MemberVO vo) {
		System.out.println("===> MemberMapper pwChange 호출");
		return memberMybatis.update("memberDAO.pwChange", vo);
	}
	

	/** 마이페이지 회원 정보에 출력될 회원 레코드 검색
	 * 	- DB에서 이메일이 동일한 회원의 정보 찾기
	 *  - MemberMapper의 #emailCheck 호출
	 *  	-> 이메일의 중복을 검색하는 emailCheck와 쿼리문이 동일하기 때문
	 * @param MemberVO vo (memberEmail)
	 * @return MemberVO vo : 해당 회원의 레코드
	 */
	@Override
	public MemberVO memberSearch(MemberVO vo) {
		System.out.println("===> MemberMapper emailCheck 호출 (회원 정보 검색)");
		return memberMybatis.selectOne("memberDAO.emailCheck", vo);
	}

	

	/**	회원 정보 수정
	 * - DB에 동일한 이메일을 가진 회원의 정보를 수정
	 * - MemberMapper의 #memberUpdate 호출
	 * @param MemberVO vo 
	 * @return  int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int memberUpdate(MemberVO vo) {
		System.out.println("===> MemberMapper memberUpdate 호출");	
		return memberMybatis.update("memberDAO.memberUpdate", vo);
	}

	
	
	/** 회원 탈퇴
	 *  - DB에 동일한 이메일과 패스워드를 가진 회원의 레코드를 삭제
	 *  - MemberMapper의 #memberDelete 호출
	 * @param MemberVO vo (memberEmail, memberPassword)
	 * @return int ( 입력 성공 시 1을 리턴 )
	 */
	@Override
	public int memberDelete(MemberVO vo) {
		System.out.println("===> MemberMapper memberDelete 호출");	
		return memberMybatis.delete("memberDAO.memberDelete", vo);
	}
	
	
	
	
	// ----- 관리자페이지 -----
	/**
	 * 메소드명 : memberGetListManager()
	 * 인자 : 없음
	 * 리턴형 : MemberVO가 담긴 List형
 	 * 사용 : memberMapper에 있는 memberGetListManager를 호출하여,
	 * 		DB에서 전체 리스트를 검색하고 받아온 List를 리턴하는 함수
	 */
	@Override
	public List<MemberVO> memberGetListManager() {
		System.out.println("===> MemberMapper mybatis memberGetListManager 호출");
		return memberMybatis.selectList("memberDAO.memberGetListManager");
	}


	@Override
	public int memberDeleteManager(MemberVO vo) {
		System.out.println("===> MemberMapper memberDelete 호출");	
		return memberMybatis.delete("memberDAO.memberDeleteManager", vo);
	}



	@Override
	public int memberDefaultList(MemberVO vo) {
		System.out.println("===> MemberMapper memberDefaultList 호출");	
		return memberMybatis.insert("memberDAO.memberDefaultList", vo);
	}


}
