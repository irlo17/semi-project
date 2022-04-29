package com.team04.domain;

public class ReportVO {

	/*
	** 신고 테이블 **
	CREATE TABLE report (
    report_number  NUMBER,
    report_content VARCHAR2(250),
    review_number  NUMBER,
    CONSTRAINT fk_review_number FOREIGN KEY ( review_number )
        REFERENCES review ( review_number )
	);
	 */
	
	// 멤버변수
	private int reportNumber;
	private String reportContent;
	private int reviewNumber;
	
	// 관리자페이지 리뷰내용 띄우기위한 변수
	private String reviewContent;
	
	// 신고삭제와 함께 리뷰도 삭제하기 위한 변수
	private String logemail;
	
	
	// 기본생성자 - 인자없는
	public ReportVO() {
		
	}
	
	// 생성자 - 인자있는
	public ReportVO(int reportNumber, String reportContent, int reviewNumber, String reviewContent, String logemail) {
		super();
		this.reportNumber = reportNumber;
		this.reportContent = reportContent;
		this.reviewNumber = reviewNumber;
		this.reviewContent = reviewContent;
		this.logemail = logemail;
	}
	
	
	// setter & getter
	
	public String getLogemail() {
		return logemail;
	}
	

	public void setLogemail(String logemail) {
		this.logemail = logemail;
	}
	
	public int getReportNumber() {
		return reportNumber;
	}

	public void setReportNumber(int reportNumber) {
		this.reportNumber = reportNumber;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public int getReviewNumber() {
		return reviewNumber;
	}
	public void setReviewNumber(int reviewNumber) {
		this.reviewNumber = reviewNumber;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	
	
}
