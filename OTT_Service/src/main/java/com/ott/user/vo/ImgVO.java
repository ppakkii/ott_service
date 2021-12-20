package com.ott.user.vo;

import org.springframework.web.multipart.MultipartFile;

public class ImgVO {

	private MultipartFile s_file;
	private String u_idx;
	public MultipartFile getS_file() {
		return s_file;
	}
	public void setS_file(MultipartFile s_file) {
		this.s_file = s_file;
	}
	public String getU_idx() {
		return u_idx;
	}
	public void setU_idx(String u_idx) {
		this.u_idx = u_idx;
	}
	
	
}
