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
		String message = "";
		if(result == null){
			System.out.println("로그인 실패");
			message = "N";
			return message;
		}else{
				System.out.println("*******로그인 성공********");
				session.setAttribute("lognick", result.getMemberNickname());
				session.setAttribute("logemail", result.getMemberEmail());
				session.setAttribute("admin", result.getMemberAdmin());
				session.setMaxInactiveInterval(60*60*24);
				return message;
			}//end of if

		}//end of loginCheck()
	
	/** 로그인 성공 후 페이지 이동
	 * @param HttpSession session -> 세션에 저장된 이메일 값 가져오기
	 * @return main.do로 이동
	 */
	@RequestMapping("loginMove")
	public String loginMove(MemberVO vo,HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			System.out.println(session.getAttribute("logemail")+"로그인");
			System.out.println(vo.isRememberEmail()+"***********확인");
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
					
				}//end of if
				
				
			}else {
				// 체크 박스에 체크가 안되어 있을 때 
				Cookie[] getCookie = request.getCookies(); // 쿠키를 얻어오고
				
				if(getCookie != null) { // 쿠키값이 null이 아니면 쿠키 삭제
					Cookie removeEmail = new Cookie("rememberEmail", null);
					removeEmail.setMaxAge(0);
					response.addCookie(removeEmail);
				}//end of if - 쿠키값이 null값인지 검사
			}//end of if - 체크박스에 체크가 되어있는지
			
			System.out.println(session.getAttribute("logemail")+"***********확인하기 입니다.22222");
			return "redirect:main.do";
	}


	/** main 페이지에서 .login-btn 버튼을 눌렀을 때
	 * @return
	 * 		- 세션에 로그인 정보 X : loginForm.do로 이동
	 * 		- 세션에 로그인 정보 O : 마이페이지(회원정보)로 이동
	 */
	@RequestMapping("login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
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
	
	
	


	/** 비밀번호 찾기
	 * 	- 사용자가 입력한 정보가 DB에 있는지 확인
	 */
	@RequestMapping(value="emailSend.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String emailSend(MemberVO vo) {
		
		final String user = "memp35@naver.com";
		final String password = "UYMTWG2KVGBH";
		
		// 인증번호 변수
		 String random = "";
		
		// SMTP 서버 정보를 설정함
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com"); 
		prop.put("mail.smtp.port", 587); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "false"); 
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
		
      Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
      
      try {
          MimeMessage message = new MimeMessage(session);
          message.setFrom(new InternetAddress(user));

          //수신자메일주소
          message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getMemberEmail())); 

          // Subject - 제목
          message.setSubject("먹생먹사 비밀번호 찾기 인증번호입니다.");
          
          Random ran = new Random();
          
          random = Integer.toString(ran.nextInt());
          System.out.println(random);
          
          // Text - 내용
          message.setText("인증번호는 [ " + random + " ] 입니다.");

          // send the message
          Transport.send(message);
          System.out.println("메시지 전송 성공");
      } catch (AddressException e) {
          e.printStackTrace();
      } catch (MessagingException e) {
          e.printStackTrace();
      }
		
		
		return random;
		
	}//end of pwSearch()
	
	
	@RequestMapping(value="pwSearch.do", produces="application/text;charset=utf-8")
	@ResponseBody
	public String pwSearch(MemberVO vo, HttpSession session) {
		MemberVO result = memberService.pwSearch(vo);
		String message = "";	// 회원 정보 유무를 담을 변수
		
		if(result == null) {
			// 회원정보가 없다는 뜻
			message = "N";
		}

		/*	존재하는 회원이면 해당 이메일을 세션에 저장
				- 추후에 저장한 이메일을 비밀번호 재설정에서 사용함 */
		session.setAttribute("email", vo.getMemberEmail());

		return message;

	}//end of pwSearch()



	/** 비밀번호 재설정
	 *  - 로그인 -> 비밀번호 찾기 (회원정보 검색) -> 비밀번호 재설정 페이지가 나옴
	 * @param MemberVO vo : 패스워드 입력값이 넘어옴
	 * 		- session을 통해서 이메일 정보를 가져옴
	 * @return 비밀번호 변경이 완료되면 로그인폼 페이지로 넘어감
	 */
	@RequestMapping("pwChange.do")
	public String pwChange(MemberVO vo, HttpSession session) {
		vo.setMemberEmail(session.getAttribute("email").toString());
		memberService.pwChange(vo);

		return "redirect:loginForm.do";

	}//end of pwChange()



	/** 마이페이지 회원 정보에 출력될 회원 레코드 검색
	 * - DB에서 이메일이 동일한 회원의 정보 찾기
	 * 		- HttpSession 로그인한 이메일의 정보
	 * 		- Model 화면에 출력하기 위해
	 * 		- MemberVO member 결과로 나온 레코드의 정보를 담음
	 * 		- MemberVO vo 이메일의 정보를 담고 mapper로 이동
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
	 * 	- 세션에 저장된 회원의 이메일과 닉네임을 삭제
	 * @return 
	 * 		- 메인
	 */
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
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
	 * 			- 세션에 저장된 로그인 정보 삭제
	 * @return 메인페이지로 이동
	 */
	@RequestMapping("memberDelete.do")
	public String memberDelete(MemberVO vo,HttpServletRequest request,HttpServletResponse response) {
		memberService.memberDelete(vo);
		// 쿠키가 있다면
		Cookie[] getCookie = request.getCookies();
		if(getCookie != null) {
			for(Cookie c : getCookie) {
				String value = c.getValue();
				
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
