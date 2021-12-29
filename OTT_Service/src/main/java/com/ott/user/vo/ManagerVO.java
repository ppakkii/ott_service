package com.ott.user.vo;

import org.springframework.web.multipart.MultipartFile;

public class ManagerVO {
	private String om_idx;			//	관리자 인덱스
	private String manager_id;		//	관리자 아이디
	private String manager_pw;		//	관리자 비밀번호
	private String login_date;		//	로그인 날짜
	private String om_salt;			//	salt
	private String om_status;		//	탈퇴 여부
	
	
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
	public String getManager_pw() {
		return manager_pw;
	}
	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}
	public String getLogin_date() {
		return login_date;
	}
	public void setLogin_date(String login_date) {
		this.login_date = login_date;
	}
	public String getOm_salt() {
		return om_salt;
	}
	public void setOm_salt(String om_salt) {
		this.om_salt = om_salt;
	}
	public String getOm_status() {
		return om_status;
	}
	public void setOm_status(String om_status) {
		this.om_status = om_status;
	}
	
	
	

}
