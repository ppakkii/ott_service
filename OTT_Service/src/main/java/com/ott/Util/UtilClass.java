package com.ott.Util;

import com.ott.user.vo.UserVO;

// Util�� �ʿ��� Ŭ������ �ش� ��Ű���� ������ֽø� �˴ϴ�.
public class UtilClass {
	
	public UserVO info (UserVO vo) {
		
		System.out.println("u_idx = "+vo.getU_idx());
		if(vo.getFname().trim().length() < 0) {
			vo.setIdImg(vo.getU_id().substring(0,1));
		}
		System.out.println("오라클 파일 저장 경로"+vo.getFname());
		System.out.println("파일이 없을시 표현할 글"+vo.getIdImg());
		
		
		return vo;
	}
}
