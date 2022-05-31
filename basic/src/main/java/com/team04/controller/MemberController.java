package com.team04.controller;


import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team04.domain.MemberVO;
import com.team04.service.MemberService;

/**
 * @author 안정은
 *
 */
@Controller
public class MemberController {
	


	  @RequestMapping("/{step}.do")
	  public String viewPage(@PathVariable String step) {
		  return step;
		  }


	@Autowired
	private MemberService memberService;
	



	/**	회원가입
	 * 	- 회원가입 form에 입력된 값들을 MemberVO에 넣고 넘기기
	 * @param MemberVO vo
	 * @return 로그인폼 페이지로 이동
	 */
	@RequestMapping("memberInsert.do")
	public String memberInsert(MemberVO vo) {
		
		memberService.memberInsert(vo); 
		// 회원가입과 동시에 디폴트 마이 리스트도 생성	
		memberService.memberDefaultList(vo); 
		
		return "redirect:loginForm.do";

	}//end of memberInsert()


	/**	email 중복 체크
	 * 	- DB에 동일한 이메일이 있는지 확인
	 * @param MemberVO vo (memberEmail)
	 * @return String message : "Y"이면 이메일 사용 가능
	 */
	@RequestMapping(value="emailCheck.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String emailCheck(MemberVO vo) {
		MemberVO result = memberService.emailCheck(vo);	// 사용가능한 이메일이면 null값이 넘어옴
		String message = "";	// 이메일 사용 가능 여부를 담을 변수

		if(result == null) { // 검색되는 레코드가 없으면 이메일 사용 가능

			message = "Y";
		}// end of if

		return message;
	}//end of emailCheck()
	


	/**	로그인 하기
	 * 	- DB에 입력된 레코드 중에서 이메일과 패스워드가 같은 레코드 검색
	 * 	- 하나의 레코드가 검색되어야함
	 * @param MemberVO vo (memberEmail, memberPassword)
	 * @return ajax로 이동
	 * 		- 로그인 성공
	 * 		- 로그인 실패
	 */
	@RequestMapping(value="loginCheck.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String loginCheck(MemberVO vo, HttpSession session){
		MemberVO result = memberService.loginCheck(vo);
		
		String message = "";	// 이메일 사용 가능 여부를 담을 변수
		
		if(result == null){
			System.out.println("로그인 실패");
			message = "N";
		}else{
				System.out.println(result.getMemberNickname()+"님 로그인 성공");
				
				// 세션에 필요한 회원의 정보를 저장한다
				session.setAttribute("lognick", result.getMemberNickname());
				session.setAttribute("logemail", result.getMemberEmail());
				session.setAttribute("admin", result.getMemberAdmin());
				session.setMaxInactiveInterval(60*60*24);
		}//end of if

		return message;
	}//end of loginCheck()
	
	/** 로그인 성공 후 쿠키 저장 혹은 페이지 이동
	 * @param 
	 * 		 - MemberVO 로그인 한 이메일이 넘어옴
	 * @return main.do로 이동
	 */
	@RequestMapping("loginMove")
	public String loginMove(MemberVO vo,HttpServletRequest request, HttpServletResponse response) {

			if(vo.isRememberEmail()) {
				// 체크박스에 체크가 되어있다면
				Cookie[] getCookie = request.getCookies();
				
				// 저장되어 있는 쿠키값이 없으면 새로 생성
				if(getCookie == null) {
					Cookie rememberEmail = new Cookie("rememberEmail", vo.getMemberEmail());
					rememberEmail.setMaxAge(60*60*24*30); 	// 30일 지정
					response.addCookie(rememberEmail);
				}else {
					// 저장되어 있는 쿠키값이 있으면 삭제하고 다시 생성
					Cookie removeEmail = new Cookie("rememberEmail", null);
					removeEmail.setMaxAge(0);
					response.addCookie(removeEmail);
					
					Cookie rememberEmail = new Cookie("rememberEmail", vo.getMemberEmail());
					rememberEmail.setMaxAge(60*60*24*30); 	// 30일 지정
					response.addCookie(rememberEmail);
					
				}//end of if - 쿠키가 저장되어 있는지 확인
				
			}else {
				// 체크 박스에 체크가 안되어 있을 때 
				Cookie[] getCookie = request.getCookies(); // 쿠키를 얻어오고
				
				if(getCookie != null) { // 쿠키값이 null이 아니면 쿠키 삭제
					Cookie removeEmail = new Cookie("rememberEmail", null);
					removeEmail.setMaxAge(0);
					response.addCookie(removeEmail);
				}//end of if - 쿠키값이 null값인지 검사
			}//end of if - 체크박스에 체크가 되어있는지
			
			return "redirect:main.do";
	}// end of loginMove()


