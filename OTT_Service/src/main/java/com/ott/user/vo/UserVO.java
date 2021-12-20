package com.ott.user.vo;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String u_idx; // 회원번호(고유키)
	private String u_name; // 이름
	private String u_email; // 이메일
	private String u_id; // 아이디
	private String u_pwd1; // 비밀번호
	private int u_level; // 유저 레벨
	private String is_admin; // 관리자인지 아닌지
	private String is_stop; // 정지회원인지 아닌지
	private String is_warning; // 경고회원인지 아닌지
	private int exp; // 유저 경험치(레벨 관련)
	private String auth_key; // 회원가입시 임의값 DB에 저장
	private String auth_status; // ?
	private String mail_check; // 이메일인증 사용자인지 확인
	private String big_fat; // 암호화 salt 값 저장 컬럼
	private String fname; //이미지 중복변경 파일네임
	private String oname; //이미지 원본 파일네임	
	private MultipartFile s_file;//이미지 파일
	private String reviewEA;//유저 리뷰수
	private String idImg;//유저 이미지프로필 없을때 표현
	private String about_me;//소개글
	private String filePath;// 실재 저장 경로
	
	

	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getAbout_me() {
		return about_me;
	}
	public void setAbout_me(String about_me) {
		this.about_me = about_me;
	}
	public String getIdImg() {
		return idImg;
	}
	public void setIdImg(String idImg) {
		this.idImg = idImg;
	}
	public MultipartFile getS_file() {
		return s_file;
	}
	public void setS_file(MultipartFile s_file) {
		this.s_file = s_file;
	}
	public String getReviewEA() {
		return reviewEA;
	}
	public void setReviewEA(String reviewEA) {
		this.reviewEA = reviewEA;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getU_idx() {
		return u_idx;
	}
	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pwd1() {
		return u_pwd1;
	}
	public void setU_pwd1(String u_pwd1) {
		this.u_pwd1 = u_pwd1;
	}
	public int getU_level() {
		return u_level;
	}
	public void setU_level(int u_level) {
		this.u_level = u_level;
	}
	public String getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}
	public String getIs_stop() {
		return is_stop;
	}
	public void setIs_stop(String is_stop) {
		this.is_stop = is_stop;
	}
	public String getIs_warning() {
		return is_warning;
	}
	public void setIs_warning(String is_warning) {
		this.is_warning = is_warning;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
	public String getAuth_status() {
		return auth_status;
	}
	public void setAuth_status(String auth_status) {
		this.auth_status = auth_status;
	}
	public String getMail_check() {
		return mail_check;
	}
	public void setMail_check(String mail_check) {
		this.mail_check = mail_check;
	}
	public String getBig_fat() {
		return big_fat;
	}
	public void setBig_fat(String big_fat) {
		this.big_fat = big_fat;
	}
	
	

}
