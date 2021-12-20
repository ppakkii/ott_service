package com.ott.dao;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ott.user.vo.UserVO;

@Component
public class FindDAO {
	@Autowired
	private SqlSessionTemplate ss;
	
	public UserVO id_find(String email) {
		return ss.selectOne("user_service.id_find", email);
	}
	
	public UserVO checkUser(String u_id, String u_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_email", u_email);
		
		return ss.selectOne("user_service.checkUser", map);
	}
	
	public int resetPwd(Map<String, String> map) {
		int status = ss.update("user_service.resetPwd", map);
		return status;
	}
}