	/** main 페이지에서 .login-btn 버튼을 눌렀을 때
	 * @return
	 * 		- 세션에 로그인 정보 X : loginForm.do로 이동
	 * 		- 세션에 로그인 정보 O : 마이페이지(회원정보)로 이동
	 */
	@RequestMapping("login.do")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("lognick") == null) {
			return "redirect:loginForm.do";
		}else if(session.getAttribute("admin").toString().equals("N")){
			// (2) 세션에 로그인 정보 O : 일반 회원
			return "redirect:mylist.do?page=1";
		}else {
			//(2)-2 관리자일 때
			return "redirect:dashboardManager.do";
		}

	}// end of login()
	
	
	


	/** 비밀번호 찾기 (이메일 인증)
	 * 	- 사용자가 입력한 이메일로 인증 번호를 발송
	 * @param	MemberVO vo 
	 * @return	랜덤으로 생성한 10자리 인증 번호
	 */
	@RequestMapping(value="emailSend.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String emailSend(MemberVO vo) {
		
		// 발신자의 메일 계정과 비밀번호 설정
		final String user = "memp35@naver.com";
		final String password = "UYMTWG2KVGBH";
		
		StringBuffer randomMessage = new StringBuffer();	// 인증번호를 담을 변수
		
		
		// 인증번호 변수
		
		// Property에 SMTP 서버 정보 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com"); 
		prop.put("mail.smtp.port", 587); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "false"); 
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
		
		// SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}//end of getPasswordAuthentication()
        	});//end of getDefaultInstance()
	      
	    try {
	    	  // Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
	          MimeMessage message = new MimeMessage(session);
	          
	          message.setFrom(new InternetAddress(user));
	
	          //수신자메일주소
	          message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getMemberEmail())); 
	
	          // Subject - 메일 제목
	          message.setSubject("먹생먹사 비밀번호 찾기 인증번호입니다.");

	
	          // 알파벳과 숫자를 혼합하여 10자리의 랜덤 문자열을 만든다
	          char[] characterTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L'
	        		  		,'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X'
	        		  		,'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
	          
	          // characterTable의 길이만큼 랜덤의 인덱스 번호를 추출하기 위함
	          Random random = new Random(System.currentTimeMillis());
	
	          for(int i=0; i<10; i++) {	// 인증번호는 10자리
	        	  
	        	  randomMessage.append(characterTable[random.nextInt(characterTable.length)]);
	
	          }	// end of for 
		
	          // Text - 전송 될 메시지의 내용
	          message.setText("인증번호는 [ " + randomMessage.toString() + " ] 입니다.");
	
	          // 메시지 전송
	          Transport.send(message);
	          System.out.println("메시지 전송 성공");
	          
		      } catch (AddressException e) {
		          e.printStackTrace();
		      } catch (MessagingException e) {
		          e.printStackTrace();
		      }// end of try~catch
		
		
		return randomMessage.toString();
	}//end of pwSearch()
	
	
	@RequestMapping("pwSearch.do")
	public String pwSearch(MemberVO vo) {

		/*	존재하는 회원이면 해당 이메일을 파라메터로 전송
				- 추후에 저장한 이메일을 비밀번호 재설정에서 사용함 */
		
		return "redirect:pwChangeForm.do?memberEmail="+vo.getMemberEmail();
	}//end of pwSearch()



	/** 비밀번호 재설정
	 *  - 로그인 -> 비밀번호 찾기 (회원정보 검색) -> 비밀번호 재설정 페이지가 나옴
	 * @param MemberVO vo 
	 * 			- 이전에 입력한 이메일
	 * 			- 새롭게 변경된 패스워드 입력값
	 * @return 비밀번호 변경이 완료되면 로그인폼 페이지로 넘어감
	 */
	@RequestMapping("pwChange.do")
	public String pwChange(MemberVO vo) {
		memberService.pwChange(vo);

		return "redirect:loginForm.do";

	}//end of pwChange()



	/** 마이페이지 회원 정보에 출력될 회원 레코드 검색
	 * - DB에서 이메일이 동일한 회원의 정보 찾기
	 * 		- HttpSession 로그인한 이메일의 정보
	 * 		- Model 화면에 출력하기 위해
	 * 		- MemberVO vo 이메일의 정보를 담고 mapper로 이동
	 * 		- MemberVO member 결과로 나온 레코드의 정보를 담음
	 * @return
	 */
	@RequestMapping("mypageMember.do")
	public String mypageMember(MemberVO vo, HttpSession session, Model model) {
		vo.setMemberEmail(session.getAttribute("logemail").toString());
		System.out.println(vo.getMemberEmail());
		MemberVO member = memberService.memberSearch(vo);
		model.addAttribute("MemberVO", member);

		return "mypageMember";

	}//end of mypageMember()




	/**	회원 정보 수정
	 * - DB에 동일한 이메일을 가진 회원의 정보를 수정
	 * - 수정 후 닉네임이 변경되었다면 세션에 저장된 닉네임도 변경한다.
	 * @param MemberVO vo
	 * @return mypageMember.do
	 */
	@RequestMapping("memberUpdate.do")
	public String memberUpdate(MemberVO vo, HttpSession session) {
		memberService.memberUpdate(vo);
		if(session.getAttribute("lognick")!=vo.getMemberNickname()) {
			session.setAttribute("lognick", vo.getMemberNickname());
		}

		return "redirect:mypageMember.do";

	}//end if memberUpdate()



	/** 로그아웃
	 * 	- 세션에 속해있는 모든 값들을 제거
	 * @return 
	 * 		- 메인 페이지로 이동
	 */
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
			System.out.println(session.getAttribute("logemail") + "님 로그아웃");
			
			session.invalidate();
			
			return "redirect:main.do";
	}//end of logout()



	/** 회원 탈퇴
	 * 	- DB에 저장된 회원의 레코드를 삭제
	 * @param MemberVO vo
	 * 			- input hidden으로 넘어온 이메일과 패스워드 정보로 회원의 레코드 삭제
	 * 			- 세션에 속해있는 모든 값들을 제거
	 * @return 메인페이지로 이동
	 */
	@RequestMapping("memberDelete.do")
	public String memberDelete(MemberVO vo,HttpServletRequest request,HttpServletResponse response) {
		memberService.memberDelete(vo);
		Cookie[] getCookie = request.getCookies();
		if(getCookie != null) {
			for(Cookie c : getCookie) {
				String value = c.getValue();
				
				// 쿠키값이 있고 탈퇴한 이메일과 값이 동일하다면 쿠키 제거 
				if(value.equals(vo.getMemberEmail())) {
					Cookie removeEmail = new Cookie("rememberEmail", null);
					removeEmail.setMaxAge(0);
					response.addCookie(removeEmail);
				}//end of if
			}//end of for
		}//end of if

		System.out.println(vo.getMemberEmail() + "님 회원 탈퇴 성공");
		HttpSession session = request.getSession();
		
		session.invalidate(); // 세션에 저장된 로그인 정보를 삭제
		
		return "main";	// 회원 탈퇴 시 메인 페이지로 이동

	}//end of memberDelete()

	
	
	// ----- 관리자 -----
	/**
	 * 요청 : memberListManager.do
	 * 메소드명 : memberListManager()
	 * 인자 : Model m (= 뷰페이지에 보내줄 값을 담을 객체)
	 * 리턴형 : String (= 뷰페이지 명)
	 * 사용 : memberService에 있는 함수 memberListManager()를 호출하여,
	 * 		받아온 List를 관리자 memberListManager 뷰페이지로 넘겨주는 함수
	 */
	@RequestMapping("memberListManager.do")
	public String memberListManager(Model m) {
		
		m.addAttribute("memberListManager", memberService.memberGetListManager());
		return "memberListManager";
	}
	
	// 관리자 -> 회원탈퇴
	@RequestMapping("memberDeleteManager.do")
	public String memberDeleteManager(MemberVO vo, Model m) {
		memberService.memberDeleteManager(vo);
		return "redirect:memberListManager.do";
	}


}//end of class
