package com.ott.bbs.vo;

import java.util.List;

//	QNA 게시판 VO
public class QnaVO {
	
	private String rb_idx; 		// 게시판 idx
	private String subject; 	// 제목
	private String u_id;
	private String content; 	// 글 내용
	private String write_date; 	// 글 쓴 날짜
	private String hit; 		// 조회수
	private String status; 		// 0 : 게시
								// 1 : 삭제
	private String secret;		//	public  : 공개글
								//	private : 비밀글
	private String bname;			//	게시판 종류	QNA/REVIEW

	
	
	private String u_idx; 		// 회원 idx (FK)
	private String u_name;		// 회원 이름
	//	댓글 모음
	private List<QnaCommVO> c_list;

	
	public List<QnaCommVO> getC_list() {
		return c_list;
	}

	public void setC_list(List<QnaCommVO> c_list) {
		this.c_list = c_list;
	}
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getRb_idx() {
		return rb_idx;
	}

	public void setRb_idx(String rb_idx) {
		this.rb_idx = rb_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getU_idx() {
		return u_idx;
	}

	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}


	

	
	
	
	
	
	
	
}
