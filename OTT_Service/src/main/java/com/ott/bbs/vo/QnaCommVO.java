package com.ott.bbs.vo;

//	QNA 게시판 댓글 VO
public class QnaCommVO {
	
	private String c_idx; 		// 	게시판 idx
	private String a_content; 	// 	글 내용
	private String answer_date; 	// 	글 쓴 날짜
	private String rb_idx;		//	원글의 idx
	
	private String c_status;	//	1 : 삭제
								//	0 : 삭제 아님
	//=============================================================
	
	private String om_idx;		//	관리자 idx(FK)
	private String manager_id;	//	관리자 아이디

	
	public String getC_status() {
		return c_status;
	}
	public void setC_status(String c_status) {
		this.c_status = c_status;
	}
	public String getC_idx() {
		return c_idx;
	}
	public void setC_idx(String c_idx) {
		this.c_idx = c_idx;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}
	public String getRb_idx() {
		return rb_idx;
	}
	public void setRb_idx(String rb_idx) {
		this.rb_idx = rb_idx;
	}
	public String getOm_idx() {
		return om_idx;
	}
	public void setOm_idx(String om_idx) {
		this.om_idx = om_idx;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	
	
	
	
	

	
}

