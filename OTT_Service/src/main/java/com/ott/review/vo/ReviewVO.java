package com.ott.review.vo;

public class ReviewVO {

	private int rv_idx;
	private int ott_idx;
	private String u_idx;
	private String content;
	private String rating;
	private String is_good;
	private String is_not;
	private String u_name;
	private String r_date;
	private int status;

	private int u_level;

	public int getU_level() {
		return u_level;
	}

	public void setU_level(int u_level) {
		this.u_level = u_level;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getRv_idx() {
		return rv_idx;
	}

	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
	}

	public int getOtt_idx() {
		return ott_idx;
	}

	public void setOtt_idx(int ott_idx) {
		this.ott_idx = ott_idx;
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

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getIs_good() {
		return is_good;
	}

	public void setIs_good(String is_good) {
		this.is_good = is_good;
	}

	public String getIs_not() {
		return is_not;
	}

	public void setIs_not(String is_not) {
		this.is_not = is_not;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

}