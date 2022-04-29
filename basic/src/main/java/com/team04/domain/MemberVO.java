package com.team04.domain;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private String memberEmail;		// 이메일
	private String memberNickname;	// 닉네임
	private String memberPassword;	// 비밀번호
	private String memberName;		// 이름
	private String memberBirth;		// 생년월일
	private String memberTel;		// 휴대전화
	private String memberAdmin;		// 관리자 유무
	private String memberFname;		// 파일명
	private String memberRealfname; // 저장된 파일이름
	
	private String memberDate;		// 회원가입 날짜
	private boolean rememberEmail;	// 이메일 기억하기 여부
	
	MultipartFile memberFile;		// 회원의 프로필 사진 mypageMember.jsp <input type="file" name="memberFile">
	
	// 기본 생성자
	public MemberVO() {}

	// 생성자
	public MemberVO(String memberEmail, String memberNickname, String memberPassword, String memberName,
			String memberBirth, String memberTel, String memberFname, String memberRealfname,
			MultipartFile memberFile, String memberAdmin, String memberDate) {
		super();
		this.memberEmail = memberEmail;
		this.memberNickname = memberNickname;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberTel = memberTel;
		this.memberAdmin = memberAdmin;
		this.memberFname = memberFname;
		this.memberRealfname = memberRealfname;
		this.memberFile = memberFile;
		this.memberAdmin = memberAdmin;
		this.memberDate = memberDate;
	}
	
	
	// getter, setter
	public MultipartFile getMemberFile() {
		return memberFile;
	}
	

	public void setMemberFile(MultipartFile memberFile) {
		this.memberFile = memberFile;
		
		/*
		 * 파일 업로드 작업
		 */
		if(!memberFile.isEmpty()) // 파일이 들어왔을 때만 작업
		{
			this.memberFname = memberFile.getOriginalFilename(); // 사용자가 올리는 파일명
			
			// 실제로 저장되는 파일명
			UUID memberUUID = UUID.randomUUID();
			memberRealfname = memberUUID.toString()+"_"+memberFname;
			
			// 저장 C:\Users\admin\Documents\GitHub\team04
			File memberF = new File("C:\\Users\\admin\\Documents\\GitHub\\team04\\src\\main\\webapp\\resources\\upload\\"+memberRealfname);
			
			//예외처리 필수
			try {
				memberFile.transferTo(memberF);
			} catch (Exception e) {
				e.printStackTrace();
			}//t~c 
		}// end of if
	}
	
	
	
	public String getMemberDate() {
		return memberDate;
	}

	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}

	public String getMemberAdmin() {
		return memberAdmin;
	}

	public void setMemberAdmin(String memberAdmin) {
		this.memberAdmin = memberAdmin;
	}

	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberFname() {
		return memberFname;
	}
	public void setMemberFname(String memberFname) {
		this.memberFname = memberFname;
	}
	public String getMemberRealfname() {
		return memberRealfname;
	}
	public void setMemberRealfname(String memberRealfname) {
		this.memberRealfname = memberRealfname;
	}
	
	public boolean isRememberEmail() {
		return rememberEmail;
	}

	public void setRememberEmail(boolean rememberEmail) {
		this.rememberEmail = rememberEmail;
	}
	
}
