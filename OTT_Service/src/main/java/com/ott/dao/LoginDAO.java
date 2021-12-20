package com.ott.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ott.user.vo.UserVO;

@Component
public class LoginDAO {

	@Autowired
	private SqlSessionTemplate ss;

	public int naver_user(UserVO uvo) {

		return ss.insert("user_service.naver_login", uvo);
	}

	public UserVO user_info(String id) {

		return ss.selectOne("user_service.user_info", id);
	}
	
	public UserVO email_info(String email) {
		
		return ss.selectOne("user_service.email_info", email);
	}

	// �씪諛� �쉶�썝媛��엯
	public int user_join(UserVO uvo) {

		return ss.insert("user_service.user_join", uvo);
	}

	// login
	public UserVO login(String u_id, String fat) {

		Map<String, String> map = new HashMap<String, String>();

		map.put("u_id", u_id);
		map.put("u_pwd1", fat);

		UserVO vo = ss.selectOne("user_service.login", map);

		return vo;

	}
	
	// Mail DAO
	public int auth_Key(Map<String, String> map) {

		int auth = ss.update("user_service.auth_Key", map);

		return auth;
	}
	
	public int mail_confirm(Map<String, String> map) {

		int confirm_check = ss.update("user_service.mail_confirm", map);

		return confirm_check;
	}
	// end of Mail DAO

	public int kakao_user(UserVO uvo) {
		return ss.insert("user_service.kakao_login", uvo);
	}
	
//	유저 회원가입 시 기본 EXP 10 설정
	public int default_exp(String u_id) {
		return ss.update("user_service.default_exp",u_id);
	}
}
